// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'users_schema.dart' as schema;

main() {
  print(sql.prettify(sql.format(
      sql.select(schema.USERS.ID, schema.USERS.columns)..from(schema.USERS))));

  print(sql.prettify(sql.format(sql.select(schema.USERS.columns)
    ..from(schema.USERS)
    ..where(schema.USERS.pkColumns.equalParameter))));

  print(sql.prettify(sql.format(sql.insert(schema.USERS)
    ..columns(schema.USERS.detailColumns)
    ..values(sql.tuple(schema.USERS.detailColumns.parameter)))));

  print(sql.prettify(sql.format(sql.update(schema.USERS)
    ..set(schema.USERS.detailColumns.equalParameter)
    ..where(schema.USERS.pkColumns.equalParameter))));

  print(sql.prettify(sql.format(
      sql.delete(schema.USERS)..where(schema.USERS.pkColumns.equalParameter))));

  print(sql.prettify(sql.format(sql.select(
      schema.USERS.columns.exclude(schema.USERS.ID, schema.USERS.GROUP_ID)))));

  print(sql.prettify(sql.format(sql.select(
      schema.USERS.ID,
      schema.USERS.ID.as,
      schema.USERS.ID.alias("MY_ID"),
      schema.USERS.ID.alias("MY_ID").as,
      schema.USERS.alias("MY_USERS").ID,
      schema.USERS.alias("MY_USERS").ID.as,
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"),
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID").as)
    ..from(schema.USERS, schema.USERS.as, schema.USERS.alias("MY_USERS"),
        schema.USERS.alias("MY_USERS").as))));

  schema.USERS.alias("a1").ID.alias("a2");

  var select = sql.select(sql.setDisabled(true, schema.USERS.ID));

  print(sql.prettify(sql.format(select.getSingleNodeByReference("myid"))));

  print(sql.prettify(sql.format(schema.USERS.ID)));
}
