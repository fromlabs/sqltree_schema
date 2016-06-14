// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree_schema/sqltree_schema_generator.dart';

main() async {
  var generator =
      new FileSchemaGenerator("users_schema", "USERSDB", "example/users_schema.g.dart");

  generator.tables.add(new TableDescriptor("USERS")
      ..primaryKeys.addAll(["ID"])
      ..columns.addAll([
        new ColumnDescriptor("ID"),
        new ColumnDescriptor("GROUP_ID"),
        new ColumnDescriptor("AUTHOR_ID"),
        new ColumnDescriptor("REVIEWER_ID"),
        new ColumnDescriptor("PUBLISHER_ID"),
        new ColumnDescriptor("STATUS"),
        new ColumnDescriptor("MAIN_LOCALE"),
        new ColumnDescriptor("CATEGORY"),
        new ColumnDescriptor("TITLE"),
        new ColumnDescriptor("ABSTRACT"),
        new ColumnDescriptor("ABSTRACT_IMAGE_URL"),
        new ColumnDescriptor("BODY"),
        new ColumnDescriptor("PUBLISHING_DATE"),
        new ColumnDescriptor("CREATION_TIMESTAMP")
      ]));

  await generator.generateAndSave();
}
