// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart";

final ExtTypes types = new ExtTypes();

class ExtTypes {
  final String TABLE = "TBL";
  final String COLUMN = "COL";

  ExtTypes() {
    _registerTypes(this);

    _initialize(this);
  }

  void _registerTypes(ExtTypes types) {
    registerNodeType(types.TABLE);
    registerNodeType(types.COLUMN);
  }
}

void _initialize(ExtTypes types) {
  _registerFormatters(types);
}

void _registerFormatters(ExtTypes types) {
  registerNodeFormatter((node, formattedChildren) {
    if (node is SqlTable) {
      return node.name;
    } else if (node is SqlColumn) {
      return node.qualifiedName;
    }
  });
}

abstract class SqlTable implements SqlNode {
  String get name;

  bool get isAliased;

  SqlTable get main;

  SqlTable get target;

  SqlTable alias(String alias);

  SqlColumnList get columns;

  SqlColumnList get pkColumns;

  SqlColumnList get detailColumns;

  SqlNode get as;

  SqlNode get unqualified;

  SqlTable clone({bool freeze});
}

abstract class SqlColumn implements SqlNode {
  String get name;

  String get qualifiedName;

  SqlTable get table;

  bool get isAliased;

  SqlColumn get main;

  SqlColumn get target;

  bool get isPrimaryKey;

  SqlColumn alias(String alias);

  SqlColumn get autoAlias;

  SqlColumn preAlias(String prefix);

  SqlColumn postAlias(String postfix);

  SqlNode get as;

  SqlNode get unqualified;

  SqlNode get parameter;

  SqlNode get equalParameter;

  SqlColumn clone({bool freeze});
}

abstract class SqlColumnList implements CustomSqlNodeList<SqlColumn> {
  SqlColumnList exclude(SqlColumn column0,
      [SqlColumn column1,
      SqlColumn column2,
      SqlColumn column3,
      SqlColumn column4,
      SqlColumn column5,
      SqlColumn column6,
      SqlColumn column7,
      SqlColumn column8,
      SqlColumn column9]);

  SqlColumnList get autoAlias;

  SqlColumnList preAlias(String prefix);

  SqlColumnList postAlias(String postfix);

  SqlNodeList get as;

  SqlNodeList get unqualified;

  SqlNodeList get parameter;

  SqlNodeList get equalParameter;

  SqlColumnList clone({bool freeze});
}
