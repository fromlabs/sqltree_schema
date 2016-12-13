// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree/sqltree.dart";

import "sqltree_schema_impl.dart";

final ExtTypes schemaTypes = new ExtTypes();

class ExtTypes {
  final String SCHEMA = "SCHEMA";
  final String TABLE = "TABLE";
  final String COLUMN = "COLUMN";

  ExtTypes() {
    types; // serve ad inizializzare prima i formattatori di default

    _registerTypes(this);

    _initialize(this);
  }

  void _registerTypes(ExtTypes schemaTypes) {
    registerNodeType(schemaTypes.SCHEMA, (node) => node is SqlSchemaImpl);
    registerNodeType(schemaTypes.TABLE, (node) => node is SqlTableImpl);
    registerNodeType(schemaTypes.COLUMN, (node) => node is SqlColumnImpl);
  }
}

void _initialize(ExtTypes types) {
  _registerFormatters(types);
}

void _registerFormatters(ExtTypes schemaTypes) {
  registerNodeFormatter((node, formattedChildren) {
    if (node is SqlColumn) {
      return node.qualifiedName;
    } else if (node is SqlTable) {
      return node.qualifiedName;
    } else if (node is SqlSchema) {
      return node.name;
    } else if (types.COLUMNS_CLAUSE == node.type) {
      return formatByRule(
          // TODO deve essere possibile bloccare la formattazione di default dei children
          node.children
              .map((node) => node is SqlColumn ? node.unqualified : node)
              .map((node) => format(node))
              .where((formatted) => formatted?.isNotEmpty ?? false),
          prefix: "(",
          separator: ", ",
          postfix: ")");
    }
    return null;
  });
}

SqlColumnIterable<SqlColumn> column(SqlColumn column0,
        [SqlColumn column1,
        SqlColumn column2,
        SqlColumn column3,
        SqlColumn column4,
        SqlColumn column5,
        SqlColumn column6,
        SqlColumn column7,
        SqlColumn column8,
        SqlColumn column9]) =>
    new DelegatingSqlColumnIterable([
      column0,
      column1,
      column2,
      column3,
      column4,
      column5,
      column6,
      column7,
      column8,
      column9
    ].where((column) => column != null));

abstract class SqlSchema implements SqlNode {
  String get name;

  bool get isDefault;

  SqlSchema clone({bool freeze});
  SqlTable operator [](String tableName);
}

abstract class SqlTable implements SqlNode {
  String get name;

  String get qualifiedName;

  bool get isAliased;

  SqlTable get main;

  SqlTable get target;

  SqlSchema get schema;

  SqlTable alias(String alias);

  SqlColumn operator [](String columnName);

  SqlColumnList<SqlColumn> get columns;

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
  SqlColumnIterable<T> exclude(column0,
      [column1,
      column2,
      column3,
      column4,
      column5,
      column6,
      column7,
      column8,
      column9]);

  SqlColumnIterable<T> get pks;

  SqlColumnIterable<T> get details;

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
