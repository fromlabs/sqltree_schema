// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "dart:async";

class TableDescriptor {
  final String name;

  final List<String> primaryKeys;

  final List<ColumnDescriptor> columns = [];

  TableDescriptor(this.name, this.primaryKeys);
}

class ColumnDescriptor {
  final String name;

  final int sqlType;

  ColumnDescriptor(this.name, [this.sqlType]);
}

class FileSchemaGenerator extends SchemaGenerator {
  final String libraryPath;

  FileSchemaGenerator(String libraryName, this.libraryPath,
      {String copyrightText: ""})
      : super(libraryName, copyrightText: copyrightText);

  Future generateAndSave() {
    return _save(generate());
  }

  Future _save(String libraryContents) async {
    var file = new File(libraryPath);
    await file.writeAsString(libraryContents);
  }
}

class SchemaGenerator {
  final String libraryName;

  final String copyrightText;

  final List<TableDescriptor> tables = [];

  SchemaGenerator(this.libraryName, {this.copyrightText: ""});

  String generate() {
    StringBuffer buffer = new StringBuffer();

    createLibrary(buffer);

    for (var table in tables) {
      createTable(table, buffer);
    }
    return buffer.toString();
  }

  void createLibrary(StringBuffer buffer) {
    buffer.write("""$copyrightText

library $libraryName;

import 'package:sqltree_schema/sqltree_schema_builder.dart';

""");
  }

  void createTable(TableDescriptor table, StringBuffer buffer) {
    var tableName = table.name.toUpperCase();
    var tableClass = "${tableName}_Table";
    var tableImpl = "${tableClass}Impl";

    // FIELD
    buffer.write("""
final $tableClass $tableName = registerSharedTable(new $tableImpl());
""");

    buffer.writeln();

    // INTERFACE
    buffer.write("""
abstract class $tableClass implements SqlTable {
""");

    for (var column in table.columns) {
      buffer.write("""
  SqlColumn get ${column.name.toUpperCase()};
""");
    }
    buffer.writeln();

    buffer.write("""
  $tableClass alias(String alias);
}
""");

    buffer.writeln();

    // IMPLEMENTATION
    buffer.write("""
class $tableImpl extends SqlTableImpl implements $tableClass {
  static final Set<String> _pkNames = new Set.from([${table.primaryKeys.map((pk) => "\"$pk\"").join(", ")}]);
  static final Set<String> _columnNames = new Set.from([${table.columns.map((col) => "\"${col.name}\"").join(", ")}]);

  $tableImpl() : super("${table.name}");

  $tableImpl.aliased(String alias, $tableImpl target)
      : super.aliased(alias, target);

  $tableImpl.cloneFrom($tableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);
""");

    buffer.writeln();
    for (var column in table.columns) {
      buffer.write("""
  @override
  SqlColumn get ${column.name.toUpperCase()} => column("${column.name}");
""");
      buffer.writeln();
    }

    buffer.write("""
  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  $tableImpl createClone(bool freeze) =>
      new $tableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new $tableImpl.aliased(alias, this);
}
""");
  }

  var s = """
abstract class USERS_Table implements SqlTable {
  SqlColumn get ID;
  SqlColumn get GROUP_ID;
  SqlColumn get AUTHOR_ID;
  SqlColumn get REVIEWER_ID;
  SqlColumn get PUBLISHER_ID;
  SqlColumn get STATUS;
  SqlColumn get MAIN_LOCALE;
  SqlColumn get CATEGORY;
  SqlColumn get TITLE;
  SqlColumn get ABSTRACT;
  SqlColumn get ABSTRACT_IMAGE_URL;
  SqlColumn get BODY;
  SqlColumn get PUBLISHING_DATE;
  SqlColumn get CREATION_TIMESTAMP;

  USERS_Table alias(String alias);
}

class _USERS_Table_Impl extends SqlTableImpl implements USERS_Table {
  static final Set<String> _pkNames = new Set.from(["ID"]);
  static final Set<String> _columnNames = new Set.from([
    "ID",
    "GROUP_ID",
    "AUTHOR_ID",
    "REVIEWER_ID",
    "PUBLISHER_ID",
    "STATUS",
    "MAIN_LOCALE",
    "CATEGORY",
    "TITLE",
    "ABSTRACT",
    "ABSTRACT_IMAGE_URL",
    "BODY",
    "PUBLISHING_DATE",
    "CREATION_TIMESTAMP"
  ]);

  _USERS_Table_Impl() : super("USERS");

  _USERS_Table_Impl.aliased(String alias, SqlTable target)
      : super.aliased(alias, target);

  _USERS_Table_Impl.cloneFrom(_USERS_Table_Impl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID => column("ID");

  @override
  SqlColumn get ABSTRACT => column("ABSTRACT");

  @override
  SqlColumn get ABSTRACT_IMAGE_URL => column("ABSTRACT_IMAGE_URL");

  @override
  SqlColumn get AUTHOR_ID => column("AUTHOR_ID");

  @override
  SqlColumn get BODY => column("BODY");

  @override
  SqlColumn get CATEGORY => column("CATEGORY");

  @override
  SqlColumn get CREATION_TIMESTAMP => column("CREATION_TIMESTAMP");

  @override
  SqlColumn get GROUP_ID => column("GROUP_ID");

  @override
  SqlColumn get MAIN_LOCALE => column("MAIN_LOCALE");

  @override
  SqlColumn get PUBLISHER_ID => column("PUBLISHER_ID");

  @override
  SqlColumn get PUBLISHING_DATE => column("PUBLISHING_DATE");

  @override
  SqlColumn get REVIEWER_ID => column("REVIEWER_ID");

  @override
  SqlColumn get STATUS => column("STATUS");

  @override
  SqlColumn get TITLE => column("TITLE");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _USERS_Table_Impl createClone(bool freeze) =>
      new _USERS_Table_Impl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _USERS_Table_Impl.aliased(alias, this);
}
""";
}
