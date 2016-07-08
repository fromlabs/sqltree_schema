// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:sqltree/sqltree.dart' as sql;
import 'package:sqltree_schema/sqltree_schema.dart' as sql;
import '../example/users_schema.g.dart';

final columnProvider = new ColumnProvider();

class ColumnProvider implements sql.SqlNodeProvider {
  @override
  createNode() {
    return [USERS.PUBLISHER_ID, USERS.STATUS];
  }
}

void main() {
  group('base', () {
    test('Test 1', () {
      print(USERS.columns.exclude(
          USERS.ID,
          USERS.alias("MYUSERS").GROUP_ID,
          USERS.clone(freeze: false).REVIEWER_ID.clone(freeze: false),
          "USERS.AUTHOR_ID",
          columnProvider));
    });
  });
}
