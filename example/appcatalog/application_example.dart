// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;
import 'package:sqltree_schema/sqltree_schema.dart';

import 'application.g.dart';

final Application_Schema DB = DEFAULT_SCHEMA;

abstract class SqlLocalizedColumn implements SqlColumn {

}

main() {
  selectLocalizedNode("it", "en");
  // selectNode(true);
  insertNode();
  updateNode();
  deleteNode();
}

void selectNode(String currentLocale) {}

void selectLocalizedNode(String currentLocale, String mainLocale) {
  // TODO devo poter richiamare solo le colonne dei locale che mi servono
  // TODO devo poter richiamare una colonna nei locali che mi servono

  SqlLocalizedColumn DB_MEASURE_NAME = null; // DB.MEASURE.L_NAME;

  var statement = sql.select(DB.MEASURE.columns.where((column) =>
      column is! SqlLocalizedColumn ||
      (column.locale == currentLocale && column.locale == mainLocale)))
    ..from(DB.MEASURE)
    ..orderBy(sql.function("COALESCE", DB_MEASURE_NAME[currentLocale],
        DB_MEASURE_NAME[mainLocale]));

  print(sql.prettify(sql.format(statement)));

  // TODO come recupero poi i campi?
}

void updateNode() {}

void insertNode() {}

void deleteNode() {}
