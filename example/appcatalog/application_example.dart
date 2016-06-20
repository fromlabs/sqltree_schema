// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'application.g.dart';

final Application_Schema DB = DEFAULT_SCHEMA;

main() {
  selectNode("it", "en");
  insertNode();
  updateNode();
  deleteNode();
  selectLocalizedNode("it", "en");
  selectLocalizedItem("it", "en");
}

void selectNode(String currentLocale, String mainLocale) {
  var statement = sql.select(DB.MEASURE.columns)
    ..from(DB.MEASURE)
    ..orderBy(sql.coalesce(
        DB.MEASURE.L_NAMES[currentLocale], DB.MEASURE.L_NAMES[mainLocale]));

  print(sql.prettify(sql.format(statement)));
}

void updateNode() {
  var statement = sql.update(DB.MEASURE)
    ..set(DB.MEASURE.detailColumns.equalParameter)
    ..where(DB.MEASURE.pkColumns.equalParameter);

  print(sql.prettify(sql.format(statement)));
}

void insertNode() {
  var statement = sql.insert(DB.MEASURE)
    ..columns(DB.MEASURE.detailColumns)
    ..values(sql.tuple(DB.MEASURE.detailColumns.parameter));

  print(sql.prettify(sql.format(statement)));
}

void deleteNode() {
  var statement = sql.delete(DB.MEASURE)
    ..where(DB.MEASURE.pkColumns.equalParameter);

  print(sql.prettify(sql.format(statement)));
}

void selectLocalizedNode(String currentLocale, String mainLocale) {
  var statement = sql.select(DB.MEASURE.notLocalizedColumns)
    ..select(DB.MEASURE.localizedColumnGroups
        .map((group) => sql.coalesce(group[currentLocale], group[mainLocale])))
    ..from(DB.MEASURE)
    ..orderBy(sql.asc(sql.coalesce(
        DB.MEASURE.L_NAMES[currentLocale], DB.MEASURE.L_NAMES[mainLocale])));

  print(sql.prettify(sql.format(statement)));
}

void selectLocalizedItem(String currentLocale, String mainLocale) {
  var statement = sql.select(DB.NODE.notLocalizedColumns.as)
    ..select(DB.NODE.localizedColumnGroups.map((group) => sql.as(
        sql.coalesce(group[currentLocale], group[mainLocale]),
        "node.${group.name}")))
    ..select(sql.as(
        sql.coalesce(DB.NODE.alias("classification1").XL_NAMES[currentLocale],
            DB.NODE.alias("classification1").XL_NAMES[mainLocale]),
        "classification1.xl_name"))
    ..select(sql.as(
        sql.coalesce(DB.NODE.alias("classification2").XL_NAMES[currentLocale],
            DB.NODE.alias("classification2").XL_NAMES[mainLocale]),
        "classification2.xl_name"))
    ..from(sql.joins(DB.NODE)
      ..leftJoin(
          DB.NODE.alias("classification1").as,
          sql.equal(DB.NODE.alias("classification1").ID_NODE,
              DB.NODE.C_ID_PARENT_CLASSIFICATION1))
      ..leftJoin(
          DB.NODE.alias("classification2").as,
          sql.equal(DB.NODE.alias("classification2").ID_NODE,
              DB.NODE.C_ID_PARENT_CLASSIFICATION2)))
    ..where(sql.equal(DB.NODE.ID_NODE_TYPE, sql.text("I")));

  print(sql.prettify(sql.format(statement)));
}
