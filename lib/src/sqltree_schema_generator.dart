// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:io";
import "dart:async";

class SchemaDescriptor {
  final String name;

  final List<TableDescriptor> tables = [];

  SchemaDescriptor(this.name);
}

class TableDescriptor {
  final String name;

  final List<String> primaryKeys = [];

  final List<ColumnDescriptor> columns = [];

  TableDescriptor(this.name);
}

class ColumnDescriptor {
  final String name;

  final int sqlType;

  ColumnDescriptor(this.name, [this.sqlType]);
}

class FileSchemaGenerator extends SchemaGenerator {
  final String libraryPath;

  FileSchemaGenerator(String libraryName, String schemaName, this.libraryPath,
      {String copyrightText: ""})
      : super(libraryName, schemaName, copyrightText: copyrightText);

  Future generateAndSave() async {
    return _save(await generate());
  }

  Future _save(String libraryContents) async {
    var file = new File(libraryPath);

    await file.create(recursive: true);

    await file.writeAsString(libraryContents);
  }
}

class SchemaGenerator {
  final String libraryName;

  final String schemaName;

  final String copyrightText;

  final List<TableDescriptor> tables = [];

  SchemaGenerator(this.libraryName, this.schemaName, {this.copyrightText: ""});

  Future<String> generate() async {
    StringBuffer buffer = new StringBuffer();

    createLibrary(buffer);

    createSchema(buffer);

    return buffer.toString();
  }

  void createLibrary(StringBuffer buffer) {
    buffer.write("""$copyrightText

library $libraryName;

import 'package:sqltree_schema/sqltree_schema_builder.dart';

""");
  }

  void createSchema(StringBuffer buffer) {
    var schemaClass = "${schemaName}_Schema";
    var schemaImpl = "_${schemaClass}Impl";

    // FIELD
    buffer.write("""
final $schemaClass DEFAULT_SCHEMA = createSchema("");
""");

    buffer.writeln();
    buffer.write("""
$schemaClass createSchema(String name) =>
    registerSharedSchema(new $schemaImpl(name));
""");

    // INTERFACE
    buffer.writeln();
    buffer.write("""
abstract class $schemaClass implements SqlSchema {
""");

    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";

      buffer.write("""
  $tableClass get $tableName;
""");
    }

    buffer.write("""
}
""");

    buffer.writeln();

    // IMPLEMENTATION
    buffer.write("""
class $schemaImpl extends SqlSchemaImpl implements $schemaClass {
  $schemaImpl(String name) : super(name);

  $schemaImpl.cloneFrom($schemaImpl target, bool freeze)
      : super.cloneFrom(target, freeze);
""");

    buffer.writeln();
    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";

      buffer.write("""
  @override
  $tableClass get $tableName => table("${table.name}");
""");
      buffer.writeln();
    }

    buffer.write("""
  @override
  SqlTableImpl createTable(String name) {
    switch (name) {
""");

    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";
      var tableImpl = "_${tableClass}Impl";

      buffer.write("""
      case "${table.name}":
        return new $tableImpl(this);
""");
    }

    buffer.write("""
      default:
        throw new UnsupportedError("Table not exist \$name");
    }
  }
""");

    buffer.writeln();
    buffer.write("""
  @override
  $schemaImpl createClone(bool freeze) =>
      new $schemaImpl.cloneFrom(this, freeze);
}
""");

    for (var table in tables) {
      createTable(table, buffer);
    }
  }

  void createTable(TableDescriptor table, StringBuffer buffer) {
    var tableName = table.name.toUpperCase();
    var tableClass = "${tableName}_Table";
    var tableImpl = "_${tableClass}Impl";

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

  $tableImpl(SqlSchema schema) : super("${table.name}", schema);

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
}
