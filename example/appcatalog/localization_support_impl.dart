// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree_schema/sqltree_schema_builder.dart';

import 'localization_support.dart';

abstract class SqlLocalizedTableImpl extends SqlTableImpl
    implements SqlLocalizedTable {
  final Map<String, SqlLocalizedColumnGroup> _cachedGroups = {};

  SqlLocalizedTableImpl(String name, SqlSchema schema) : super(name, schema);

  SqlLocalizedTableImpl.aliased(String name, SqlLocalizedTableImpl target)
      : super.aliased(name, target);

  SqlLocalizedTableImpl.cloneFrom(SqlLocalizedTableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  Set<String> get localizedColumnGroupNames;

  SqlLocalizedColumnGroup localizedColumnGroup(String name) {
    SqlLocalizedColumnGroupImpl group = _cachedGroups[name];
    if (group == null) {
      group = new SqlLocalizedColumnGroupImpl(name, this);
    }
    return group;
  }

  SqlLocalizedColumn localizedColumn(String name, String locale) =>
      column("${name}_$locale");

  @override
  SqlColumn createColumn(String name, bool isPrimaryKey) {
    var groupIndex = name.lastIndexOf("_");
    var group = groupIndex != -1
        ? localizedColumnGroup(name.substring(0, groupIndex))
        : null;
    if (group != null) {
      var locale = name.substring(group.name.length + 1);
      return new SqlLocalizedColumnImpl(
          name, isPrimaryKey, this, locale, group);
    } else {
      return super.createColumn(name, isPrimaryKey);
    }
  }

  @override
  SqlColumn createColumnAliased(
      String name, SqlColumn targetColumn, bool isPrimaryKey) {
    var groupIndex = name.lastIndexOf("_");
    var group = groupIndex != -1
        ? localizedColumnGroup(name.substring(0, groupIndex))
        : null;
    if (group != null) {
      return new SqlLocalizedColumnImpl.aliased(
          name, targetColumn, isPrimaryKey, this, group);
    } else {
      return super.createColumnAliased(name, targetColumn, isPrimaryKey);
    }
  }

  @override
  List<SqlLocalizedColumnGroup> get localizedColumnGroups =>
      localizedColumnGroupNames
          .map((name) => localizedColumnGroup(name))
          .toList(growable: false);

  @override
  SqlColumnList<SqlLocalizedColumn> get localizedColumns => columns
      .where((column) => column is SqlLocalizedColumn)
      .toList(growable: false);

  @override
  SqlColumnList<SqlColumn> get notLocalizedColumns => columns
      .where((column) => column is! SqlLocalizedColumn)
      .toList(growable: false);
}

class SqlLocalizedColumnGroupImpl implements SqlLocalizedColumnGroup {
  final SqlLocalizedTable _table;

  @override
  final String name;

  SqlLocalizedColumnGroupImpl(this.name, this._table);

  @override
  SqlColumnList columns;

  @override
  SqlLocalizedColumn operator [](String locale) =>
      _table.localizedColumn(name, locale);
}

class SqlLocalizedColumnImpl extends SqlColumnImpl
    implements SqlLocalizedColumn {
  @override
  final String locale;

  @override
  final SqlLocalizedColumnGroup group;

  SqlLocalizedColumnImpl(String name, bool isPrimaryKey,
      SqlLocalizedTable table, this.locale, this.group)
      : super(name, isPrimaryKey, table);

  SqlLocalizedColumnImpl.aliased(String name, SqlLocalizedColumn target,
      bool isPrimaryKey, SqlLocalizedTable table, this.group)
      : this.locale = target.locale,
        super.aliased(name, target, isPrimaryKey, table);

  SqlLocalizedColumnImpl.cloneFrom(SqlLocalizedColumnImpl target, bool freeze)
      : this.locale = target.locale,
        this.group = target.group,
        super.cloneFrom(target, freeze);

  @override
  SqlLocalizedColumnImpl createClone(bool freeze) =>
      new SqlLocalizedColumnImpl.cloneFrom(this, freeze);
}
