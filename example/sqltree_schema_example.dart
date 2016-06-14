// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'users_schema.g.dart' as schema;

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

  print("******************************");
  var select = sql.select(schema.USERS.ID)
    ..from(sql.setReference("USERS", schema.USERS));

  print(sql.prettify(sql.format(select)));

  select.getSingleNodeByReference("USERS").disable();

  print(sql.prettify(sql.format(select)));

  select = sql.select(
      schema.USERS.ID,
      schema.USERS.ID.alias("MY_ID"),
      schema.USERS.alias("MY_USERS").ID,
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"))
    ..from(schema.USERS, schema.USERS.as, schema.USERS.alias("MY_USERS"),
        schema.USERS.alias("MY_USERS").as);

  print(sql.prettify(sql.format(select)));

  var i = 0;
  print(select.selectClause.children[i].isFreezed);
  print(select.selectClause.children[i++].main.isFreezed);
  print(select.selectClause.children[i].target.isFreezed);
  print(select.selectClause.children[i++].main.isFreezed);
  print(select.selectClause.children[i].target.isFreezed);
  print(select.selectClause.children[i++].main.isFreezed);
  print(select.selectClause.children[i].target.isFreezed);
  print(select.selectClause.children[i++].main.isFreezed);

  print(sql.prettify(sql.format(schema.USERS.alias("MY_USERS").as)));
  print(sql.prettify(sql.format(schema.USERS.ID.alias("MY_ID").as)));
  print(sql.prettify(sql.format(schema.USERS.as)));
  print(sql.prettify(sql.format(schema.USERS.ID.as)));
}
