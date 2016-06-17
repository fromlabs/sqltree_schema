// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart" as sql;
import "sqltree_schema.dart";

registerSharedSchema(SqlSchema schema) =>
    sql.registerNode(schema).clone(freeze: true).._share();

abstract class SqlSchemaImpl extends sql.CustomSqlNodeBase
    implements SqlSchema, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final String name;

  final Map<String, SqlTable> _cachedTables = {};

  bool _isShared = false;

  SqlSchemaImpl(this.name) : super(types.SCHEMA, maxChildrenLength: 0);

  SqlSchemaImpl.cloneFrom(SqlSchemaImpl target, bool freeze)
      : this.name = target.name,
        super.cloneFrom(target, freeze);

  @override
  bool get isDefault => name.isEmpty;

  bool get isShared => _isShared;

  void _share() {
    _isShared = true;
  }

  SqlTableImpl createTable(String name);

  SqlTable table(String name) {
    SqlTableImpl table = _cachedTables[name];
    if (table == null) {
      table = createTable(name);

      table = nodeManager.registerNode(table);

      if (isShared) {
        table = table.clone(freeze: true);

        table._share();

        _cachedTables[name] = table;
      }
    }
    return table;
  }

  @override
  createNode() {
    if (isShared) {
      return this.clone(freeze: false);
    } else {
      return this;
    }
  }

  @override
  String toString() => isDefault ? "DEFAULT_SCHEMA" : name;
}

abstract class SqlTableImpl extends sql.CustomSqlNodeBase
    implements SqlTable, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final String name;

  final SqlSchema schema;

  final SqlTableImpl target;

  final Map<String, SqlColumn> _cachedColumns = {};

  final Map<String, SqlTable> _cachedTableAliases = {};

  bool _isShared = false;

  SqlTableImpl(this.name, this.schema)
      : this.target = null,
        super(types.TABLE, maxChildrenLength: 0);

  SqlTableImpl.aliased(this.name, SqlTableImpl target)
      : this.schema = target.schema,
        this.target = target,
        super(types.TABLE, maxChildrenLength: 0) {
    if (this.target.isAliased) {
      throw new StateError("Table already aliased: $name");
    }
  }

  SqlTableImpl.cloneFrom(SqlTableImpl target, bool freeze)
      : this.name = target.name,
        this.schema = target.schema,
        this.target = target.target,
        super.cloneFrom(target, freeze);

  bool get isShared => _isShared;

  void _share() {
    _isShared = true;
  }

  @override
  String get qualifiedName =>
      isAliased || schema.isDefault ? name : "${schema.name}.$name";

  @override
  bool get isAliased => target != null && name != target.name;

  @override
  SqlTable get main => isAliased ? target.main : this;

  @override
  SqlTable alias(String alias) {
    SqlTableImpl table = _cachedTableAliases[alias];
    if (table == null) {
      table = nodeManager.registerNode(createTableAlias(alias));

      if (isShared) {
        table = table.clone(freeze: true);

        table._share();

        _cachedTableAliases[alias] = table;
      }
    }
    return table;
  }

  SqlColumn column(String name) {
    SqlColumnImpl column = _cachedColumns[name];
    if (column == null) {
      bool isPrimaryKey = primaryKeyNames.contains(name);
      if (target != null) {
        var targetColumn = target.column(name);
        column =
            new SqlColumnImpl.aliased(name, targetColumn, isPrimaryKey, this);
      } else {
        column = new SqlColumnImpl(name, isPrimaryKey, this);
      }
      column = nodeManager.registerNode(column);

      if (isShared) {
        column = column.clone(freeze: true);

        column._share();

        _cachedColumns[name] = column;
      }
    }
    return column;
  }

  @override
  SqlColumnList get columns => new DelegatingSqlColumnList(columnNames
      .map((columnName) => column(columnName))
      .toList(growable: false));

  @override
  SqlColumnList get pkColumns => new DelegatingSqlColumnList(columnNames
      .map((primaryKeyName) => column(primaryKeyName))
      .toList(growable: false));

  @override
  SqlColumnList get detailColumns => new DelegatingSqlColumnList(columnNames
      .where((columnName) => !primaryKeyNames.contains(columnName))
      .map((detailName) => column(detailName))
      .toList(growable: false));

  @override
  sql.SqlNode get as =>
      this.isAliased ? sql.as(target, name) : sql.as(this, name);

  @override
  sql.SqlNode get unqualified => sql.normalize(name).single;

  Set<String> get columnNames;

  Set<String> get primaryKeyNames;

  SqlTable createTableAlias(String alias);

  @override
  createNode() {
    if (isShared) {
      return this.clone(freeze: false);
    } else {
      return this;
    }
  }

  @override
  String toString() => name;
}

class SqlColumnImpl extends sql.CustomSqlNodeBase
    implements SqlColumn, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final SqlTable table;

  final SqlColumn target;

  final String name;

  final bool isPrimaryKey;

  final Map<String, SqlColumn> _cachedColumnAliases = {};

  bool _isShared = false;

  SqlColumnImpl(this.name, this.isPrimaryKey, this.table)
      : this.target = null,
        super(types.COLUMN, maxChildrenLength: 0);

  SqlColumnImpl.aliased(
      this.name, SqlColumn target, this.isPrimaryKey, this.table)
      : this.target = target,
        super(types.COLUMN, maxChildrenLength: 0) {
    if (this.target.isAliased) {
      throw new StateError("Column already aliased: $name");
    }
  }

  SqlColumnImpl.cloneFrom(SqlColumnImpl target, bool freeze)
      : this.name = target.name,
        this.isPrimaryKey = target.isPrimaryKey,
        this.target = target.target,
        this.table = target.table,
        super.cloneFrom(target, freeze);

  bool get isShared => _isShared;

  void _share() {
    _isShared = true;
  }

  @override
  SqlColumn alias(String alias) {
    SqlColumnImpl column = _cachedColumnAliases[alias];
    if (column == null) {
      column = nodeManager.registerNode(
          new SqlColumnImpl.aliased(alias, this, isPrimaryKey, table));

      if (isShared) {
        column = column.clone(freeze: true);

        column._share();

        _cachedColumnAliases[alias] = column;
      }
    }
    return column;
  }

  @override
  sql.SqlNode get as =>
      isAliased ? sql.as(target, name) : sql.as(this, qualifiedName);

  @override
  SqlColumn get autoAlias => preAlias("${table.name}_");

  @override
  sql.SqlNode get equalParameter => sql.equal(this, parameter);

  @override
  bool get isAliased => target != null && name != target.name;

  @override
  SqlColumn get main => isAliased || table.isAliased ? target.main : this;

  @override
  sql.SqlNode get parameter => sql.parameter(qualifiedName);

  @override
  String get qualifiedName => isAliased ? name : "${table.name}.$name";

  @override
  SqlColumn postAlias(String postfix) => this.alias("$name$postfix");

  @override
  SqlColumn preAlias(String prefix) => this.alias("$prefix$name");

  @override
  sql.SqlNode get unqualified => sql.normalize(name).single;

  @override
  SqlColumnImpl createClone(bool freeze) =>
      new SqlColumnImpl.cloneFrom(this, freeze);

  @override
  createNode() {
    if (isShared) {
      return this.clone(freeze: false);
    } else {
      return this;
    }
  }

  @override
  String toString() => qualifiedName;
}

class DelegatingSqlColumnIterable
    extends sql.CustomSqlNodeIterableBase<SqlColumn>
    with DelegatingSqlColumnIterableMixin
    implements SqlColumnIterable {
  DelegatingSqlColumnIterable(Iterable<SqlColumn> base) : super(base);
}

class DelegatingSqlColumnList extends sql.CustomSqlNodeListBase<SqlColumn>
    with DelegatingSqlColumnIterableMixin
    implements SqlColumnList {
  DelegatingSqlColumnList(List<SqlColumn> base) : super(base);

  DelegatingSqlColumnList.cloneFrom(DelegatingSqlColumnList target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  DelegatingSqlColumnList createClone(bool freeze) =>
      new DelegatingSqlColumnList.cloneFrom(this, freeze);
}

abstract class DelegatingSqlColumnIterableMixin
    implements SqlColumnIterable, sql.CustomSqlNodeIterableBase<SqlColumn> {
  @override
  bool isAlreadyWrappedIterable(Iterable<SqlColumn> base) =>
      base is DelegatingSqlColumnIterable;

  @override
  bool isAlreadyWrappedList(Iterable<SqlColumn> base) =>
      base is DelegatingSqlColumnList;

  @override
  SqlColumnIterable createIterable(Iterable<SqlColumn> base) =>
      new DelegatingSqlColumnIterable(base);

  @override
  SqlColumnList createList(List<SqlColumn> base) =>
      new DelegatingSqlColumnList(base);

  @override
  SqlColumnList get autoAlias => new DelegatingSqlColumnList(
      map((column) => column.autoAlias).toList(growable: false));

  @override
  sql.SqlNodeList get as =>
      new sql.CustomSqlNodeList.from(map((column) => column.as));

  @override
  sql.SqlNodeList get equalParameter =>
      new sql.CustomSqlNodeList.from(map((column) => column.equalParameter));

  @override
  SqlColumnList exclude(SqlColumn column0,
      [SqlColumn column1,
      SqlColumn column2,
      SqlColumn column3,
      SqlColumn column4,
      SqlColumn column5,
      SqlColumn column6,
      SqlColumn column7,
      SqlColumn column8,
      SqlColumn column9]) {
    var excludedNodes = sql.normalize(column0, column1, column2, column3,
        column4, column5, column6, column7, column8, column9);

    var list = [];

    for (var node in this) {
      bool exclude = false;
      for (var excludeNode in excludedNodes) {
        if (node.name == excludeNode.name &&
            node.table.name == excludeNode.table.name) {
          exclude = true;
          break;
        }
      }
      if (!exclude) {
        list.add(node);
      }
    }

    return new DelegatingSqlColumnList(list);
  }

  @override
  sql.SqlNodeList get parameter =>
      new sql.CustomSqlNodeList.from(map((column) => column.parameter));

  @override
  SqlColumnList postAlias(String postfix) => new DelegatingSqlColumnList(
      map((column) => column.postAlias(postfix)).toList(growable: false));

  @override
  SqlColumnList preAlias(String prefix) => new DelegatingSqlColumnList(
      map((column) => column.preAlias(prefix)).toList(growable: false));

  @override
  sql.SqlNodeList get unqualified =>
      new sql.CustomSqlNodeList.from(map((column) => column.unqualified));
}
