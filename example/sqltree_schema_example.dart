// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'package:sqltree_schema/sqltree_schema.dart' as sql;

import 'users_schema.g.dart' as schema;

final schema.USERSDB_Schema DEFAULT_SCHEMA = schema.createUSERSDB_Schema("");
final schema.USERSDB_Schema OTHER_SCHEMA = schema.createUSERSDB_Schema("OTHER");

main() {
  var select2 = sql.select(schema.USERS.ID)
    ..from(sql.setReference("USERS", schema.USERS));

  // select2.fromClause.children.first.reference = "USERS";

  print(select2.fromClause.children.first.reference);

  print(sql.prettify(sql.format(select2)));

  print(select2.fromClause.children.first.reference);

  select2.whereReference("USERS").single.disable();

  print(sql.prettify(sql.format(select2)));

  print(sql.prettify(sql.format(
      sql.select(schema.USERS.ID, schema.USERS.columns)..from(schema.USERS))));

  print(sql.prettify(sql.format(sql.select(schema.USERS.columns)
    ..from(schema.USERS)
    ..where(schema.USERS.columns.pks.equalParameter))));

  schema.USERS.columns.pks.equalParameter;

  print(sql.prettify(sql.format(sql.insert(schema.USERS)
    ..columns(schema.USERS.columns.details)
    ..values(sql.tuple(schema.USERS.columns.details.parameter)))));

  print(sql.prettify(sql.format(sql.update(schema.USERS)
    ..set(schema.USERS.columns.details.equalParameter)
    ..where(schema.USERS.columns.pks.equalParameter))));

  print(sql.prettify(sql.format(sql.delete(schema.USERS)
    ..where(schema.USERS.columns.pks.equalParameter))));

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

  select.whereReference("USERS").single.disable();

  print(sql.prettify(sql.format(select)));

  print(schema.USERS.ID.isFreezed);

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

  print(sql.prettify(sql.format(schema.USERS.alias("MY_USERS").as)));
  print(sql.prettify(sql.format(schema.USERS.ID.alias("MY_ID").as)));
  print(sql.prettify(sql.format(schema.USERS.as)));
  print(sql.prettify(sql.format(schema.USERS.ID.as)));

  print("******************************++++++++++");
  print(sql.format(DEFAULT_SCHEMA));
  print(sql.format(DEFAULT_SCHEMA.USERS));
  print(sql.format(DEFAULT_SCHEMA.USERS.as));
  print(sql.format(DEFAULT_SCHEMA.USERS.alias("MY_USERS")));
  print(sql.format(DEFAULT_SCHEMA.USERS.alias("MY_USERS").as));
  print(sql.format(OTHER_SCHEMA));
  print(sql.format(OTHER_SCHEMA.USERS));
  print(sql.format(OTHER_SCHEMA.USERS.as));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS")));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS").as));
  print("******************************");
  print(sql.format(DEFAULT_SCHEMA.USERS.ID));
  print(sql.format(DEFAULT_SCHEMA.USERS.ID.as));
  print(sql.format(DEFAULT_SCHEMA.USERS.ID.alias("MY_ID")));
  print(sql.format(DEFAULT_SCHEMA.USERS.ID.alias("MY_ID").as));
  print(sql.format(DEFAULT_SCHEMA.USERS.alias("MY_USERS").ID));
  print(sql.format(DEFAULT_SCHEMA.USERS.alias("MY_USERS").ID.as));
  print(sql.format(DEFAULT_SCHEMA.USERS.alias("MY_USERS").ID.alias("MY_ID")));
  print(
      sql.format(DEFAULT_SCHEMA.USERS.alias("MY_USERS").ID.alias("MY_ID").as));
  print(sql.format(OTHER_SCHEMA.USERS.ID));
  print(sql.format(OTHER_SCHEMA.USERS.ID.as));
  print(sql.format(OTHER_SCHEMA.USERS.ID.alias("MY_ID")));
  print(sql.format(OTHER_SCHEMA.USERS.ID.alias("MY_ID").as));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS").ID));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS").ID.as));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS").ID.alias("MY_ID")));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS").ID.alias("MY_ID").as));
  print("******************************");
  print(sql.format(OTHER_SCHEMA.USERS));
  print(sql.format(OTHER_SCHEMA.USERS.as));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS")));
  print(sql.format(OTHER_SCHEMA.USERS.alias("MY_USERS").as));
  print("******************************");
  print(sql.format(sql.select(schema.USERS.columns)));
  print(sql.format(sql.select(schema.USERS.columns.unqualified)));
  print(sql.format(sql.select(
      sql.column(schema.USERS.ID, schema.USERS.ABSTRACT, schema.USERS.BODY))));
  print(sql.format(sql.select(sql
      .column(schema.USERS.ID, schema.USERS.ABSTRACT, schema.USERS.BODY)
      .unqualified)));
  print("******************************");
  print(sql.prettify(sql.format(sql.insert(schema.USERS)
    ..set(sql
        .column(schema.USERS.ID, schema.USERS.ABSTRACT, schema.USERS.BODY)
        .equalParameter))));
}
