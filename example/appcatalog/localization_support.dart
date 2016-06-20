// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree_schema/sqltree_schema.dart';

abstract class SqlLocalizedTable implements SqlTable {
  SqlColumnList<SqlColumn> get notLocalizedColumns;
  SqlColumnList<SqlLocalizedColumn> get localizedColumns;
  List<SqlLocalizedColumnGroup> get localizedColumnGroups;

  SqlLocalizedColumnGroup localizedColumnGroup(String name);
  SqlLocalizedColumn localizedColumn(String name, String locale);
}

abstract class SqlLocalizedColumnGroup {
  String get name;

  SqlLocalizedColumn operator [](String locale);

  SqlColumnList get columns;
}

abstract class SqlLocalizedColumn implements SqlColumn {
  SqlLocalizedColumnGroup get group;

  String get locale;
}
