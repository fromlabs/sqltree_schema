// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart";

import "sqltree_schema_impl.dart";

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
    registerNodeType(types.SCHEMA, (node) => node is SqlSchemaImpl);
    registerNodeType(types.TABLE, (node) => node is SqlTableImpl);
    registerNodeType(types.COLUMN, (node) => node is SqlColumnImpl);
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

  SqlSchema clone({bool freeze});
}

abstract class SqlTable implements SqlNode {
  String get name;

  String get qualifiedName;

  bool get isAliased;

  SqlTable get main;

  SqlTable get target;

  SqlSchema get schema;

  SqlTable alias(String alias);

  SqlColumn column(String name);

  SqlColumnList<SqlColumn> get columns;

  SqlColumnList<SqlColumn> get pkColumns;

  SqlColumnList<SqlColumn> get detailColumns;

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

abstract class SqlColumnIterable<T extends SqlColumn>
    implements SqlNodeIterable<T> {
  SqlColumnList exclude(T column0,
      [T column1,
      T column2,
      T column3,
      T column4,
      T column5,
      T column6,
      T column7,
      T column8,
      T column9]);

  SqlColumnIterable<T> get autoAlias;

  SqlColumnIterable<T> preAlias(String prefix);

  SqlColumnIterable<T> postAlias(String postfix);

  SqlNodeIterable<SqlNode> get as;

  SqlNodeIterable<SqlNode> get unqualified;

  SqlNodeIterable<SqlNode> get parameter;

  SqlNodeIterable<SqlNode> get equalParameter;

  /* FROM SQLNODEITERABLE */

  SqlColumnIterable<T> whereReference(String reference);

  SqlColumnIterable<T> whereDeep(bool test(T element));

  SqlColumnIterable<T> expandNodes(Iterable<T> f(T element));

  SqlColumnIterable<T> mapNodes(T f(T element));

  /* FROM ITERABLE */

  SqlColumnIterable<T> skip(int n);

  SqlColumnIterable<T> skipWhile(bool test(T value));

  SqlColumnIterable<T> take(int n);

  SqlColumnIterable<T> takeWhile(bool test(T value));

  SqlColumnList<T> toList({bool growable: true});

  SqlColumnIterable<T> where(bool test(T element));
}

abstract class SqlColumnList<T extends SqlColumn>
    implements SqlColumnIterable<T>, SqlNodeList<T> {
  SqlColumnList<T> clone({bool freeze});

  /* FROM LIST */

  SqlColumnIterable<T> getRange(int start, int end);

  SqlColumnIterable<T> get reversed;

  SqlColumnList<T> sublist(int start, [int end]);

  /* FROM SQLNODEITERABLE */

  SqlColumnIterable<T> whereReference(String reference);

  SqlColumnIterable<T> whereDeep(bool test(T element));

  SqlColumnIterable<T> expandNodes(Iterable<T> f(T element));

  SqlColumnIterable<T> mapNodes(T f(T element));

  /* FROM ITERABLE */

  SqlColumnIterable<T> skip(int n);

  SqlColumnIterable<T> skipWhile(bool test(T value));

  SqlColumnIterable<T> take(int n);

  SqlColumnIterable<T> takeWhile(bool test(T value));

  SqlColumnList<T> toList({bool growable: true});

  SqlColumnIterable<T> where(bool test(T element));
}
