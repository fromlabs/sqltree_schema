library appcatalog.schema.application;

import 'package:sqltree_schema/sqltree_schema_builder.dart';

import "localization/localization_support.dart";
import "localization/localization_support_impl.dart";

final Application_Schema DEFAULT_SCHEMA = createSchema("");

Application_Schema createSchema(String name) =>
    registerSharedSchema(new _Application_SchemaImpl(name));

abstract class Application_Schema implements SqlSchema {
  BRAND_Table get BRAND;
  C_CATALOG_ITEM_Table get C_CATALOG_ITEM;
  CATALOG_Table get CATALOG;
  CLASSIFICATION_FEATURE_TYPE_Table get CLASSIFICATION_FEATURE_TYPE;
  DETAIL_Table get DETAIL;
  DOMAIN_CURRENCY_Table get DOMAIN_CURRENCY;
  FEATURE_Table get FEATURE;
  FEATURE_TYPE_Table get FEATURE_TYPE;
  FEATURE_TYPE_GROUP_Table get FEATURE_TYPE_GROUP;
  FILESYSTEM_Table get FILESYSTEM;
  INFO_Table get INFO;
  ITEM_GROUP_Table get ITEM_GROUP;
  ITEM_GROUP_DETAIL_Table get ITEM_GROUP_DETAIL;
  ITEM_GROUP_TYPE_Table get ITEM_GROUP_TYPE;
  ITEM_GROUP_URL_Table get ITEM_GROUP_URL;
  ITEM_PACKAGE_Table get ITEM_PACKAGE;
  ITEM_PACKAGE_PRICE_Table get ITEM_PACKAGE_PRICE;
  ITEM_SET_Table get ITEM_SET;
  ITEM_SET_DETAIL_Table get ITEM_SET_DETAIL;
  MEASURE_Table get MEASURE;
  NODE_Table get NODE;
  NODE_DETAIL_Table get NODE_DETAIL;
  NODE_FEATURE_Table get NODE_FEATURE;
  NODE_TYPE_Table get NODE_TYPE;
  NODE_URL_Table get NODE_URL;
  PACKAGE_Table get PACKAGE;
  PRICE_LIST_Table get PRICE_LIST;
  PROFILE_CATALOG_Table get PROFILE_CATALOG;
  URL_Table get URL;
  V_CLASSIFICATION_Table get V_CLASSIFICATION;
  V_ITEM_Table get V_ITEM;
}

class _Application_SchemaImpl extends SqlSchemaImpl
    implements Application_Schema {
  _Application_SchemaImpl(String name) : super(name);

  _Application_SchemaImpl.cloneFrom(_Application_SchemaImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  BRAND_Table get BRAND => table("brand");

  @override
  C_CATALOG_ITEM_Table get C_CATALOG_ITEM => table("c_catalog_item");

  @override
  CATALOG_Table get CATALOG => table("catalog");

  @override
  CLASSIFICATION_FEATURE_TYPE_Table get CLASSIFICATION_FEATURE_TYPE =>
      table("classification_feature_type");

  @override
  DETAIL_Table get DETAIL => table("detail");

  @override
  DOMAIN_CURRENCY_Table get DOMAIN_CURRENCY => table("domain_currency");

  @override
  FEATURE_Table get FEATURE => table("feature");

  @override
  FEATURE_TYPE_Table get FEATURE_TYPE => table("feature_type");

  @override
  FEATURE_TYPE_GROUP_Table get FEATURE_TYPE_GROUP =>
      table("feature_type_group");

  @override
  FILESYSTEM_Table get FILESYSTEM => table("filesystem");

  @override
  INFO_Table get INFO => table("info");

  @override
  ITEM_GROUP_Table get ITEM_GROUP => table("item_group");

  @override
  ITEM_GROUP_DETAIL_Table get ITEM_GROUP_DETAIL => table("item_group_detail");

  @override
  ITEM_GROUP_TYPE_Table get ITEM_GROUP_TYPE => table("item_group_type");

  @override
  ITEM_GROUP_URL_Table get ITEM_GROUP_URL => table("item_group_url");

  @override
  ITEM_PACKAGE_Table get ITEM_PACKAGE => table("item_package");

  @override
  ITEM_PACKAGE_PRICE_Table get ITEM_PACKAGE_PRICE =>
      table("item_package_price");

  @override
  ITEM_SET_Table get ITEM_SET => table("item_set");

  @override
  ITEM_SET_DETAIL_Table get ITEM_SET_DETAIL => table("item_set_detail");

  @override
  MEASURE_Table get MEASURE => table("measure");

  @override
  NODE_Table get NODE => table("node");

  @override
  NODE_DETAIL_Table get NODE_DETAIL => table("node_detail");

  @override
  NODE_FEATURE_Table get NODE_FEATURE => table("node_feature");

  @override
  NODE_TYPE_Table get NODE_TYPE => table("node_type");

  @override
  NODE_URL_Table get NODE_URL => table("node_url");

  @override
  PACKAGE_Table get PACKAGE => table("package");

  @override
  PRICE_LIST_Table get PRICE_LIST => table("price_list");

  @override
  PROFILE_CATALOG_Table get PROFILE_CATALOG => table("profile_catalog");

  @override
  URL_Table get URL => table("url");

  @override
  V_CLASSIFICATION_Table get V_CLASSIFICATION => table("v_classification");

  @override
  V_ITEM_Table get V_ITEM => table("v_item");

  @override
  SqlTableImpl createTable(String name) {
    switch (name) {
      case "brand":
        return new _BRAND_TableImpl(this);
      case "c_catalog_item":
        return new _C_CATALOG_ITEM_TableImpl(this);
      case "catalog":
        return new _CATALOG_TableImpl(this);
      case "classification_feature_type":
        return new _CLASSIFICATION_FEATURE_TYPE_TableImpl(this);
      case "detail":
        return new _DETAIL_TableImpl(this);
      case "domain_currency":
        return new _DOMAIN_CURRENCY_TableImpl(this);
      case "feature":
        return new _FEATURE_TableImpl(this);
      case "feature_type":
        return new _FEATURE_TYPE_TableImpl(this);
      case "feature_type_group":
        return new _FEATURE_TYPE_GROUP_TableImpl(this);
      case "filesystem":
        return new _FILESYSTEM_TableImpl(this);
      case "info":
        return new _INFO_TableImpl(this);
      case "item_group":
        return new _ITEM_GROUP_TableImpl(this);
      case "item_group_detail":
        return new _ITEM_GROUP_DETAIL_TableImpl(this);
      case "item_group_type":
        return new _ITEM_GROUP_TYPE_TableImpl(this);
      case "item_group_url":
        return new _ITEM_GROUP_URL_TableImpl(this);
      case "item_package":
        return new _ITEM_PACKAGE_TableImpl(this);
      case "item_package_price":
        return new _ITEM_PACKAGE_PRICE_TableImpl(this);
      case "item_set":
        return new _ITEM_SET_TableImpl(this);
      case "item_set_detail":
        return new _ITEM_SET_DETAIL_TableImpl(this);
      case "measure":
        return new _MEASURE_TableImpl(this);
      case "node":
        return new _NODE_TableImpl(this);
      case "node_detail":
        return new _NODE_DETAIL_TableImpl(this);
      case "node_feature":
        return new _NODE_FEATURE_TableImpl(this);
      case "node_type":
        return new _NODE_TYPE_TableImpl(this);
      case "node_url":
        return new _NODE_URL_TableImpl(this);
      case "package":
        return new _PACKAGE_TableImpl(this);
      case "price_list":
        return new _PRICE_LIST_TableImpl(this);
      case "profile_catalog":
        return new _PROFILE_CATALOG_TableImpl(this);
      case "url":
        return new _URL_TableImpl(this);
      case "v_classification":
        return new _V_CLASSIFICATION_TableImpl(this);
      case "v_item":
        return new _V_ITEM_TableImpl(this);
      default:
        throw new UnsupportedError("Table not exist $name");
    }
  }

  @override
  _Application_SchemaImpl createClone(bool freeze) =>
      new _Application_SchemaImpl.cloneFrom(this, freeze);
}

abstract class BRAND_Table implements SqlLocalizedTable {
  SqlColumn get ID_BRAND;
  SqlColumn get NAME;
  SqlColumn get ID_URL;
  SqlColumn get SORTING;
  SqlColumn get ACTIVE;

  BRAND_Table alias(String alias);
}

class _BRAND_TableImpl extends SqlLocalizedTableImpl implements BRAND_Table {
  static final Set<String> _pkNames = new Set.from(["id_brand"]);
  static final Set<String> _columnNames =
      new Set.from(["id_brand", "name", "id_url", "sorting", "active"]);

  _BRAND_TableImpl(SqlSchema schema) : super("brand", schema);

  _BRAND_TableImpl.aliased(String alias, _BRAND_TableImpl target)
      : super.aliased(alias, target);

  _BRAND_TableImpl.cloneFrom(_BRAND_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_BRAND => column("id_brand");

  @override
  SqlColumn get NAME => column("name");

  @override
  SqlColumn get ID_URL => column("id_url");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get ACTIVE => column("active");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _BRAND_TableImpl createClone(bool freeze) =>
      new _BRAND_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _BRAND_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class C_CATALOG_ITEM_Table implements SqlLocalizedTable {
  SqlColumn get ID_CATALOG;
  SqlColumn get ID_NODE;
  SqlColumn get ID_ITEM_PACKAGE;
  SqlColumn get ID_PRICE_LIST;
  SqlColumn get PRICE_START_DATE;
  SqlColumn get PRICE_END_DATE;
  SqlColumn get MAIN_PRICE;
  SqlColumn get MAIN_PROMO_START_DATE;
  SqlColumn get MAIN_PROMO_END_DATE;
  SqlColumn get MAIN_PROMO_PRICE;

  C_CATALOG_ITEM_Table alias(String alias);
}

class _C_CATALOG_ITEM_TableImpl extends SqlLocalizedTableImpl
    implements C_CATALOG_ITEM_Table {
  static final Set<String> _pkNames = new Set.from(["id_catalog", "id_node"]);
  static final Set<String> _columnNames = new Set.from([
    "id_catalog",
    "id_node",
    "id_item_package",
    "id_price_list",
    "price_start_date",
    "price_end_date",
    "main_price",
    "main_promo_start_date",
    "main_promo_end_date",
    "main_promo_price"
  ]);

  _C_CATALOG_ITEM_TableImpl(SqlSchema schema) : super("c_catalog_item", schema);

  _C_CATALOG_ITEM_TableImpl.aliased(
      String alias, _C_CATALOG_ITEM_TableImpl target)
      : super.aliased(alias, target);

  _C_CATALOG_ITEM_TableImpl.cloneFrom(
      _C_CATALOG_ITEM_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_CATALOG => column("id_catalog");

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_ITEM_PACKAGE => column("id_item_package");

  @override
  SqlColumn get ID_PRICE_LIST => column("id_price_list");

  @override
  SqlColumn get PRICE_START_DATE => column("price_start_date");

  @override
  SqlColumn get PRICE_END_DATE => column("price_end_date");

  @override
  SqlColumn get MAIN_PRICE => column("main_price");

  @override
  SqlColumn get MAIN_PROMO_START_DATE => column("main_promo_start_date");

  @override
  SqlColumn get MAIN_PROMO_END_DATE => column("main_promo_end_date");

  @override
  SqlColumn get MAIN_PROMO_PRICE => column("main_promo_price");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _C_CATALOG_ITEM_TableImpl createClone(bool freeze) =>
      new _C_CATALOG_ITEM_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _C_CATALOG_ITEM_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
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

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
}

class _CATALOG_TableImpl extends SqlLocalizedTableImpl
    implements CATALOG_Table {
  static final Set<String> _pkNames = new Set.from(["id_catalog"]);
  static final Set<String> _columnNames = new Set.from([
    "id_catalog",
    "id_item_set",
    "id_price_list",
    "public_catalog",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _CATALOG_TableImpl(SqlSchema schema) : super("catalog", schema);

  _CATALOG_TableImpl.aliased(String alias, _CATALOG_TableImpl target)
      : super.aliased(alias, target);

  _CATALOG_TableImpl.cloneFrom(_CATALOG_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_CATALOG => column("id_catalog");

  @override
  SqlColumn get ID_ITEM_SET => column("id_item_set");

  @override
  SqlColumn get ID_PRICE_LIST => column("id_price_list");

  @override
  SqlColumn get PUBLIC_CATALOG => column("public_catalog");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

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

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_name");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class CLASSIFICATION_FEATURE_TYPE_Table implements SqlLocalizedTable {
  SqlColumn get ID_FEATURE_TYPE;
  SqlColumn get ID_CLASSIFICATION;
  SqlColumn get ID_URL;
  SqlColumn get CALCULATED;

  CLASSIFICATION_FEATURE_TYPE_Table alias(String alias);
}

class _CLASSIFICATION_FEATURE_TYPE_TableImpl extends SqlLocalizedTableImpl
    implements CLASSIFICATION_FEATURE_TYPE_Table {
  static final Set<String> _pkNames =
      new Set.from(["id_feature_type", "id_classification"]);
  static final Set<String> _columnNames = new Set.from(
      ["id_feature_type", "id_classification", "id_url", "calculated"]);

  _CLASSIFICATION_FEATURE_TYPE_TableImpl(SqlSchema schema)
      : super("classification_feature_type", schema);

  _CLASSIFICATION_FEATURE_TYPE_TableImpl.aliased(
      String alias, _CLASSIFICATION_FEATURE_TYPE_TableImpl target)
      : super.aliased(alias, target);

  _CLASSIFICATION_FEATURE_TYPE_TableImpl.cloneFrom(
      _CLASSIFICATION_FEATURE_TYPE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_FEATURE_TYPE => column("id_feature_type");

  @override
  SqlColumn get ID_CLASSIFICATION => column("id_classification");

  @override
  SqlColumn get ID_URL => column("id_url");

  @override
  SqlColumn get CALCULATED => column("calculated");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _CLASSIFICATION_FEATURE_TYPE_TableImpl createClone(bool freeze) =>
      new _CLASSIFICATION_FEATURE_TYPE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _CLASSIFICATION_FEATURE_TYPE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class DETAIL_Table implements SqlLocalizedTable {
  SqlColumn get ID_DETAIL;
  SqlColumn get ID_URL;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get L_DESCRIPTION_IT;
  SqlColumn get L_DESCRIPTION_EN;
  SqlColumn get L_DESCRIPTION_DE;
  SqlColumn get L_DESCRIPTION_FR;
  SqlColumn get L_DESCRIPTION_ES;
  SqlColumn get L_DESCRIPTION_PT;
  SqlColumn get L_DESCRIPTION_RU;
  SqlColumn get L_DESCRIPTION_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  DETAIL_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
  SqlLocalizedColumnGroup get L_DESCRIPTIONS;
}

class _DETAIL_TableImpl extends SqlLocalizedTableImpl implements DETAIL_Table {
  static final Set<String> _pkNames = new Set.from(["id_detail"]);
  static final Set<String> _columnNames = new Set.from([
    "id_detail",
    "id_url",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "l_description_it",
    "l_description_en",
    "l_description_de",
    "l_description_fr",
    "l_description_es",
    "l_description_pt",
    "l_description_ru",
    "l_description_zh",
    "external_id_ref"
  ]);

  _DETAIL_TableImpl(SqlSchema schema) : super("detail", schema);

  _DETAIL_TableImpl.aliased(String alias, _DETAIL_TableImpl target)
      : super.aliased(alias, target);

  _DETAIL_TableImpl.cloneFrom(_DETAIL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_DETAIL => column("id_detail");

  @override
  SqlColumn get ID_URL => column("id_url");

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
  SqlColumn get L_DESCRIPTION_IT => column("l_description_it");

  @override
  SqlColumn get L_DESCRIPTION_EN => column("l_description_en");

  @override
  SqlColumn get L_DESCRIPTION_DE => column("l_description_de");

  @override
  SqlColumn get L_DESCRIPTION_FR => column("l_description_fr");

  @override
  SqlColumn get L_DESCRIPTION_ES => column("l_description_es");

  @override
  SqlColumn get L_DESCRIPTION_PT => column("l_description_pt");

  @override
  SqlColumn get L_DESCRIPTION_RU => column("l_description_ru");

  @override
  SqlColumn get L_DESCRIPTION_ZH => column("l_description_zh");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _DETAIL_TableImpl createClone(bool freeze) =>
      new _DETAIL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _DETAIL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["l_name", "l_description"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_name");

  @override
  SqlLocalizedColumnGroup get L_DESCRIPTIONS =>
      localizedColumnGroup("l_description");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class DOMAIN_CURRENCY_Table implements SqlLocalizedTable {
  SqlColumn get CURRENCY_ISO_CODE;

  DOMAIN_CURRENCY_Table alias(String alias);
}

class _DOMAIN_CURRENCY_TableImpl extends SqlLocalizedTableImpl
    implements DOMAIN_CURRENCY_Table {
  static final Set<String> _pkNames = new Set.from(["currency_iso_code"]);
  static final Set<String> _columnNames = new Set.from(["currency_iso_code"]);

  _DOMAIN_CURRENCY_TableImpl(SqlSchema schema)
      : super("domain_currency", schema);

  _DOMAIN_CURRENCY_TableImpl.aliased(
      String alias, _DOMAIN_CURRENCY_TableImpl target)
      : super.aliased(alias, target);

  _DOMAIN_CURRENCY_TableImpl.cloneFrom(
      _DOMAIN_CURRENCY_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get CURRENCY_ISO_CODE => column("currency_iso_code");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _DOMAIN_CURRENCY_TableImpl createClone(bool freeze) =>
      new _DOMAIN_CURRENCY_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _DOMAIN_CURRENCY_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class FEATURE_Table implements SqlLocalizedTable {
  SqlColumn get ID_FEATURE;
  SqlColumn get ID_FEATURE_TYPE;
  SqlColumn get SORTING;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  FEATURE_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
}

class _FEATURE_TableImpl extends SqlLocalizedTableImpl
    implements FEATURE_Table {
  static final Set<String> _pkNames = new Set.from(["id_feature"]);
  static final Set<String> _columnNames = new Set.from([
    "id_feature",
    "id_feature_type",
    "sorting",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _FEATURE_TableImpl(SqlSchema schema) : super("feature", schema);

  _FEATURE_TableImpl.aliased(String alias, _FEATURE_TableImpl target)
      : super.aliased(alias, target);

  _FEATURE_TableImpl.cloneFrom(_FEATURE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_FEATURE => column("id_feature");

  @override
  SqlColumn get ID_FEATURE_TYPE => column("id_feature_type");

  @override
  SqlColumn get SORTING => column("sorting");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _FEATURE_TableImpl createClone(bool freeze) =>
      new _FEATURE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _FEATURE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_name");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class FEATURE_TYPE_Table implements SqlLocalizedTable {
  SqlColumn get ID_FEATURE_TYPE;
  SqlColumn get ID_FEATURE_TYPE_GROUP;
  SqlColumn get SORTING;
  SqlColumn get CODE;
  SqlColumn get SORTING_TYPE;
  SqlColumn get ACTIVE;
  SqlColumn get HASIMAGE;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get L_ID_MEASURE_IT;
  SqlColumn get L_ID_MEASURE_EN;
  SqlColumn get L_ID_MEASURE_DE;
  SqlColumn get L_ID_MEASURE_FR;
  SqlColumn get L_ID_MEASURE_ES;
  SqlColumn get L_ID_MEASURE_PT;
  SqlColumn get L_ID_MEASURE_RU;
  SqlColumn get L_ID_MEASURE_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  FEATURE_TYPE_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
  SqlLocalizedColumnGroup get L_ID_MEASURES;
}

class _FEATURE_TYPE_TableImpl extends SqlLocalizedTableImpl
    implements FEATURE_TYPE_Table {
  static final Set<String> _pkNames = new Set.from(["id_feature_type"]);
  static final Set<String> _columnNames = new Set.from([
    "id_feature_type",
    "id_feature_type_group",
    "sorting",
    "code",
    "sorting_type",
    "active",
    "hasimage",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "l_id_measure_it",
    "l_id_measure_en",
    "l_id_measure_de",
    "l_id_measure_fr",
    "l_id_measure_es",
    "l_id_measure_pt",
    "l_id_measure_ru",
    "l_id_measure_zh",
    "external_id_ref"
  ]);

  _FEATURE_TYPE_TableImpl(SqlSchema schema) : super("feature_type", schema);

  _FEATURE_TYPE_TableImpl.aliased(String alias, _FEATURE_TYPE_TableImpl target)
      : super.aliased(alias, target);

  _FEATURE_TYPE_TableImpl.cloneFrom(_FEATURE_TYPE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_FEATURE_TYPE => column("id_feature_type");

  @override
  SqlColumn get ID_FEATURE_TYPE_GROUP => column("id_feature_type_group");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get CODE => column("code");

  @override
  SqlColumn get SORTING_TYPE => column("sorting_type");

  @override
  SqlColumn get ACTIVE => column("active");

  @override
  SqlColumn get HASIMAGE => column("hasimage");

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
  SqlColumn get L_ID_MEASURE_IT => column("l_id_measure_it");

  @override
  SqlColumn get L_ID_MEASURE_EN => column("l_id_measure_en");

  @override
  SqlColumn get L_ID_MEASURE_DE => column("l_id_measure_de");

  @override
  SqlColumn get L_ID_MEASURE_FR => column("l_id_measure_fr");

  @override
  SqlColumn get L_ID_MEASURE_ES => column("l_id_measure_es");

  @override
  SqlColumn get L_ID_MEASURE_PT => column("l_id_measure_pt");

  @override
  SqlColumn get L_ID_MEASURE_RU => column("l_id_measure_ru");

  @override
  SqlColumn get L_ID_MEASURE_ZH => column("l_id_measure_zh");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _FEATURE_TYPE_TableImpl createClone(bool freeze) =>
      new _FEATURE_TYPE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _FEATURE_TYPE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["l_name", "l_id_measure"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  SqlLocalizedColumnGroup get L_ID_MEASURES =>
      localizedColumnGroup("l_id_measure");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class FEATURE_TYPE_GROUP_Table implements SqlLocalizedTable {
  SqlColumn get ID_FEATURE_TYPE_GROUP;
  SqlColumn get SORTING;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  FEATURE_TYPE_GROUP_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
}

class _FEATURE_TYPE_GROUP_TableImpl extends SqlLocalizedTableImpl
    implements FEATURE_TYPE_GROUP_Table {
  static final Set<String> _pkNames = new Set.from(["id_feature_type_group"]);
  static final Set<String> _columnNames = new Set.from([
    "id_feature_type_group",
    "sorting",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _FEATURE_TYPE_GROUP_TableImpl(SqlSchema schema)
      : super("feature_type_group", schema);

  _FEATURE_TYPE_GROUP_TableImpl.aliased(
      String alias, _FEATURE_TYPE_GROUP_TableImpl target)
      : super.aliased(alias, target);

  _FEATURE_TYPE_GROUP_TableImpl.cloneFrom(
      _FEATURE_TYPE_GROUP_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_FEATURE_TYPE_GROUP => column("id_feature_type_group");

  @override
  SqlColumn get SORTING => column("sorting");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _FEATURE_TYPE_GROUP_TableImpl createClone(bool freeze) =>
      new _FEATURE_TYPE_GROUP_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _FEATURE_TYPE_GROUP_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class FILESYSTEM_Table implements SqlLocalizedTable {
  SqlColumn get RELATIVE_PATH;
  SqlColumn get LAST_MODIFIED;
  SqlColumn get LENGTH;

  FILESYSTEM_Table alias(String alias);
}

class _FILESYSTEM_TableImpl extends SqlLocalizedTableImpl
    implements FILESYSTEM_Table {
  static final Set<String> _pkNames = new Set.from(["relative_path"]);
  static final Set<String> _columnNames =
      new Set.from(["relative_path", "last_modified", "length"]);

  _FILESYSTEM_TableImpl(SqlSchema schema) : super("filesystem", schema);

  _FILESYSTEM_TableImpl.aliased(String alias, _FILESYSTEM_TableImpl target)
      : super.aliased(alias, target);

  _FILESYSTEM_TableImpl.cloneFrom(_FILESYSTEM_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get RELATIVE_PATH => column("relative_path");

  @override
  SqlColumn get LAST_MODIFIED => column("last_modified");

  @override
  SqlColumn get LENGTH => column("length");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _FILESYSTEM_TableImpl createClone(bool freeze) =>
      new _FILESYSTEM_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _FILESYSTEM_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class INFO_Table implements SqlLocalizedTable {
  SqlColumn get LAST_ID_SYNC;

  INFO_Table alias(String alias);
}

class _INFO_TableImpl extends SqlLocalizedTableImpl implements INFO_Table {
  static final Set<String> _pkNames = new Set.from([]);
  static final Set<String> _columnNames = new Set.from(["last_id_sync"]);

  _INFO_TableImpl(SqlSchema schema) : super("info", schema);

  _INFO_TableImpl.aliased(String alias, _INFO_TableImpl target)
      : super.aliased(alias, target);

  _INFO_TableImpl.cloneFrom(_INFO_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get LAST_ID_SYNC => column("last_id_sync");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _INFO_TableImpl createClone(bool freeze) =>
      new _INFO_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _INFO_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_GROUP_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_GROUP;
  SqlColumn get ID_ITEM_GROUP_TYPE;
  SqlColumn get ID_ITEM;
  SqlColumn get SORTING_TYPE;
  SqlColumn get ACTIVE;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  ITEM_GROUP_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
}

class _ITEM_GROUP_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_GROUP_Table {
  static final Set<String> _pkNames = new Set.from(["id_item_group"]);
  static final Set<String> _columnNames = new Set.from([
    "id_item_group",
    "id_item_group_type",
    "id_item",
    "sorting_type",
    "active",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _ITEM_GROUP_TableImpl(SqlSchema schema) : super("item_group", schema);

  _ITEM_GROUP_TableImpl.aliased(String alias, _ITEM_GROUP_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_GROUP_TableImpl.cloneFrom(_ITEM_GROUP_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_GROUP => column("id_item_group");

  @override
  SqlColumn get ID_ITEM_GROUP_TYPE => column("id_item_group_type");

  @override
  SqlColumn get ID_ITEM => column("id_item");

  @override
  SqlColumn get SORTING_TYPE => column("sorting_type");

  @override
  SqlColumn get ACTIVE => column("active");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_GROUP_TableImpl createClone(bool freeze) =>
      new _ITEM_GROUP_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_GROUP_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_GROUP_DETAIL_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_GROUP;
  SqlColumn get ID_ITEM;
  SqlColumn get REFERENCE;
  SqlColumn get SORTING;

  ITEM_GROUP_DETAIL_Table alias(String alias);
}

class _ITEM_GROUP_DETAIL_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_GROUP_DETAIL_Table {
  static final Set<String> _pkNames =
      new Set.from(["id_item_group", "id_item"]);
  static final Set<String> _columnNames =
      new Set.from(["id_item_group", "id_item", "reference", "sorting"]);

  _ITEM_GROUP_DETAIL_TableImpl(SqlSchema schema)
      : super("item_group_detail", schema);

  _ITEM_GROUP_DETAIL_TableImpl.aliased(
      String alias, _ITEM_GROUP_DETAIL_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_GROUP_DETAIL_TableImpl.cloneFrom(
      _ITEM_GROUP_DETAIL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_GROUP => column("id_item_group");

  @override
  SqlColumn get ID_ITEM => column("id_item");

  @override
  SqlColumn get REFERENCE => column("reference");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_GROUP_DETAIL_TableImpl createClone(bool freeze) =>
      new _ITEM_GROUP_DETAIL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_GROUP_DETAIL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_GROUP_TYPE_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_GROUP_TYPE;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;

  ITEM_GROUP_TYPE_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
}

class _ITEM_GROUP_TYPE_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_GROUP_TYPE_Table {
  static final Set<String> _pkNames = new Set.from(["id_item_group_type"]);
  static final Set<String> _columnNames = new Set.from([
    "id_item_group_type",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh"
  ]);

  _ITEM_GROUP_TYPE_TableImpl(SqlSchema schema)
      : super("item_group_type", schema);

  _ITEM_GROUP_TYPE_TableImpl.aliased(
      String alias, _ITEM_GROUP_TYPE_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_GROUP_TYPE_TableImpl.cloneFrom(
      _ITEM_GROUP_TYPE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_GROUP_TYPE => column("id_item_group_type");

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
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_GROUP_TYPE_TableImpl createClone(bool freeze) =>
      new _ITEM_GROUP_TYPE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_GROUP_TYPE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_GROUP_URL_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_GROUP;
  SqlColumn get ID_URL;
  SqlColumn get SORTING;

  ITEM_GROUP_URL_Table alias(String alias);
}

class _ITEM_GROUP_URL_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_GROUP_URL_Table {
  static final Set<String> _pkNames = new Set.from(["id_item_group", "id_url"]);
  static final Set<String> _columnNames =
      new Set.from(["id_item_group", "id_url", "sorting"]);

  _ITEM_GROUP_URL_TableImpl(SqlSchema schema) : super("item_group_url", schema);

  _ITEM_GROUP_URL_TableImpl.aliased(
      String alias, _ITEM_GROUP_URL_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_GROUP_URL_TableImpl.cloneFrom(
      _ITEM_GROUP_URL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_GROUP => column("id_item_group");

  @override
  SqlColumn get ID_URL => column("id_url");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_GROUP_URL_TableImpl createClone(bool freeze) =>
      new _ITEM_GROUP_URL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_GROUP_URL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_PACKAGE_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_PACKAGE;
  SqlColumn get ID_NODE;
  SqlColumn get ID_PACKAGE;
  SqlColumn get QUANTITY;
  SqlColumn get SORTING;
  SqlColumn get EXTERNAL_ID_REF;

  ITEM_PACKAGE_Table alias(String alias);
}

class _ITEM_PACKAGE_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_PACKAGE_Table {
  static final Set<String> _pkNames = new Set.from(["id_item_package"]);
  static final Set<String> _columnNames = new Set.from([
    "id_item_package",
    "id_node",
    "id_package",
    "quantity",
    "sorting",
    "external_id_ref"
  ]);

  _ITEM_PACKAGE_TableImpl(SqlSchema schema) : super("item_package", schema);

  _ITEM_PACKAGE_TableImpl.aliased(String alias, _ITEM_PACKAGE_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_PACKAGE_TableImpl.cloneFrom(_ITEM_PACKAGE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_PACKAGE => column("id_item_package");

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_PACKAGE => column("id_package");

  @override
  SqlColumn get QUANTITY => column("quantity");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_PACKAGE_TableImpl createClone(bool freeze) =>
      new _ITEM_PACKAGE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_PACKAGE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_PACKAGE_PRICE_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_PACKAGE;
  SqlColumn get ID_PRICE_LIST;
  SqlColumn get PRICE_START_DATE;
  SqlColumn get C_PRICE_END_DATE;
  SqlColumn get PRICE;
  SqlColumn get EAN;
  SqlColumn get PROMO_START_DATE;
  SqlColumn get PROMO_END_DATE;
  SqlColumn get PROMO_PRICE;

  ITEM_PACKAGE_PRICE_Table alias(String alias);
}

class _ITEM_PACKAGE_PRICE_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_PACKAGE_PRICE_Table {
  static final Set<String> _pkNames =
      new Set.from(["id_item_package", "id_price_list", "price_start_date"]);
  static final Set<String> _columnNames = new Set.from([
    "id_item_package",
    "id_price_list",
    "price_start_date",
    "c_price_end_date",
    "price",
    "ean",
    "promo_start_date",
    "promo_end_date",
    "promo_price"
  ]);

  _ITEM_PACKAGE_PRICE_TableImpl(SqlSchema schema)
      : super("item_package_price", schema);

  _ITEM_PACKAGE_PRICE_TableImpl.aliased(
      String alias, _ITEM_PACKAGE_PRICE_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_PACKAGE_PRICE_TableImpl.cloneFrom(
      _ITEM_PACKAGE_PRICE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_PACKAGE => column("id_item_package");

  @override
  SqlColumn get ID_PRICE_LIST => column("id_price_list");

  @override
  SqlColumn get PRICE_START_DATE => column("price_start_date");

  @override
  SqlColumn get C_PRICE_END_DATE => column("c_price_end_date");

  @override
  SqlColumn get PRICE => column("price");

  @override
  SqlColumn get EAN => column("ean");

  @override
  SqlColumn get PROMO_START_DATE => column("promo_start_date");

  @override
  SqlColumn get PROMO_END_DATE => column("promo_end_date");

  @override
  SqlColumn get PROMO_PRICE => column("promo_price");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_PACKAGE_PRICE_TableImpl createClone(bool freeze) =>
      new _ITEM_PACKAGE_PRICE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_PACKAGE_PRICE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_SET_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_SET;
  SqlColumn get SET_TYPE;
  SqlColumn get NAME;
  SqlColumn get EXTERNAL_ID_REF;

  ITEM_SET_Table alias(String alias);
}

class _ITEM_SET_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_SET_Table {
  static final Set<String> _pkNames = new Set.from(["id_item_set"]);
  static final Set<String> _columnNames =
      new Set.from(["id_item_set", "set_type", "name", "external_id_ref"]);

  _ITEM_SET_TableImpl(SqlSchema schema) : super("item_set", schema);

  _ITEM_SET_TableImpl.aliased(String alias, _ITEM_SET_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_SET_TableImpl.cloneFrom(_ITEM_SET_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_SET => column("id_item_set");

  @override
  SqlColumn get SET_TYPE => column("set_type");

  @override
  SqlColumn get NAME => column("name");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_SET_TableImpl createClone(bool freeze) =>
      new _ITEM_SET_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_SET_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class ITEM_SET_DETAIL_Table implements SqlLocalizedTable {
  SqlColumn get ID_ITEM_SET;
  SqlColumn get ID_ITEM_SET_DETAIL;
  SqlColumn get ID_NODE;
  SqlColumn get ID_BRAND;
  SqlColumn get EXTERNAL_ID_REF;

  ITEM_SET_DETAIL_Table alias(String alias);
}

class _ITEM_SET_DETAIL_TableImpl extends SqlLocalizedTableImpl
    implements ITEM_SET_DETAIL_Table {
  static final Set<String> _pkNames = new Set.from(["id_item_set_detail"]);
  static final Set<String> _columnNames = new Set.from([
    "id_item_set",
    "id_item_set_detail",
    "id_node",
    "id_brand",
    "external_id_ref"
  ]);

  _ITEM_SET_DETAIL_TableImpl(SqlSchema schema)
      : super("item_set_detail", schema);

  _ITEM_SET_DETAIL_TableImpl.aliased(
      String alias, _ITEM_SET_DETAIL_TableImpl target)
      : super.aliased(alias, target);

  _ITEM_SET_DETAIL_TableImpl.cloneFrom(
      _ITEM_SET_DETAIL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_ITEM_SET => column("id_item_set");

  @override
  SqlColumn get ID_ITEM_SET_DETAIL => column("id_item_set_detail");

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_BRAND => column("id_brand");

  @override
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _ITEM_SET_DETAIL_TableImpl createClone(bool freeze) =>
      new _ITEM_SET_DETAIL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _ITEM_SET_DETAIL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class MEASURE_Table implements SqlLocalizedTable {
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

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get L_NAMES;
  SqlLocalizedColumnGroup get L_CODES;
}

class _MEASURE_TableImpl extends SqlLocalizedTableImpl
    implements MEASURE_Table {
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

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["l_name", "l_code"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  SqlLocalizedColumnGroup get L_CODES => localizedColumnGroup("l_codes");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class NODE_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE;
  SqlColumn get ID_NODE_TYPE;
  SqlColumn get ID_PARENT_NODE;
  SqlColumn get ID_BRAND;
  SqlColumn get C_ID_PARENT_CLASSIFICATION;
  SqlColumn get C_ID_PARENT_CLASSIFICATION1;
  SqlColumn get C_ID_PARENT_CLASSIFICATION2;
  SqlColumn get C_ID_PARENT_CLASSIFICATION3;
  SqlColumn get C_ID_PARENT_CLASSIFICATION4;
  SqlColumn get C_ID_PARENT_CLASSIFICATION5;
  SqlColumn get C_ID_PARENT_CLASSIFICATION6;
  SqlColumn get X_NEW_START_DATE;
  SqlColumn get X_NEW_END_DATE;
  SqlColumn get X_ID_ITEM_URL;
  SqlColumn get X_ID_CLASSIFICATION_URL;
  SqlColumn get C_MAIN_QUANTITY;
  SqlColumn get C_MAIN_ID_ITEM_PACKAGE;
  SqlColumn get C_HAS_SECONDARY_ITEM_PACKAGES;
  SqlColumn get SORTING;
  SqlColumn get ACTIVE;
  SqlColumn get VIRTUAL;
  SqlColumn get XL_NAME_IT;
  SqlColumn get XL_NAME_EN;
  SqlColumn get XL_NAME_DE;
  SqlColumn get XL_NAME_FR;
  SqlColumn get XL_NAME_ES;
  SqlColumn get XL_NAME_PT;
  SqlColumn get XL_NAME_RU;
  SqlColumn get XL_NAME_ZH;
  SqlColumn get L_DESCRIPTION_IT;
  SqlColumn get L_DESCRIPTION_EN;
  SqlColumn get L_DESCRIPTION_DE;
  SqlColumn get L_DESCRIPTION_FR;
  SqlColumn get L_DESCRIPTION_ES;
  SqlColumn get L_DESCRIPTION_PT;
  SqlColumn get L_DESCRIPTION_RU;
  SqlColumn get L_DESCRIPTION_ZH;
  SqlColumn get H_X_NEW_START_DATE;
  SqlColumn get H_X_NEW_END_DATE;
  SqlColumn get H_X_ID_ITEM_URL;
  SqlColumn get H_X_ID_CLASSIFICATION_URL;
  SqlColumn get H_XL_NAME_IT;
  SqlColumn get H_XL_NAME_EN;
  SqlColumn get H_XL_NAME_DE;
  SqlColumn get H_XL_NAME_FR;
  SqlColumn get H_XL_NAME_ES;
  SqlColumn get H_XL_NAME_PT;
  SqlColumn get H_XL_NAME_RU;
  SqlColumn get H_XL_NAME_ZH;

  NODE_Table alias(String alias);

  /* LOCALIZED SUPPORT */

  SqlLocalizedColumnGroup get XL_NAMES;
  SqlLocalizedColumnGroup get L_DESCRIPTIONS;
  SqlLocalizedColumnGroup get H_XL_NAMES;
}

class _NODE_TableImpl extends SqlLocalizedTableImpl implements NODE_Table {
  static final Set<String> _pkNames = new Set.from(["id_node"]);
  static final Set<String> _columnNames = new Set.from([
    "id_node",
    "id_node_type",
    "id_parent_node",
    "id_brand",
    "c_id_parent_classification",
    "c_id_parent_classification1",
    "c_id_parent_classification2",
    "c_id_parent_classification3",
    "c_id_parent_classification4",
    "c_id_parent_classification5",
    "c_id_parent_classification6",
    "x_new_start_date",
    "x_new_end_date",
    "x_id_item_url",
    "x_id_classification_url",
    "c_main_quantity",
    "c_main_id_item_package",
    "c_has_secondary_item_packages",
    "sorting",
    "active",
    "virtual",
    "xl_name_it",
    "xl_name_en",
    "xl_name_de",
    "xl_name_fr",
    "xl_name_es",
    "xl_name_pt",
    "xl_name_ru",
    "xl_name_zh",
    "l_description_it",
    "l_description_en",
    "l_description_de",
    "l_description_fr",
    "l_description_es",
    "l_description_pt",
    "l_description_ru",
    "l_description_zh",
    "h_x_new_start_date",
    "h_x_new_end_date",
    "h_x_id_item_url",
    "h_x_id_classification_url",
    "h_xl_name_it",
    "h_xl_name_en",
    "h_xl_name_de",
    "h_xl_name_fr",
    "h_xl_name_es",
    "h_xl_name_pt",
    "h_xl_name_ru",
    "h_xl_name_zh"
  ]);

  _NODE_TableImpl(SqlSchema schema) : super("node", schema);

  _NODE_TableImpl.aliased(String alias, _NODE_TableImpl target)
      : super.aliased(alias, target);

  _NODE_TableImpl.cloneFrom(_NODE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_NODE_TYPE => column("id_node_type");

  @override
  SqlColumn get ID_PARENT_NODE => column("id_parent_node");

  @override
  SqlColumn get ID_BRAND => column("id_brand");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION =>
      column("c_id_parent_classification");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION1 =>
      column("c_id_parent_classification1");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION2 =>
      column("c_id_parent_classification2");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION3 =>
      column("c_id_parent_classification3");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION4 =>
      column("c_id_parent_classification4");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION5 =>
      column("c_id_parent_classification5");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION6 =>
      column("c_id_parent_classification6");

  @override
  SqlColumn get X_NEW_START_DATE => column("x_new_start_date");

  @override
  SqlColumn get X_NEW_END_DATE => column("x_new_end_date");

  @override
  SqlColumn get X_ID_ITEM_URL => column("x_id_item_url");

  @override
  SqlColumn get X_ID_CLASSIFICATION_URL => column("x_id_classification_url");

  @override
  SqlColumn get C_MAIN_QUANTITY => column("c_main_quantity");

  @override
  SqlColumn get C_MAIN_ID_ITEM_PACKAGE => column("c_main_id_item_package");

  @override
  SqlColumn get C_HAS_SECONDARY_ITEM_PACKAGES =>
      column("c_has_secondary_item_packages");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get ACTIVE => column("active");

  @override
  SqlColumn get VIRTUAL => column("virtual");

  @override
  SqlColumn get XL_NAME_IT => column("xl_name_it");

  @override
  SqlColumn get XL_NAME_EN => column("xl_name_en");

  @override
  SqlColumn get XL_NAME_DE => column("xl_name_de");

  @override
  SqlColumn get XL_NAME_FR => column("xl_name_fr");

  @override
  SqlColumn get XL_NAME_ES => column("xl_name_es");

  @override
  SqlColumn get XL_NAME_PT => column("xl_name_pt");

  @override
  SqlColumn get XL_NAME_RU => column("xl_name_ru");

  @override
  SqlColumn get XL_NAME_ZH => column("xl_name_zh");

  @override
  SqlColumn get L_DESCRIPTION_IT => column("l_description_it");

  @override
  SqlColumn get L_DESCRIPTION_EN => column("l_description_en");

  @override
  SqlColumn get L_DESCRIPTION_DE => column("l_description_de");

  @override
  SqlColumn get L_DESCRIPTION_FR => column("l_description_fr");

  @override
  SqlColumn get L_DESCRIPTION_ES => column("l_description_es");

  @override
  SqlColumn get L_DESCRIPTION_PT => column("l_description_pt");

  @override
  SqlColumn get L_DESCRIPTION_RU => column("l_description_ru");

  @override
  SqlColumn get L_DESCRIPTION_ZH => column("l_description_zh");

  @override
  SqlColumn get H_X_NEW_START_DATE => column("h_x_new_start_date");

  @override
  SqlColumn get H_X_NEW_END_DATE => column("h_x_new_end_date");

  @override
  SqlColumn get H_X_ID_ITEM_URL => column("h_x_id_item_url");

  @override
  SqlColumn get H_X_ID_CLASSIFICATION_URL =>
      column("h_x_id_classification_url");

  @override
  SqlColumn get H_XL_NAME_IT => column("h_xl_name_it");

  @override
  SqlColumn get H_XL_NAME_EN => column("h_xl_name_en");

  @override
  SqlColumn get H_XL_NAME_DE => column("h_xl_name_de");

  @override
  SqlColumn get H_XL_NAME_FR => column("h_xl_name_fr");

  @override
  SqlColumn get H_XL_NAME_ES => column("h_xl_name_es");

  @override
  SqlColumn get H_XL_NAME_PT => column("h_xl_name_pt");

  @override
  SqlColumn get H_XL_NAME_RU => column("h_xl_name_ru");

  @override
  SqlColumn get H_XL_NAME_ZH => column("h_xl_name_zh");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _NODE_TableImpl createClone(bool freeze) =>
      new _NODE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _NODE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["xl_name", "l_description", "h_xl_name"]);

  @override
  SqlLocalizedColumnGroup get XL_NAMES => localizedColumnGroup("xl_name");

  @override
  SqlLocalizedColumnGroup get L_DESCRIPTIONS =>
      localizedColumnGroup("l_description");

  @override
  SqlLocalizedColumnGroup get H_XL_NAMES => localizedColumnGroup("h_xl_name");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class NODE_DETAIL_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE;
  SqlColumn get ID_DETAIL;
  SqlColumn get SORTING;

  NODE_DETAIL_Table alias(String alias);
}

class _NODE_DETAIL_TableImpl extends SqlLocalizedTableImpl
    implements NODE_DETAIL_Table {
  static final Set<String> _pkNames = new Set.from(["id_node", "id_detail"]);
  static final Set<String> _columnNames =
      new Set.from(["id_node", "id_detail", "sorting"]);

  _NODE_DETAIL_TableImpl(SqlSchema schema) : super("node_detail", schema);

  _NODE_DETAIL_TableImpl.aliased(String alias, _NODE_DETAIL_TableImpl target)
      : super.aliased(alias, target);

  _NODE_DETAIL_TableImpl.cloneFrom(_NODE_DETAIL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_DETAIL => column("id_detail");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _NODE_DETAIL_TableImpl createClone(bool freeze) =>
      new _NODE_DETAIL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _NODE_DETAIL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class NODE_FEATURE_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE;
  SqlColumn get ID_FEATURE_TYPE;
  SqlColumn get ID_FEATURE;
  SqlColumn get CALCULATED;

  NODE_FEATURE_Table alias(String alias);
}

class _NODE_FEATURE_TableImpl extends SqlLocalizedTableImpl
    implements NODE_FEATURE_Table {
  static final Set<String> _pkNames =
      new Set.from(["id_node", "id_feature_type"]);
  static final Set<String> _columnNames =
      new Set.from(["id_node", "id_feature_type", "id_feature", "calculated"]);

  _NODE_FEATURE_TableImpl(SqlSchema schema) : super("node_feature", schema);

  _NODE_FEATURE_TableImpl.aliased(String alias, _NODE_FEATURE_TableImpl target)
      : super.aliased(alias, target);

  _NODE_FEATURE_TableImpl.cloneFrom(_NODE_FEATURE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_FEATURE_TYPE => column("id_feature_type");

  @override
  SqlColumn get ID_FEATURE => column("id_feature");

  @override
  SqlColumn get CALCULATED => column("calculated");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _NODE_FEATURE_TableImpl createClone(bool freeze) =>
      new _NODE_FEATURE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _NODE_FEATURE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class NODE_TYPE_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE_TYPE;
  SqlColumn get L_DESCRIPTION_IT;
  SqlColumn get L_DESCRIPTION_EN;
  SqlColumn get L_DESCRIPTION_DE;
  SqlColumn get L_DESCRIPTION_FR;
  SqlColumn get L_DESCRIPTION_ES;
  SqlColumn get L_DESCRIPTION_PT;
  SqlColumn get L_DESCRIPTION_RU;
  SqlColumn get L_DESCRIPTION_ZH;

  NODE_TYPE_Table alias(String alias);

  SqlLocalizedColumnGroup get L_DESCRIPTIONS;
}

class _NODE_TYPE_TableImpl extends SqlLocalizedTableImpl
    implements NODE_TYPE_Table {
  static final Set<String> _pkNames = new Set.from(["id_node_type"]);
  static final Set<String> _columnNames = new Set.from([
    "id_node_type",
    "l_description_it",
    "l_description_en",
    "l_description_de",
    "l_description_fr",
    "l_description_es",
    "l_description_pt",
    "l_description_ru",
    "l_description_zh"
  ]);

  _NODE_TYPE_TableImpl(SqlSchema schema) : super("node_type", schema);

  _NODE_TYPE_TableImpl.aliased(String alias, _NODE_TYPE_TableImpl target)
      : super.aliased(alias, target);

  _NODE_TYPE_TableImpl.cloneFrom(_NODE_TYPE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE_TYPE => column("id_node_type");

  @override
  SqlColumn get L_DESCRIPTION_IT => column("l_description_it");

  @override
  SqlColumn get L_DESCRIPTION_EN => column("l_description_en");

  @override
  SqlColumn get L_DESCRIPTION_DE => column("l_description_de");

  @override
  SqlColumn get L_DESCRIPTION_FR => column("l_description_fr");

  @override
  SqlColumn get L_DESCRIPTION_ES => column("l_description_es");

  @override
  SqlColumn get L_DESCRIPTION_PT => column("l_description_pt");

  @override
  SqlColumn get L_DESCRIPTION_RU => column("l_description_ru");

  @override
  SqlColumn get L_DESCRIPTION_ZH => column("l_description_zh");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _NODE_TYPE_TableImpl createClone(bool freeze) =>
      new _NODE_TYPE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _NODE_TYPE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_description"]);

  @override
  SqlLocalizedColumnGroup get L_DESCRIPTIONS =>
      localizedColumnGroup("l_description");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class NODE_URL_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE;
  SqlColumn get ID_URL;
  SqlColumn get SORTING;
  SqlColumn get PROPAGATE_TO_CHILDREN;

  NODE_URL_Table alias(String alias);
}

class _NODE_URL_TableImpl extends SqlLocalizedTableImpl
    implements NODE_URL_Table {
  static final Set<String> _pkNames = new Set.from(["id_node", "id_url"]);
  static final Set<String> _columnNames =
      new Set.from(["id_node", "id_url", "sorting", "propagate_to_children"]);

  _NODE_URL_TableImpl(SqlSchema schema) : super("node_url", schema);

  _NODE_URL_TableImpl.aliased(String alias, _NODE_URL_TableImpl target)
      : super.aliased(alias, target);

  _NODE_URL_TableImpl.cloneFrom(_NODE_URL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_URL => column("id_url");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get PROPAGATE_TO_CHILDREN => column("propagate_to_children");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _NODE_URL_TableImpl createClone(bool freeze) =>
      new _NODE_URL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _NODE_URL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class PACKAGE_Table implements SqlLocalizedTable {
  SqlColumn get ID_PACKAGE;
  SqlColumn get DEFAUL_QUANTITY_ON_ITEM_INSERT;
  SqlColumn get DEFAUL_SORTING_ON_ITEM_INSERT;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  PACKAGE_Table alias(String alias);

  SqlLocalizedColumnGroup get L_NAMES;
}

class _PACKAGE_TableImpl extends SqlLocalizedTableImpl
    implements PACKAGE_Table {
  static final Set<String> _pkNames = new Set.from(["id_package"]);
  static final Set<String> _columnNames = new Set.from([
    "id_package",
    "defaul_quantity_on_item_insert",
    "defaul_sorting_on_item_insert",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _PACKAGE_TableImpl(SqlSchema schema) : super("package", schema);

  _PACKAGE_TableImpl.aliased(String alias, _PACKAGE_TableImpl target)
      : super.aliased(alias, target);

  _PACKAGE_TableImpl.cloneFrom(_PACKAGE_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_PACKAGE => column("id_package");

  @override
  SqlColumn get DEFAUL_QUANTITY_ON_ITEM_INSERT =>
      column("defaul_quantity_on_item_insert");

  @override
  SqlColumn get DEFAUL_SORTING_ON_ITEM_INSERT =>
      column("defaul_sorting_on_item_insert");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _PACKAGE_TableImpl createClone(bool freeze) =>
      new _PACKAGE_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _PACKAGE_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class PRICE_LIST_Table implements SqlLocalizedTable {
  SqlColumn get ID_PRICE_LIST;
  SqlColumn get CURRENCY_ISO_CODE;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  PRICE_LIST_Table alias(String alias);

  SqlLocalizedColumnGroup get L_NAMES;
}

class _PRICE_LIST_TableImpl extends SqlLocalizedTableImpl
    implements PRICE_LIST_Table {
  static final Set<String> _pkNames = new Set.from(["id_price_list"]);
  static final Set<String> _columnNames = new Set.from([
    "id_price_list",
    "currency_iso_code",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _PRICE_LIST_TableImpl(SqlSchema schema) : super("price_list", schema);

  _PRICE_LIST_TableImpl.aliased(String alias, _PRICE_LIST_TableImpl target)
      : super.aliased(alias, target);

  _PRICE_LIST_TableImpl.cloneFrom(_PRICE_LIST_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_PRICE_LIST => column("id_price_list");

  @override
  SqlColumn get CURRENCY_ISO_CODE => column("currency_iso_code");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _PRICE_LIST_TableImpl createClone(bool freeze) =>
      new _PRICE_LIST_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _PRICE_LIST_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set.from(["l_name"]);

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_names");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class PROFILE_CATALOG_Table implements SqlLocalizedTable {
  SqlColumn get ID_PROFILE;
  SqlColumn get ID_CATALOG;

  PROFILE_CATALOG_Table alias(String alias);
}

class _PROFILE_CATALOG_TableImpl extends SqlLocalizedTableImpl
    implements PROFILE_CATALOG_Table {
  static final Set<String> _pkNames =
      new Set.from(["id_profile", "id_catalog"]);
  static final Set<String> _columnNames =
      new Set.from(["id_profile", "id_catalog"]);

  _PROFILE_CATALOG_TableImpl(SqlSchema schema)
      : super("profile_catalog", schema);

  _PROFILE_CATALOG_TableImpl.aliased(
      String alias, _PROFILE_CATALOG_TableImpl target)
      : super.aliased(alias, target);

  _PROFILE_CATALOG_TableImpl.cloneFrom(
      _PROFILE_CATALOG_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_PROFILE => column("id_profile");

  @override
  SqlColumn get ID_CATALOG => column("id_catalog");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _PROFILE_CATALOG_TableImpl createClone(bool freeze) =>
      new _PROFILE_CATALOG_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _PROFILE_CATALOG_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups = new Set();

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class URL_Table implements SqlLocalizedTable {
  SqlColumn get ID_URL;
  SqlColumn get PATH;
  SqlColumn get TYPE;
  SqlColumn get HAS_THUMBNAIL;
  SqlColumn get HAS_PREVIEW;
  SqlColumn get L_ASSET_IT;
  SqlColumn get L_ASSET_EN;
  SqlColumn get L_ASSET_DE;
  SqlColumn get L_ASSET_FR;
  SqlColumn get L_ASSET_ES;
  SqlColumn get L_ASSET_PT;
  SqlColumn get L_ASSET_RU;
  SqlColumn get L_ASSET_ZH;
  SqlColumn get L_NAME_IT;
  SqlColumn get L_NAME_EN;
  SqlColumn get L_NAME_DE;
  SqlColumn get L_NAME_FR;
  SqlColumn get L_NAME_ES;
  SqlColumn get L_NAME_PT;
  SqlColumn get L_NAME_RU;
  SqlColumn get L_NAME_ZH;
  SqlColumn get EXTERNAL_ID_REF;

  URL_Table alias(String alias);

  SqlLocalizedColumnGroup get L_ASSETS;
  SqlLocalizedColumnGroup get L_NAMES;
}

class _URL_TableImpl extends SqlLocalizedTableImpl implements URL_Table {
  static final Set<String> _pkNames = new Set.from(["id_url"]);
  static final Set<String> _columnNames = new Set.from([
    "id_url",
    "path",
    "type",
    "has_thumbnail",
    "has_preview",
    "l_asset_it",
    "l_asset_en",
    "l_asset_de",
    "l_asset_fr",
    "l_asset_es",
    "l_asset_pt",
    "l_asset_ru",
    "l_asset_zh",
    "l_name_it",
    "l_name_en",
    "l_name_de",
    "l_name_fr",
    "l_name_es",
    "l_name_pt",
    "l_name_ru",
    "l_name_zh",
    "external_id_ref"
  ]);

  _URL_TableImpl(SqlSchema schema) : super("url", schema);

  _URL_TableImpl.aliased(String alias, _URL_TableImpl target)
      : super.aliased(alias, target);

  _URL_TableImpl.cloneFrom(_URL_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_URL => column("id_url");

  @override
  SqlColumn get PATH => column("path");

  @override
  SqlColumn get TYPE => column("type");

  @override
  SqlColumn get HAS_THUMBNAIL => column("has_thumbnail");

  @override
  SqlColumn get HAS_PREVIEW => column("has_preview");

  @override
  SqlColumn get L_ASSET_IT => column("l_asset_it");

  @override
  SqlColumn get L_ASSET_EN => column("l_asset_en");

  @override
  SqlColumn get L_ASSET_DE => column("l_asset_de");

  @override
  SqlColumn get L_ASSET_FR => column("l_asset_fr");

  @override
  SqlColumn get L_ASSET_ES => column("l_asset_es");

  @override
  SqlColumn get L_ASSET_PT => column("l_asset_pt");

  @override
  SqlColumn get L_ASSET_RU => column("l_asset_ru");

  @override
  SqlColumn get L_ASSET_ZH => column("l_asset_zh");

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
  SqlColumn get EXTERNAL_ID_REF => column("external_id_ref");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _URL_TableImpl createClone(bool freeze) =>
      new _URL_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _URL_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["l_asset", "l_name"]);

  @override
  SqlLocalizedColumnGroup get L_ASSETS => localizedColumnGroup("l_asset");

  @override
  SqlLocalizedColumnGroup get L_NAMES => localizedColumnGroup("l_name");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class V_CLASSIFICATION_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE;
  SqlColumn get ID_NODE_TYPE;
  SqlColumn get ID_PARENT_NODE;
  SqlColumn get ID_BRAND;
  SqlColumn get C_ID_PARENT_CLASSIFICATION;
  SqlColumn get C_ID_PARENT_CLASSIFICATION1;
  SqlColumn get C_ID_PARENT_CLASSIFICATION2;
  SqlColumn get C_ID_PARENT_CLASSIFICATION3;
  SqlColumn get C_ID_PARENT_CLASSIFICATION4;
  SqlColumn get XL_NAME_IT;
  SqlColumn get XL_NAME_EN;
  SqlColumn get L_DESCRIPTION_IT;
  SqlColumn get L_DESCRIPTION_EN;
  SqlColumn get X_NEW_START_DATE;
  SqlColumn get X_NEW_END_DATE;
  SqlColumn get X_ID_ITEM_URL;
  SqlColumn get X_ID_CLASSIFICATION_URL;
  SqlColumn get SORTING;
  SqlColumn get ACTIVE;
  SqlColumn get VIRTUAL;
  SqlColumn get H_XL_NAME_IT;
  SqlColumn get H_XL_NAME_EN;
  SqlColumn get H_X_NEW_START_DATE;
  SqlColumn get H_X_NEW_END_DATE;
  SqlColumn get H_X_ID_ITEM_URL;
  SqlColumn get H_X_ID_CLASSIFICATION_URL;
  SqlColumn get H_XL_NAME_DE;
  SqlColumn get H_XL_NAME_FR;
  SqlColumn get H_XL_NAME_ES;
  SqlColumn get H_XL_NAME_PT;
  SqlColumn get H_XL_NAME_RU;
  SqlColumn get H_XL_NAME_ZH;
  SqlColumn get L_DESCRIPTION_DE;
  SqlColumn get L_DESCRIPTION_FR;
  SqlColumn get L_DESCRIPTION_ES;
  SqlColumn get L_DESCRIPTION_PT;
  SqlColumn get L_DESCRIPTION_RU;
  SqlColumn get L_DESCRIPTION_ZH;
  SqlColumn get XL_NAME_DE;
  SqlColumn get XL_NAME_FR;
  SqlColumn get XL_NAME_ES;
  SqlColumn get XL_NAME_PT;
  SqlColumn get XL_NAME_RU;
  SqlColumn get XL_NAME_ZH;

  V_CLASSIFICATION_Table alias(String alias);

  SqlLocalizedColumnGroup get H_XL_NAMES;
  SqlLocalizedColumnGroup get L_DESCRIPTIONS;
  SqlLocalizedColumnGroup get XL_NAMES;
}

class _V_CLASSIFICATION_TableImpl extends SqlLocalizedTableImpl
    implements V_CLASSIFICATION_Table {
  static final Set<String> _pkNames = new Set.from([]);
  static final Set<String> _columnNames = new Set.from([
    "id_node",
    "id_node_type",
    "id_parent_node",
    "id_brand",
    "c_id_parent_classification",
    "c_id_parent_classification1",
    "c_id_parent_classification2",
    "c_id_parent_classification3",
    "c_id_parent_classification4",
    "xl_name_it",
    "xl_name_en",
    "l_description_it",
    "l_description_en",
    "x_new_start_date",
    "x_new_end_date",
    "x_id_item_url",
    "x_id_classification_url",
    "sorting",
    "active",
    "virtual",
    "h_xl_name_it",
    "h_xl_name_en",
    "h_x_new_start_date",
    "h_x_new_end_date",
    "h_x_id_item_url",
    "h_x_id_classification_url",
    "h_xl_name_de",
    "h_xl_name_fr",
    "h_xl_name_es",
    "h_xl_name_pt",
    "h_xl_name_ru",
    "h_xl_name_zh",
    "l_description_de",
    "l_description_fr",
    "l_description_es",
    "l_description_pt",
    "l_description_ru",
    "l_description_zh",
    "xl_name_de",
    "xl_name_fr",
    "xl_name_es",
    "xl_name_pt",
    "xl_name_ru",
    "xl_name_zh"
  ]);

  _V_CLASSIFICATION_TableImpl(SqlSchema schema)
      : super("v_classification", schema);

  _V_CLASSIFICATION_TableImpl.aliased(
      String alias, _V_CLASSIFICATION_TableImpl target)
      : super.aliased(alias, target);

  _V_CLASSIFICATION_TableImpl.cloneFrom(
      _V_CLASSIFICATION_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_NODE_TYPE => column("id_node_type");

  @override
  SqlColumn get ID_PARENT_NODE => column("id_parent_node");

  @override
  SqlColumn get ID_BRAND => column("id_brand");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION =>
      column("c_id_parent_classification");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION1 =>
      column("c_id_parent_classification1");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION2 =>
      column("c_id_parent_classification2");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION3 =>
      column("c_id_parent_classification3");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION4 =>
      column("c_id_parent_classification4");

  @override
  SqlColumn get XL_NAME_IT => column("xl_name_it");

  @override
  SqlColumn get XL_NAME_EN => column("xl_name_en");

  @override
  SqlColumn get L_DESCRIPTION_IT => column("l_description_it");

  @override
  SqlColumn get L_DESCRIPTION_EN => column("l_description_en");

  @override
  SqlColumn get X_NEW_START_DATE => column("x_new_start_date");

  @override
  SqlColumn get X_NEW_END_DATE => column("x_new_end_date");

  @override
  SqlColumn get X_ID_ITEM_URL => column("x_id_item_url");

  @override
  SqlColumn get X_ID_CLASSIFICATION_URL => column("x_id_classification_url");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get ACTIVE => column("active");

  @override
  SqlColumn get VIRTUAL => column("virtual");

  @override
  SqlColumn get H_XL_NAME_IT => column("h_xl_name_it");

  @override
  SqlColumn get H_XL_NAME_EN => column("h_xl_name_en");

  @override
  SqlColumn get H_X_NEW_START_DATE => column("h_x_new_start_date");

  @override
  SqlColumn get H_X_NEW_END_DATE => column("h_x_new_end_date");

  @override
  SqlColumn get H_X_ID_ITEM_URL => column("h_x_id_item_url");

  @override
  SqlColumn get H_X_ID_CLASSIFICATION_URL =>
      column("h_x_id_classification_url");

  @override
  SqlColumn get H_XL_NAME_DE => column("h_xl_name_de");

  @override
  SqlColumn get H_XL_NAME_FR => column("h_xl_name_fr");

  @override
  SqlColumn get H_XL_NAME_ES => column("h_xl_name_es");

  @override
  SqlColumn get H_XL_NAME_PT => column("h_xl_name_pt");

  @override
  SqlColumn get H_XL_NAME_RU => column("h_xl_name_ru");

  @override
  SqlColumn get H_XL_NAME_ZH => column("h_xl_name_zh");

  @override
  SqlColumn get L_DESCRIPTION_DE => column("l_description_de");

  @override
  SqlColumn get L_DESCRIPTION_FR => column("l_description_fr");

  @override
  SqlColumn get L_DESCRIPTION_ES => column("l_description_es");

  @override
  SqlColumn get L_DESCRIPTION_PT => column("l_description_pt");

  @override
  SqlColumn get L_DESCRIPTION_RU => column("l_description_ru");

  @override
  SqlColumn get L_DESCRIPTION_ZH => column("l_description_zh");

  @override
  SqlColumn get XL_NAME_DE => column("xl_name_de");

  @override
  SqlColumn get XL_NAME_FR => column("xl_name_fr");

  @override
  SqlColumn get XL_NAME_ES => column("xl_name_es");

  @override
  SqlColumn get XL_NAME_PT => column("xl_name_pt");

  @override
  SqlColumn get XL_NAME_RU => column("xl_name_ru");

  @override
  SqlColumn get XL_NAME_ZH => column("xl_name_zh");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _V_CLASSIFICATION_TableImpl createClone(bool freeze) =>
      new _V_CLASSIFICATION_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _V_CLASSIFICATION_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["xl_name", "l_description", "h_xl_name"]);

  @override
  SqlLocalizedColumnGroup get XL_NAMES => localizedColumnGroup("xl_name");

  @override
  SqlLocalizedColumnGroup get L_DESCRIPTIONS =>
      localizedColumnGroup("l_description");

  @override
  SqlLocalizedColumnGroup get H_XL_NAMES => localizedColumnGroup("h_xl_name");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}

abstract class V_ITEM_Table implements SqlLocalizedTable {
  SqlColumn get ID_NODE;
  SqlColumn get ID_NODE_TYPE;
  SqlColumn get ID_PARENT_NODE;
  SqlColumn get ID_BRAND;
  SqlColumn get C_ID_PARENT_CLASSIFICATION;
  SqlColumn get C_ID_PARENT_CLASSIFICATION1;
  SqlColumn get C_ID_PARENT_CLASSIFICATION2;
  SqlColumn get C_ID_PARENT_CLASSIFICATION3;
  SqlColumn get C_ID_PARENT_CLASSIFICATION4;
  SqlColumn get XL_NAME_IT;
  SqlColumn get XL_NAME_EN;
  SqlColumn get L_DESCRIPTION_IT;
  SqlColumn get L_DESCRIPTION_EN;
  SqlColumn get X_NEW_START_DATE;
  SqlColumn get X_NEW_END_DATE;
  SqlColumn get X_ID_ITEM_URL;
  SqlColumn get X_ID_CLASSIFICATION_URL;
  SqlColumn get SORTING;
  SqlColumn get ACTIVE;
  SqlColumn get VIRTUAL;
  SqlColumn get H_XL_NAME_IT;
  SqlColumn get H_XL_NAME_EN;
  SqlColumn get H_X_NEW_START_DATE;
  SqlColumn get H_X_NEW_END_DATE;
  SqlColumn get H_X_ID_ITEM_URL;
  SqlColumn get H_X_ID_CLASSIFICATION_URL;
  SqlColumn get H_XL_NAME_DE;
  SqlColumn get H_XL_NAME_FR;
  SqlColumn get H_XL_NAME_ES;
  SqlColumn get H_XL_NAME_PT;
  SqlColumn get H_XL_NAME_RU;
  SqlColumn get H_XL_NAME_ZH;
  SqlColumn get L_DESCRIPTION_DE;
  SqlColumn get L_DESCRIPTION_FR;
  SqlColumn get L_DESCRIPTION_ES;
  SqlColumn get L_DESCRIPTION_PT;
  SqlColumn get L_DESCRIPTION_RU;
  SqlColumn get L_DESCRIPTION_ZH;
  SqlColumn get XL_NAME_DE;
  SqlColumn get XL_NAME_FR;
  SqlColumn get XL_NAME_ES;
  SqlColumn get XL_NAME_PT;
  SqlColumn get XL_NAME_RU;
  SqlColumn get XL_NAME_ZH;

  V_ITEM_Table alias(String alias);

  SqlLocalizedColumnGroup get H_XL_NAMES;
  SqlLocalizedColumnGroup get L_DESCRIPTIONS;
  SqlLocalizedColumnGroup get XL_NAMES;
}

class _V_ITEM_TableImpl extends SqlLocalizedTableImpl implements V_ITEM_Table {
  static final Set<String> _pkNames = new Set.from([]);
  static final Set<String> _columnNames = new Set.from([
    "id_node",
    "id_node_type",
    "id_parent_node",
    "id_brand",
    "c_id_parent_classification",
    "c_id_parent_classification1",
    "c_id_parent_classification2",
    "c_id_parent_classification3",
    "c_id_parent_classification4",
    "xl_name_it",
    "xl_name_en",
    "l_description_it",
    "l_description_en",
    "x_new_start_date",
    "x_new_end_date",
    "x_id_item_url",
    "x_id_classification_url",
    "sorting",
    "active",
    "virtual",
    "h_xl_name_it",
    "h_xl_name_en",
    "h_x_new_start_date",
    "h_x_new_end_date",
    "h_x_id_item_url",
    "h_x_id_classification_url",
    "h_xl_name_de",
    "h_xl_name_fr",
    "h_xl_name_es",
    "h_xl_name_pt",
    "h_xl_name_ru",
    "h_xl_name_zh",
    "l_description_de",
    "l_description_fr",
    "l_description_es",
    "l_description_pt",
    "l_description_ru",
    "l_description_zh",
    "xl_name_de",
    "xl_name_fr",
    "xl_name_es",
    "xl_name_pt",
    "xl_name_ru",
    "xl_name_zh"
  ]);

  _V_ITEM_TableImpl(SqlSchema schema) : super("v_item", schema);

  _V_ITEM_TableImpl.aliased(String alias, _V_ITEM_TableImpl target)
      : super.aliased(alias, target);

  _V_ITEM_TableImpl.cloneFrom(_V_ITEM_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID_NODE => column("id_node");

  @override
  SqlColumn get ID_NODE_TYPE => column("id_node_type");

  @override
  SqlColumn get ID_PARENT_NODE => column("id_parent_node");

  @override
  SqlColumn get ID_BRAND => column("id_brand");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION =>
      column("c_id_parent_classification");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION1 =>
      column("c_id_parent_classification1");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION2 =>
      column("c_id_parent_classification2");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION3 =>
      column("c_id_parent_classification3");

  @override
  SqlColumn get C_ID_PARENT_CLASSIFICATION4 =>
      column("c_id_parent_classification4");

  @override
  SqlColumn get XL_NAME_IT => column("xl_name_it");

  @override
  SqlColumn get XL_NAME_EN => column("xl_name_en");

  @override
  SqlColumn get L_DESCRIPTION_IT => column("l_description_it");

  @override
  SqlColumn get L_DESCRIPTION_EN => column("l_description_en");

  @override
  SqlColumn get X_NEW_START_DATE => column("x_new_start_date");

  @override
  SqlColumn get X_NEW_END_DATE => column("x_new_end_date");

  @override
  SqlColumn get X_ID_ITEM_URL => column("x_id_item_url");

  @override
  SqlColumn get X_ID_CLASSIFICATION_URL => column("x_id_classification_url");

  @override
  SqlColumn get SORTING => column("sorting");

  @override
  SqlColumn get ACTIVE => column("active");

  @override
  SqlColumn get VIRTUAL => column("virtual");

  @override
  SqlColumn get H_XL_NAME_IT => column("h_xl_name_it");

  @override
  SqlColumn get H_XL_NAME_EN => column("h_xl_name_en");

  @override
  SqlColumn get H_X_NEW_START_DATE => column("h_x_new_start_date");

  @override
  SqlColumn get H_X_NEW_END_DATE => column("h_x_new_end_date");

  @override
  SqlColumn get H_X_ID_ITEM_URL => column("h_x_id_item_url");

  @override
  SqlColumn get H_X_ID_CLASSIFICATION_URL =>
      column("h_x_id_classification_url");

  @override
  SqlColumn get H_XL_NAME_DE => column("h_xl_name_de");

  @override
  SqlColumn get H_XL_NAME_FR => column("h_xl_name_fr");

  @override
  SqlColumn get H_XL_NAME_ES => column("h_xl_name_es");

  @override
  SqlColumn get H_XL_NAME_PT => column("h_xl_name_pt");

  @override
  SqlColumn get H_XL_NAME_RU => column("h_xl_name_ru");

  @override
  SqlColumn get H_XL_NAME_ZH => column("h_xl_name_zh");

  @override
  SqlColumn get L_DESCRIPTION_DE => column("l_description_de");

  @override
  SqlColumn get L_DESCRIPTION_FR => column("l_description_fr");

  @override
  SqlColumn get L_DESCRIPTION_ES => column("l_description_es");

  @override
  SqlColumn get L_DESCRIPTION_PT => column("l_description_pt");

  @override
  SqlColumn get L_DESCRIPTION_RU => column("l_description_ru");

  @override
  SqlColumn get L_DESCRIPTION_ZH => column("l_description_zh");

  @override
  SqlColumn get XL_NAME_DE => column("xl_name_de");

  @override
  SqlColumn get XL_NAME_FR => column("xl_name_fr");

  @override
  SqlColumn get XL_NAME_ES => column("xl_name_es");

  @override
  SqlColumn get XL_NAME_PT => column("xl_name_pt");

  @override
  SqlColumn get XL_NAME_RU => column("xl_name_ru");

  @override
  SqlColumn get XL_NAME_ZH => column("xl_name_zh");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  _V_ITEM_TableImpl createClone(bool freeze) =>
      new _V_ITEM_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new _V_ITEM_TableImpl.aliased(alias, this);

  /* LOCALIZED SUPPORT */

  static final Set<String> _localizedGroups =
      new Set.from(["xl_name", "l_description", "h_xl_name"]);

  @override
  SqlLocalizedColumnGroup get XL_NAMES => localizedColumnGroup("xl_name");

  @override
  SqlLocalizedColumnGroup get L_DESCRIPTIONS =>
      localizedColumnGroup("l_description");

  @override
  SqlLocalizedColumnGroup get H_XL_NAMES => localizedColumnGroup("h_xl_name");

  @override
  Set<String> get localizedColumnGroupNames => _localizedGroups;
}
