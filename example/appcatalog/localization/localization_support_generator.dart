// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:sqltree_schema/sqltree_schema_generator.dart";

class LocalizedTableDescriptor extends TableDescriptor {
  final List<String> localizedColumnGroups = [];

  LocalizedTableDescriptor(String name) : super(name);
}

class LocalizedFileSchemaGenerator extends FileSchemaGenerator {
  LocalizedFileSchemaGenerator(
      String libraryName, String schemaName, String libraryPath,
      {String copyrightText: ""})
      : super(libraryName, schemaName, libraryPath,
            copyrightText: copyrightText);

  String getBaseTableClass(TableDescriptor table) => "SqlLocalizedTable";

  String getBaseTableImpl(TableDescriptor table) => "SqlLocalizedTableImpl";

  void createLibraryExtension(StringBuffer buffer) {
    buffer.writeln("""
import "localization/localization_support.dart";
import "localization/localization_support_impl.dart";
""");
  }

  void createTableClassExtension(TableDescriptor table, StringBuffer buffer) {
    LocalizedTableDescriptor localizedTable = table;

    for (var group in localizedTable.localizedColumnGroups) {
      buffer.writeln("""
  SqlLocalizedColumnGroup get ${group.toUpperCase()};
""");
    }
  }

  void createTableImplExtension(TableDescriptor table, StringBuffer buffer) {
    LocalizedTableDescriptor localizedTable = table;

    buffer.writeln("""
  static final Set<String> _localizedGroups = new Set.from([${localizedTable.localizedColumnGroups.map((group) => "\"$group\"").join(", ")}]);
""");

    buffer.writeln();
    for (var group in localizedTable.localizedColumnGroups) {
      buffer.writeln("""
  @override
  SqlLocalizedColumnGroup get ${group.toUpperCase()} => localizedColumnGroup("$group");
""");
    }

    buffer.writeln("""
  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
""");
  }
}
