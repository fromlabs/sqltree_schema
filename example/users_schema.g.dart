

library users_schema;

import 'package:sqltree_schema/sqltree_schema_builder.dart';

final USERS_Table USERS = registerSharedTable(new USERS_TableImpl());

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

class USERS_TableImpl extends SqlTableImpl implements USERS_Table {
  static final Set<String> _pkNames = new Set.from(["ID"]);
  static final Set<String> _columnNames = new Set.from(["ID", "GROUP_ID", "AUTHOR_ID", "REVIEWER_ID", "PUBLISHER_ID", "STATUS", "MAIN_LOCALE", "CATEGORY", "TITLE", "ABSTRACT", "ABSTRACT_IMAGE_URL", "BODY", "PUBLISHING_DATE", "CREATION_TIMESTAMP"]);

  USERS_TableImpl() : super("USERS");

  USERS_TableImpl.aliased(String alias, USERS_TableImpl target)
      : super.aliased(alias, target);

  USERS_TableImpl.cloneFrom(USERS_TableImpl target, bool freeze)
      : super.cloneFrom(target, freeze);

  @override
  SqlColumn get ID => column("ID");

  @override
  SqlColumn get GROUP_ID => column("GROUP_ID");

  @override
  SqlColumn get AUTHOR_ID => column("AUTHOR_ID");

  @override
  SqlColumn get REVIEWER_ID => column("REVIEWER_ID");

  @override
  SqlColumn get PUBLISHER_ID => column("PUBLISHER_ID");

  @override
  SqlColumn get STATUS => column("STATUS");

  @override
  SqlColumn get MAIN_LOCALE => column("MAIN_LOCALE");

  @override
  SqlColumn get CATEGORY => column("CATEGORY");

  @override
  SqlColumn get TITLE => column("TITLE");

  @override
  SqlColumn get ABSTRACT => column("ABSTRACT");

  @override
  SqlColumn get ABSTRACT_IMAGE_URL => column("ABSTRACT_IMAGE_URL");

  @override
  SqlColumn get BODY => column("BODY");

  @override
  SqlColumn get PUBLISHING_DATE => column("PUBLISHING_DATE");

  @override
  SqlColumn get CREATION_TIMESTAMP => column("CREATION_TIMESTAMP");

  @override
  Set<String> get primaryKeyNames => _pkNames;

  @override
  Set<String> get columnNames => _columnNames;

  @override
  USERS_TableImpl createClone(bool freeze) =>
      new USERS_TableImpl.cloneFrom(this, freeze);

  @override
  SqlTable createTableAlias(String alias) =>
      new USERS_TableImpl.aliased(alias, this);
}
