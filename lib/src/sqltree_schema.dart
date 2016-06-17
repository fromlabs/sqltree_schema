// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart";

final ExtTypes types = new ExtTypes();

class ExtTypes {
  final String SCHEMA = "SCHEMA";
  final String TABLE = "TABLE";
  final String COLUMN = "COLUMN";

  ExtTypes() {
    _registerTypes(this);

    _initialize(this);
  }

  void _registerTypes(ExtTypes types) {
    registerNodeType(types.SCHEMA);
    registerNodeType(types.TABLE);
    registerNodeType(types.COLUMN);
  }
}

void _initialize(ExtTypes types) {
  _registerFormatters(types);
}

void _registerFormatters(ExtTypes types) {
  registerNodeFormatter((node, formattedChildren) {
    if (node is SqlColumn) {
      return node.qualifiedName;
    } else if (node is SqlTable) {
      return node.qualifiedName;
    } else if (node is SqlSchema) {
      return node.name;
    }
    return null;
  });
}

abstract class SqlSchema implements SqlNode {
  String get name;

  bool get isDefault;

  SqlTable table(String name);

  SqlTable clone({bool freeze});
}

abstract class SqlTable implements SqlNode {
  String get name;

  String get qualifiedName;

  bool get isAliased;

  SqlTable get main;

  SqlTable get target;

  SqlSchema get schema;

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

abstract class SqlColumnIterable implements SqlNodeIterable<SqlColumn> {
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

  SqlColumnIterable get autoAlias;

  SqlColumnIterable preAlias(String prefix);

  SqlColumnIterable postAlias(String postfix);

  SqlNodeIterable<SqlNode> get as;

  SqlNodeIterable<SqlNode> get unqualified;

  SqlNodeIterable<SqlNode> get parameter;

  SqlNodeIterable<SqlNode> get equalParameter;

  /* FROM SQLNODEITERABLE */

  SqlColumnIterable whereReference(String reference);

  SqlColumnIterable whereDeep(bool test(SqlColumn element));

  /* FROM ITERABLE */

  SqlColumnIterable expand(Iterable f(SqlColumn element));

  SqlColumnIterable map(f(SqlColumn element));

  SqlColumnIterable skip(int n);

  SqlColumnIterable skipWhile(bool test(SqlColumn value));

  SqlColumnIterable take(int n);

  SqlColumnIterable takeWhile(bool test(SqlColumn value));

  SqlColumnList toList({bool growable: true});

  SqlColumnIterable where(bool test(SqlColumn element));
}

abstract class SqlColumnList
    implements SqlColumnIterable, SqlNodeList<SqlColumn> {
  SqlColumnList clone({bool freeze});

  /* FROM LIST */

  SqlColumnIterable getRange(int start, int end);

  SqlColumnIterable get reversed;

  SqlColumnList sublist(int start, [int end]);
}
