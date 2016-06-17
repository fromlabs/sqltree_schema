library appcatalog.schema.application;

import 'package:sqltree_schema/sqltree_schema_builder.dart';

final Application_Schema DEFAULT_SCHEMA = createSchema("");

Application_Schema createSchema(String name) =>
    registerSharedSchema(new _Application_SchemaImpl(name));

abstract class Application_Schema implements SqlSchema {
  MEASURE_Table get MEASURE;
}

class _Application_SchemaImpl extends SqlSchemaImpl
    implements Application_Schema {
  _Application_SchemaImpl(String name) : super(name);

  _Application_SchemaImpl.cloneFrom(_Application_SchemaImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  MEASURE_Table get MEASURE => table("measure");

  @override
  SqlTableImpl createTable(String name) {
    switch (name) {
      case "measure":
        return new _MEASURE_TableImpl(this);
      default:
        throw new UnsupportedError("Table not exist $name");
    }
  }

  @override
  _Application_SchemaImpl createClone(bool freeze) =>
      new _Application_SchemaImpl.cloneFrom(this, freeze);
}

abstract class MEASURE_Table implements SqlTable {
  SqlColumn get ID_MEASURE;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get L_CODE_IT;
  SqlColumn get L_CODE_EN;
  SqlColumn get L_CODE_DE;
  SqlColumn get L_CODE_FR;
  SqlColumn get L_CODE_ES;
  SqlColumn get L_CODE_PT;
  SqlColumn get L_CODE_RU;
  SqlColumn get L_CODE_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  MEASURE_Table alias(String alias);
}

class _MEASURE_TableImpl extends SqlTableImpl implements MEASURE_Table {
  static final Set<String> _pkNames = new Set.from(["id_measure"]);
  static final Set<String> _columnNames = new Set.from([
    "id_measure",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "l_code_it",
    "l_code_en",
    "l_code_de",
    "l_code_fr",
    "l_code_es",
    "l_code_pt",
    "l_code_ru",
    "l_code_zh",
    "external_id_ref"
  ]);

  _MEASURE_TableImpl(SqlSchema schema) : super("measure", schema);

  _MEASURE_TableImpl.aliased(String alias, _MEASURE_TableImpl target)
      : super.aliased(alias, target);

  _MEASURE_TableImpl.cloneFrom(_MEASURE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_MEASURE => column("id_measure");

  @override
  SqlColumn get L_NAME_IT => column("l_name_it");

  @override
  SqlColumn get L_NAME_EN => column("l_name_en");

  @override
  SqlColumn get L_NAME_DE => column("l_name_de");

  @override
  SqlColumn get L_NAME_FR => column("l_name_fr");

  @override
  SqlColumn get L_NAME_ES => column("l_name_es");

  @override
  SqlColumn get L_NAME_PT => column("l_name_pt");

  @override
  SqlColumn get L_NAME_RU => column("l_name_ru");

  @override
  SqlColumn get L_NAME_ZH => column("l_name_zh");

  @override
  SqlColumn get L_CODE_IT => column("l_code_it");

  @override
  SqlColumn get L_CODE_EN => column("l_code_en");

  @override
  SqlColumn get L_CODE_DE => column("l_code_de");

  @override
  SqlColumn get L_CODE_FR => column("l_code_fr");

  @override
  SqlColumn get L_CODE_ES => column("l_code_es");

  @override
  SqlColumn get L_CODE_PT => column("l_code_pt");

  @override
  SqlColumn get L_CODE_RU => column("l_code_ru");

  @override
  SqlColumn get L_CODE_ZH => column("l_code_zh");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _MEASURE_TableImpl createClone(bool freeze) =>
      new _MEASURE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _MEASURE_TableImpl.aliased(alias, this);
}
