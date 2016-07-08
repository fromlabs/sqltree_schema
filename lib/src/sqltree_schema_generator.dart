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

  final Set<String> primaryKeys = new Set();

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

  FileSchemaGenerator(String schemaName, this.libraryPath,
      {String copyrightText: "", String headerText: ""})
      : super(schemaName, copyrightText: copyrightText, headerText: headerText);

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
  final String schemaName;

  final String copyrightText;

  final String headerText;

  final List<TableDescriptor> tables = [];

  SchemaGenerator(this.schemaName,
      {this.copyrightText: "", this.headerText: ""});

  Future<String> generate() async {
    StringBuffer buffer = new StringBuffer();

    createLibrary(buffer);

    createSchema(buffer);

    return buffer.toString();
  }

  void createLibrary(StringBuffer buffer) {
    buffer.writeln("""$copyrightText

$headerText
""");

    createLibraryExtension(buffer);
  }

  void createSchema(StringBuffer buffer) {
    var schemaClass = "${schemaName}_Schema";
    var schemaImpl = "_${schemaClass}Impl";
    var defaultSchema = "_${schemaName}_DEFAULT";

    // FIELD
    buffer.writeln("""
final $schemaClass $defaultSchema = create${schemaClass}("");
""");

    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";

      buffer.writeln("""
$tableClass get $tableName => $defaultSchema.$tableName;
""");
    }

    buffer.writeln("""
$schemaClass create${schemaClass}(String name) =>
    registerSharedSchema(new $schemaImpl(name));
""");

    // INTERFACE
    buffer.writeln("""
abstract class $schemaClass implements SqlSchema {
""");

    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";

      buffer.writeln("""
  $tableClass get $tableName;
""");
    }

    buffer.writeln("""
}
""");

    // IMPLEMENTATION
    buffer.writeln("""
class $schemaImpl extends SqlSchemaImpl implements $schemaClass {
  $schemaImpl(String name) : super(name);

  $schemaImpl.cloneFrom($schemaImpl target, bool freeze)
      : super.cloneFrom(target, freeze);
""");

    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";

      buffer.writeln("""
  @override
  $tableClass get $tableName => this["${table.name}"];
""");
    }

    buffer.writeln("""
  @override
  SqlTableImpl createTable(String name) {
    switch (name) {
""");

    for (var table in tables) {
      var tableName = table.name.toUpperCase();
      var tableClass = "${tableName}_Table";
      var tableImpl = "_${tableClass}Impl";

      buffer.writeln("""
      case "${table.name}":
        return new $tableImpl(this);
""");
    }

    buffer.writeln("""
      default:
        throw new UnsupportedError("Table not exist \$name");
    }
  }
""");

    buffer.writeln("""
  @override
  $schemaImpl clone({bool freeze}) => super.clone(freeze: freeze);

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
    buffer.writeln("""
abstract class $tableClass implements ${getBaseTableClass(table)} {
""");

    for (var column in table.columns) {
      buffer.writeln("""
  SqlColumn get ${column.name.toUpperCase()};
""");
    }

    buffer.writeln("""
  $tableClass alias(String alias);

  $tableClass clone({bool freeze});
""");

    createTableClassExtension(table, buffer);

    buffer.writeln("""
}
""");

    // IMPLEMENTATION
    buffer.writeln("""
class $tableImpl extends ${getBaseTableImpl(table)} implements $tableClass {
  static final Set<String> _pkNames = new Set.from([${table.primaryKeys.map((pk) => "\"$pk\"").join(", ")}]);
  static final Set<String> _columnNames = new Set.from([${table.columns.map((col) => "\"${col.name}\"").join(", ")}]);

  $tableImpl(SqlSchema schema) : super("${table.name}", schema);

  $tableImpl.aliased(String alias, $tableImpl target)
      : super.aliased(alias, target);

  $tableImpl.cloneFrom($tableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);
""");

    for (var column in table.columns) {
      buffer.writeln("""
  @override
  SqlColumn get ${column.name.toUpperCase()} => this["${column.name}"];
""");
    }

    buffer.writeln("""
  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  $tableClass alias(String alias) => super.alias(alias);

  @override
  $tableImpl clone({bool freeze}) => super.clone(freeze: freeze);

  @override
  $tableImpl createClone(bool freeze) =>
      new $tableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new $tableImpl.aliased(alias, this);
""");

    createTableImplExtension(table, buffer);

    buffer.writeln("""
}
""");
  }

  String getBaseTableClass(TableDescriptor table) => "SqlTable";

  String getBaseTableImpl(TableDescriptor table) => "SqlTableImpl";

  void createLibraryExtension(StringBuffer buffer) {}

  void createTableClassExtension(TableDescriptor table, StringBuffer buffer) {}

  void createTableImplExtension(TableDescriptor table, StringBuffer buffer) {}
}
