// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart" as sql;
import "sqltree_schema.dart";

registerSharedSchema(SqlSchema schema) => sql.registerNode(schema).share();

abstract class SqlSchemaImpl extends sql.ExtensionSqlNodeBase
    implements SqlSchema, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final String name;

  final Map<String, SqlTable> _cachedTables = {};

  bool _isShared = false;

  SqlSchemaImpl(this.name) : super(schemaTypes.SCHEMA, maxChildrenLength: 0);

  SqlSchemaImpl.cloneFrom(SqlSchemaImpl target, bool freeze)
      : this.name = target.name,
        super.cloneFrom(target, freeze);

  @override
  bool get isDefault => name.isEmpty;

  bool get isShared => _isShared;

  SqlSchema share() => clone(freeze: true).._isShared = true;

  SqlTableImpl createTable(String name);

  SqlTable operator [](String tableName) {
    SqlTableImpl table = _cachedTables[tableName];
    if (table == null) {
      table = createTable(tableName);

      table = nodeManager.registerNode(table);

      if (isShared) {
        table = table.share();

        _cachedTables[tableName] = table;
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
  SqlSchemaImpl clone({bool freeze}) => super.clone(freeze: freeze);

  @override
  String toString() => isDefault ? "DEFAULT_SCHEMA" : name;

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(other) => other is SqlSchema && name == other.name;
}

abstract class SqlTableImpl extends sql.ExtensionSqlNodeBase
    implements SqlTable, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final String name;

  final SqlSchema schema;

  final SqlTableImpl target;

  final Map<String, SqlColumn> _cachedColumns = {};

  final Map<String, SqlTable> _cachedTableAliases = {};

  bool _isShared = false;

  SqlTableImpl(this.name, this.schema)
      : this.target = null,
        super(schemaTypes.TABLE, maxChildrenLength: 0);

  SqlTableImpl.aliased(this.name, SqlTableImpl target)
      : this.schema = target.schema,
        this.target = target,
        super(schemaTypes.TABLE, maxChildrenLength: 0) {
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

  SqlTable share() => clone(freeze: true).._isShared = true;

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
        table = table.share();

        _cachedTableAliases[alias] = table;
      }
    }
    return table;
  }

  SqlColumn operator [](String columnName) {
    SqlColumnImpl column = _cachedColumns[columnName];
    if (column == null) {
      bool isPrimaryKey = primaryKeyNames.contains(columnName);
      if (target != null) {
        var targetColumn = target[columnName];
        column = createColumnAliased(columnName, targetColumn, isPrimaryKey);
      } else {
        column = createColumn(columnName, isPrimaryKey);
      }
      column = nodeManager.registerNode(column);

      if (isShared) {
        column = column.share();

        _cachedColumns[columnName] = column;
      }
    }
    return column;
  }

  SqlColumn createColumn(String name, bool isPrimaryKey) =>
      new SqlColumnImpl(name, isPrimaryKey, this);

  SqlColumn createColumnAliased(
          String name, SqlColumn targetColumn, bool isPrimaryKey) =>
      new SqlColumnImpl.aliased(name, targetColumn, isPrimaryKey, this);

  @override
  SqlColumnList<SqlColumn> get columns => new DelegatingSqlColumnList(columnNames
      .map((columnName) => this[columnName])
      .toList(growable: false));

  @override
  sql.SqlNode get as => isAliased ? sql.as(target, name) : this;

  @override
  sql.SqlNode get unqualified => sql.node(name).single;

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
  SqlTableImpl clone({bool freeze}) => super.clone(freeze: freeze);

  @override
  String toString() => name;

  @override
  int get hashCode => qualifiedName.hashCode;

  @override
  bool operator ==(other) =>
      other is SqlTableImpl && qualifiedName == other.qualifiedName;
}

class SqlColumnImpl extends sql.ExtensionSqlNodeBase
    implements SqlColumn, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final SqlTable table;

  final SqlColumn target;

  final String name;

  final bool isPrimaryKey;

  final Map<String, SqlColumn> _cachedColumnAliases = {};

  bool _isShared = false;

  SqlColumnImpl(this.name, this.isPrimaryKey, this.table)
      : this.target = null,
        super(schemaTypes.COLUMN, maxChildrenLength: 0);

  SqlColumnImpl.aliased(
      this.name, SqlColumn target, this.isPrimaryKey, this.table)
      : this.target = target,
        super(schemaTypes.COLUMN, maxChildrenLength: 0) {
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

  SqlColumn share() => clone(freeze: true).._isShared = true;

  @override
  SqlColumn alias(String alias) {
    SqlColumnImpl column = _cachedColumnAliases[alias];
    if (column == null) {
      column = nodeManager.registerNode(createColumnAlias(alias));

      if (isShared) {
        column = column.share();

        _cachedColumnAliases[alias] = column;
      }
    }
    return column;
  }

  @override
  sql.SqlNode get as => isAliased ? sql.as(target, name) : this;

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
  sql.SqlNode get unqualified => sql.node(name).single;

  @override
  SqlColumnImpl createClone(bool freeze) =>
      new SqlColumnImpl.cloneFrom(this, freeze);

  SqlColumn createColumnAlias(String alias) =>
      new SqlColumnImpl.aliased(alias, this, isPrimaryKey, table);

  @override
  createNode() {
    if (isShared) {
      return this.clone(freeze: false);
    } else {
      return this;
    }
  }

  @override
  SqlColumnImpl clone({bool freeze}) => super.clone(freeze: freeze);

  @override
  String toString() => qualifiedName;

  @override
  int get hashCode => qualifiedName.hashCode;

  @override
  bool operator ==(other) =>
      other is SqlColumnImpl && qualifiedName == other.qualifiedName;
}

class DelegatingSqlColumnIterable<T extends SqlColumn> extends sql
    .ExtensionSqlNodeIterableBase<T> implements SqlColumnIterable<T> {
  DelegatingSqlColumnIterable(Iterable<T> base) : super(base);

  @override
  bool isAlreadyWrappedIterable(Iterable<T> base) =>
      base is DelegatingSqlColumnIterable;

  @override
  bool isAlreadyWrappedList(Iterable<T> base) =>
      base is DelegatingSqlColumnList;

  @override
  SqlColumnIterable<T> createIterable(Iterable<T> base) =>
      new DelegatingSqlColumnIterable<T>(base);

  @override
  SqlColumnList<T> createList(List<T> base) =>
      new DelegatingSqlColumnList<T>(base);

  @override
  SqlColumnIterable<T> get pks => where((column) => column.isPrimaryKey);

  @override
  SqlColumnIterable<T> get details => where((column) => !column.isPrimaryKey);

  @override
  SqlColumnIterable<T> get autoAlias => new DelegatingSqlColumnIterable<T>(
      map((column) => column.autoAlias) as Iterable<T>);

  @override
  SqlColumnIterable<T> postAlias(String postfix) =>
      new DelegatingSqlColumnIterable<T>(
          map((column) => column.postAlias(postfix)) as Iterable<T>);

  @override
  SqlColumnIterable<T> preAlias(String prefix) =>
      new DelegatingSqlColumnIterable<T>(
          map((column) => column.preAlias(prefix)) as Iterable<T>);

  @override
  SqlColumnIterable<T> exclude(column0,
      [column1,
      column2,
      column3,
      column4,
      column5,
      column6,
      column7,
      column8,
      column9]) {
    var excludedNodes = sql
        .node(column0, column1, column2, column3, column4, column5, column6,
            column7, column8, column9)
        .toList(growable: false);

    return new DelegatingSqlColumnIterable<T>(where((column) {
      bool exclude = false;
      for (sql.SqlNode excludeNode in excludedNodes) {
        if (excludeNode is SqlColumn) {
          exclude = column.name == excludeNode.name &&
              column.table.name == excludeNode.table.name;
        } else if (excludeNode.isRawNode) {
          exclude = column.qualifiedName == excludeNode.rawExpression;
        } else {
          throw new UnsupportedError("Exclude column not valid $excludeNode");
        }

        if (exclude) {
          break;
        }
      }
      return !exclude;
    }));
  }

  @override
  sql.SqlNodeIterable<sql.SqlNode> get as =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.as));

  @override
  sql.SqlNodeIterable<sql.SqlNode> get equalParameter =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.equalParameter));

  @override
  sql.SqlNodeIterable<sql.SqlNode> get parameter =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.parameter));

  @override
  sql.SqlNodeIterable<sql.SqlNode> get unqualified =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.unqualified));

  /* FROM SQLNODEITERABLE */

  SqlColumnIterable<T> whereReference(String reference) =>
      super.whereReference(reference);

  SqlColumnIterable<T> whereDeep(bool test(T element)) => super.whereDeep(test);

  SqlColumnIterable<T> expandNodes(Iterable<T> f(T element)) =>
      super.expandNodes(f);

  SqlColumnIterable<T> mapNodes(T f(T element)) => super.mapNodes(f);

  /* FROM ITERABLE */

  SqlColumnIterable<T> skip(int n) => super.skip(n);

  SqlColumnIterable<T> skipWhile(bool test(T value)) => super.skipWhile(test);

  SqlColumnIterable<T> take(int n) => super.take(n);

  SqlColumnIterable<T> takeWhile(bool test(T value)) => super.takeWhile(test);

  SqlColumnList<T> toList({bool growable: true}) =>
      super.toList(growable: growable);

  SqlColumnIterable<T> where(bool test(T element)) => super.where(test);
}

class DelegatingSqlColumnList<T extends SqlColumn>
    extends sql.ExtensionSqlNodeListBase<T> implements SqlColumnList<T> {
  DelegatingSqlColumnList(List<T> base) : super(base);

  DelegatingSqlColumnList.cloneFrom(
      DelegatingSqlColumnList<T> target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  bool isAlreadyWrappedIterable(Iterable<T> base) =>
      base is DelegatingSqlColumnIterable;

  @override
  bool isAlreadyWrappedList(Iterable<T> base) =>
      base is DelegatingSqlColumnList;

  @override
  SqlColumnIterable<T> createIterable(Iterable<T> base) =>
      new DelegatingSqlColumnIterable<T>(base);

  @override
  SqlColumnList<T> createList(List<T> base) =>
      new DelegatingSqlColumnList<T>(base);

  @override
  SqlColumnIterable<T> get pks => where((column) => column.isPrimaryKey);

  @override
  SqlColumnIterable<T> get details => where((column) => !column.isPrimaryKey);

  @override
  SqlColumnIterable<T> get autoAlias => new DelegatingSqlColumnIterable<T>(
      map((column) => column.autoAlias) as Iterable<T>);

  @override
  SqlColumnIterable<T> postAlias(String postfix) =>
      new DelegatingSqlColumnIterable<T>(
          map((column) => column.postAlias(postfix)) as Iterable<T>);

  @override
  SqlColumnIterable<T> preAlias(String prefix) =>
      new DelegatingSqlColumnIterable<T>(
          map((column) => column.preAlias(prefix)) as Iterable<T>);

  @override
  SqlColumnIterable<T> exclude(column0,
      [column1,
      column2,
      column3,
      column4,
      column5,
      column6,
      column7,
      column8,
      column9]) {
    var excludedNodes = sql
        .node(column0, column1, column2, column3, column4, column5, column6,
            column7, column8, column9)
        .toList(growable: false);

    return new DelegatingSqlColumnIterable<T>(where((column) {
      bool exclude = false;
      for (sql.SqlNode excludeNode in excludedNodes) {
        if (excludeNode is SqlColumn) {
          exclude = column.name == excludeNode.name &&
              column.table.name == excludeNode.table.name;
        } else if (excludeNode.isRawNode) {
          exclude = column.qualifiedName == excludeNode.rawExpression;
        } else {
          throw new UnsupportedError("Exclude column not valid $excludeNode");
        }

        if (exclude) {
          break;
        }
      }
      return !exclude;
    }));
  }

  @override
  sql.SqlNodeIterable<sql.SqlNode> get as =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.as));

  @override
  sql.SqlNodeIterable<sql.SqlNode> get equalParameter =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.equalParameter));

  @override
  sql.SqlNodeIterable<sql.SqlNode> get parameter =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.parameter));

  @override
  sql.SqlNodeIterable<sql.SqlNode> get unqualified =>
      new sql.ExtensionSqlNodeIterable(map((column) => column.unqualified));

  @override
  DelegatingSqlColumnList<T> clone({bool freeze}) =>
      super.clone(freeze: freeze);

  @override
  DelegatingSqlColumnList<T> createClone(bool freeze) =>
      new DelegatingSqlColumnList<T>.cloneFrom(this, freeze);

  /* FROM LIST */

  SqlColumnIterable<T> getRange(int start, int end) =>
      super.getRange(start, end);

  SqlColumnIterable<T> get reversed => super.reversed;

  SqlColumnList<T> sublist(int start, [int end]) => super.sublist(start, end);

  /* FROM SQLNODEITERABLE */

  SqlColumnIterable<T> whereReference(String reference) =>
      super.whereReference(reference);

  SqlColumnIterable<T> whereDeep(bool test(T element)) => super.whereDeep(test);

  SqlColumnIterable<T> expandNodes(Iterable<T> f(T element)) =>
      super.expandNodes(f);

  SqlColumnIterable<T> mapNodes(T f(T element)) => super.mapNodes(f);

  /* FROM ITERABLE */

  SqlColumnIterable<T> skip(int n) => super.skip(n);

  SqlColumnIterable<T> skipWhile(bool test(T value)) => super.skipWhile(test);

  SqlColumnIterable<T> take(int n) => super.take(n);

  SqlColumnIterable<T> takeWhile(bool test(T value)) => super.takeWhile(test);

  SqlColumnList<T> toList({bool growable: true}) =>
      super.toList(growable: growable);

  SqlColumnIterable<T> where(bool test(T element)) => super.where(test);
}