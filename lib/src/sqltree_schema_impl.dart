// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart" as sql;
import "sqltree_schema.dart";

class SqlColumnListImpl extends sql.CustomSqlNodeListBase<SqlColumn>
    implements SqlColumnList {
  SqlColumnListImpl();

  SqlColumnListImpl.cloneFrom(SqlColumnListImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  sql.SqlNodeList get as {
    sql.SqlNodeList list = new sql.CustomSqlNodeList();

    for (var column in this) {
      list.add(column.as);
    }

    return list;
  }

  @override
  SqlColumnList get autoAlias {
    SqlColumnList list = new SqlColumnListImpl();

    for (var column in this) {
      list.add(column.autoAlias);
    }

    return list;
  }

  @override
  sql.SqlNodeList get equalParameter {
    sql.SqlNodeList list = new sql.CustomSqlNodeList();

    for (var column in this) {
      list.add(column.equalParameter);
    }

    return list;
  }

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

    var list = new SqlColumnListImpl();

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

    return list;
  }

  @override
  sql.SqlNodeList get parameter {
    sql.SqlNodeList list = new sql.CustomSqlNodeList();

    for (var column in this) {
      list.add(column.parameter);
    }

    return list;
  }

  @override
  SqlColumnList postAlias(String postfix) {
    SqlColumnList list = new SqlColumnListImpl();

    for (var column in this) {
      list.add(column.postAlias(postfix));
    }

    return list;
  }

  @override
  SqlColumnList preAlias(String prefix) {
    SqlColumnList list = new SqlColumnListImpl();

    for (var column in this) {
      list.add(column.preAlias(prefix));
    }

    return list;
  }

  @override
  sql.SqlNodeList get unqualified {
    sql.SqlNodeList list = new sql.CustomSqlNodeList();

    for (var column in this) {
      list.add(column.unqualified);
    }

    return list;
  }

  @override
  SqlColumnListImpl createClone(bool freeze) =>
      new SqlColumnListImpl.cloneFrom(this, freeze);
}

abstract class SqlTableImpl extends sql.CustomSqlNodeBase
    implements SqlTable, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final SqlTableImpl target;

  final String name;

  SqlTableImpl(this.name)
      : this.target = null,
        super(types.TABLE, maxChildrenLength: 0);

  SqlTableImpl.aliased(this.name, this.target)
      : super(types.TABLE, maxChildrenLength: 0) {
    if (this.target.isAliased) {
      throw new StateError("Table already aliased: $name");
    }
  }

  SqlTableImpl.cloneFrom(SqlTableImpl target, bool freeze)
      : this.name = target.name,
        this.target = target.target,
        super.cloneFrom(target, freeze);

  @override
  bool get isAliased => target != null && name != target.name;

  @override
  SqlTable get main => isAliased ? target.main : this;

  @override
  SqlTable alias(String alias) => createTableAlias(alias);

  SqlColumn column(String name) {
    var column;
    bool isPrimaryKey = primaryKeyNames.contains(name);
    if (target != null) {
      var targetColumn = target.column(name);
      column =
          new SqlColumnImpl.aliased(name, targetColumn, isPrimaryKey, this);
    } else {
      column = new SqlColumnImpl(name, isPrimaryKey, this);
    }
    return column;
  }

  @override
  SqlColumnList get columns {
    SqlColumnList list = new SqlColumnListImpl();

    for (var name in columnNames) {
      list.add(column(name));
    }

    return list;
  }

  @override
  SqlColumnList get pkColumns {
    SqlColumnList list = new SqlColumnListImpl();

    for (var name in primaryKeyNames) {
      list.add(column(name));
    }

    return list;
  }

  @override
  SqlColumnList get detailColumns {
    SqlColumnList list = new SqlColumnListImpl();

    for (var name in columnNames) {
      if (!primaryKeyNames.contains(name)) {
        list.add(column(name));
      }
    }

    return list;
  }

  @override
  sql.SqlNode get as => this.isAliased ? sql.as(target, name) : this;

  @override
  sql.SqlNode get unqualified => sql.normalize(name).single;

  Set<String> get columnNames;

  Set<String> get primaryKeyNames;

  SqlTable createTableAlias(String alias);

  @override
  createNode() => isRegistered ? this : sql.registerNode(clone());
}

class SqlColumnImpl extends sql.CustomSqlNodeBase
    implements SqlColumn, sql.ChildrenLockingSupport, sql.SqlNodeProvider {
  final SqlTable table;

  final SqlColumn target;

  final String name;

  final bool isPrimaryKey;

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

  @override
  SqlColumn alias(String alias) =>
      new SqlColumnImpl.aliased(alias, this, isPrimaryKey, table);

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
  sql.SqlNode get parameter => sql.parameter(parameterName);

  @override
  String get parameterName => isAliased ? name : "${table.name}.$name";

  @override
  SqlColumn postAlias(String postfix) => this.alias("$name$postfix");

  @override
  SqlColumn preAlias(String prefix) => this.alias("$prefix$name");

  @override
  String get selectName => isAliased ? name : "${main.table.name}.${main.name}";

  @override
  sql.SqlNode get unqualified => sql.normalize(name).single;

  @override
  createNode() => isRegistered ? this : sql.registerNode(clone());

  @override
  SqlColumnImpl createClone(bool freeze) =>
      new SqlColumnImpl.cloneFrom(this, freeze);
}