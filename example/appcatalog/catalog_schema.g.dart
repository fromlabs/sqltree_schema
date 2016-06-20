

library catalog_schema;

import 'package:sqltree_schema/sqltree_schema_builder.dart';

import "localization/localization_support.dart";
import "localization/localization_support_impl.dart";


final CATALOGDB_Schema DEFAULT_SCHEMA = createSchema("");

CATALOGDB_Schema createSchema(String name) =>
    registerSharedSchema(new _CATALOGDB_SchemaImpl(name));


abstract class CATALOGDB_Schema implements SqlSchema {

  CATALOG_Table get CATALOG;

}


class _CATALOGDB_SchemaImpl extends SqlSchemaImpl implements CATALOGDB_Schema {
  _CATALOGDB_SchemaImpl(String name) : super(name);

  _CATALOGDB_SchemaImpl.cloneFrom(_CATALOGDB_SchemaImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  CATALOG_Table get CATALOG => table("CATALOG");

  @override
  SqlTableImpl createTable(String name) {
    switch (name) {

      case "CATALOG":
        return new _CATALOG_TableImpl(this);

      default:
        throw new UnsupportedError("Table not exist $name");
    }
  }

  @override
  _CATALOGDB_SchemaImpl createClone(bool freeze) =>
      new _CATALOGDB_SchemaImpl.cloneFrom(this, freeze);
}


abstract class CATALOG_Table implements SqlLocalizedTable {

  SqlColumn get ID_CATALOG;

  SqlColumn get ID_ITEM_SET;

  SqlColumn get ID_PRICE_LIST;

  SqlColumn get PUBLIC_CATALOG;

  SqlColumn get L_NAME_IT;

  SqlColumn get L_NAME_EN;

  SqlColumn get L_NAME_DE;

  SqlColumn get L_NAME_FR;

  SqlColumn get L_NAME_ES;

  SqlColumn get L_NAME_PT;

  SqlColumn get L_NAME_RU;

  SqlColumn get L_NAME_ZH;

  SqlColumn get EXTERNAL_ID_REF;

  CATALOG_Table alias(String alias);

  SqlLocalizedColumnGroup get L_NAME;

}


class _CATALOG_TableImpl extends SqlLocalizedTableImpl implements CATALOG_Table {
  static final Set<String> _pkNames = new Set.from(["ID_CATALOG"]);
  static final Set<String> _columnNames = new Set.from(["ID_CATALOG", "ID_ITEM_SET", "ID_PRICE_LIST", "PUBLIC_CATALOG", "L_NAME_IT", "L_NAME_EN", "L_NAME_DE", "L_NAME_FR", "L_NAME_ES", "L_NAME_PT", "L_NAME_RU", "L_NAME_ZH", "EXTERNAL_ID_REF"]);

  _CATALOG_TableImpl(SqlSchema schema) : super("CATALOG", schema);

  _CATALOG_TableImpl.aliased(String alias, _CATALOG_TableImpl target)
      : super.aliased(alias, target);

  _CATALOG_TableImpl.cloneFrom(_CATALOG_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_CATALOG => column("ID_CATALOG");

  @override
  SqlColumn get ID_ITEM_SET => column("ID_ITEM_SET");

  @override
  SqlColumn get ID_PRICE_LIST => column("ID_PRICE_LIST");

  @override
  SqlColumn get PUBLIC_CATALOG => column("PUBLIC_CATALOG");

  @override
  SqlColumn get L_NAME_IT => column("L_NAME_IT");

  @override
  SqlColumn get L_NAME_EN => column("L_NAME_EN");

  @override
  SqlColumn get L_NAME_DE => column("L_NAME_DE");

  @override
  SqlColumn get L_NAME_FR => column("L_NAME_FR");

  @override
  SqlColumn get L_NAME_ES => column("L_NAME_ES");

  @override
  SqlColumn get L_NAME_PT => column("L_NAME_PT");

  @override
  SqlColumn get L_NAME_RU => column("L_NAME_RU");

  @override
  SqlColumn get L_NAME_ZH => column("L_NAME_ZH");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("EXTERNAL_ID_REF");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _CATALOG_TableImpl createClone(bool freeze) =>
      new _CATALOG_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _CATALOG_TableImpl.aliased(alias, this);

  static final Set<String> _localizedGroups = new Set.from(["L_NAME"]);


  @override
  SqlLocalizedColumnGroup get L_NAME => localizedColumnGroup("L_NAME");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;

}

