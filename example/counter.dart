// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'users_schema.g.dart' as schema;

main() {
  sql.select(
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"),
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"),
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"),
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"),
      schema.USERS.alias("MY_USERS").ID.alias("MY_ID"))
    ..from(schema.USERS.alias("MY_USERS"));
}
