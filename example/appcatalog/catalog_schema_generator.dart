// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree_schema/sqltree_schema_generator.dart';

import "localization/localization_support_generator.dart";

main() async {
  var generator = new LocalizedFileSchemaGenerator("catalog_schema", "CATALOGDB",
      "example/appcatalog/catalog_schema.g.dart");

  generator.tables.add(new LocalizedTableDescriptor("CATALOG")
    ..primaryKeys.addAll(["ID_CATALOG"])
    ..columns.addAll([
      new ColumnDescriptor("ID_CATALOG"),
      new ColumnDescriptor("ID_ITEM_SET"),
      new ColumnDescriptor("ID_PRICE_LIST"),
      new ColumnDescriptor("PUBLIC_CATALOG"),
      new ColumnDescriptor("L_NAME_IT"),
      new ColumnDescriptor("L_NAME_EN"),
      new ColumnDescriptor("L_NAME_DE"),
      new ColumnDescriptor("L_NAME_FR"),
      new ColumnDescriptor("L_NAME_ES"),
      new ColumnDescriptor("L_NAME_PT"),
      new ColumnDescriptor("L_NAME_RU"),
      new ColumnDescriptor("L_NAME_ZH"),
      new ColumnDescriptor("EXTERNAL_ID_REF")
    ])
    ..localizedColumnGroups.addAll(["L_NAME"]));

  await generator.generateAndSave();
}
