// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'package:sqltree_schema/sqltree_schema.dart' as sql;

import 'users_schema.g.dart' as DB;

/*

- gestire il factory del localized
- gestire le differenze tra mysql e sqlite (vedi date per esempio)

 */

main() {
  // 1. preparazione della query
  LocalizableQuery query;
  // statement
  query.statement = sql.select();
  // parametri
  query.parameters["status"] = true;
  query.parameters.set("status", true);
  query.parameters.setBool("status", true);
  query.parameters.set("status", true, type: QueryValueType.BOOL);
  // parametri localizzati
  LocalizedBools translateds;
  query.parameters.set("translated", translateds);
  query.parameters.set("translated", translateds,
      type: LocalizedQueryValueType.LOCALIZED_BOOLS);
  query.parameters.setLocalizedBools("translated", translateds);
  // tipi colonne risultati
  query.resultValueTypes["status"] = QueryValueType.BOOL;
  query.resultValueTypes.setBoolType("status");
  query.resultValueTypes.setType("status", QueryValueType.BOOL);
  // tipi colonne risultati localizzate
  query.resultValueTypes["translated"] =
      LocalizedQueryValueType.LOCALIZED_BOOLS;
  query.resultValueTypes
      .setType("translated", LocalizedQueryValueType.LOCALIZED_BOOLS);
  query.resultValueTypes.setLocalizedBoolsType("translated");

  // 2. esecuzione della query e recupero ResultSet
  // TODO specifico di come è implementata la connessione
  LocalizableQueryExecutor executor = null;
  var result = executor.execute(query);

  // 3. lettura resultset
  if (result.isResultSet) {
    for (var record in result.rows) {
      // recupero colonne
      record["status"];
      record.get("status");
      record.get("status", type: QueryValueType.BOOL);
      record.getBool("status");
      // recupero colonne localizzate
      record["translated"];
      record.get("translated");
      record.get("translated", type: LocalizedQueryValueType.LOCALIZED_BOOLS);
      record.getLocalizedBools("translated");
    }
  } else {
    result.lastInsertId;
    result.affectedRows;
  }
}

abstract class Query {
  void set statement(sql.SqlStatement statement);

  QueryParameters get parameters;

  QueryResultColumnTypes get resultValueTypes;
}

abstract class QueryParameters {
  void operator []=(dynamic parameter, dynamic value);
  void set(dynamic parameter, dynamic value, {QueryValueType type});
  void setBool(dynamic parameter, bool value);
  void setDateTime(dynamic parameter, DateTime value);
  void setDate(dynamic parameter, DateTime value);
  void setTime(dynamic parameter, DateTime value);
}

abstract class QueryResultColumnTypes {
  void operator []=(dynamic column, QueryValueType type);
  void setType(dynamic column, QueryValueType type);
  void setBoolType(dynamic column);
  void setDateTimeType(dynamic column);
  void setDateType(dynamic column);
  void setTimeType(dynamic column);
}

abstract class QueryValueType {
  static const QueryValueType BOOL = null;
  static const QueryValueType DATETIME = null;
  static const QueryValueType DATE = null;
  static const QueryValueType TIME = null;
}

abstract class QueryParameter {
  void set type(QueryValueType type);
  void set value(value);
}

abstract class QueryExecutor<Q extends Query, R extends QueryResult> {
  R execute(Q query);
}

abstract class QueryResult {
  bool get isResultSet;

  int get lastInsertId;
  int get affectedRows;

  List<QueryResultRow> get rows;
}

abstract class QueryResultRow {
  operator [](dynamic column);
  get(dynamic column, {QueryValueType type});
  bool getBool(dynamic column);
  DateTime getDateTime(dynamic column);
  DateTime getDate(dynamic column);
  DateTime getTime(dynamic column);
}

abstract class LocalizedQueryValueType implements QueryValueType {
  static const LocalizedQueryValueType LOCALIZED_BOOLS = null;
  static const LocalizedQueryValueType LOCALIZED_DATETIMES = null;
  static const LocalizedQueryValueType LOCALIZED_DATES = null;
  static const LocalizedQueryValueType LOCALIZED_TIMES = null;

  QueryValueType get localizedType;
}

abstract class LocalizableQuery implements Query {
  LocalizableQueryParameters get parameters;

  LocalizableQueryResultValueTypes get resultValueTypes;
}

abstract class LocalizableQueryParameters implements QueryParameters {
  void setLocalizedBools(dynamic localizedParameter, LocalizedBools values);
  void setLocalizedDateTimes(
      dynamic localizedParameter, LocalizedDateTimes values);
  void setLocalizedDates(dynamic localized, LocalizedDateTimes values);
  void setLocalizedTimesParameter(dynamic localized, LocalizedDateTimes values);
}

abstract class LocalizableQueryResultValueTypes
    implements QueryResultColumnTypes {
  void setLocalizedBoolsType(dynamic localizedColumn);
  void setLocalizedDateTimesType(dynamic localizedColumn);
  void setLocalizedDatesType(dynamic localizedColumn);
  void setLocalizedTimesType(dynamic localizedColumn);
}

abstract class LocalizableQueryExecutor
    implements QueryExecutor<LocalizableQuery, LocalizableQueryResult> {
  void set currentLocale(String currentLocale);
  void set mainLocale(String mainLocale);
}

abstract class LocalizableQueryResult implements QueryResult {
  List<LocalizableQueryResultRow> get rows;
}

abstract class LocalizableQueryResultRow implements QueryResultRow {
  LocalizedBools getLocalizedBools(dynamic localizedColumn);
  LocalizedDateTimes getLocalizedDateTimes(dynamic localizedColumn);
  LocalizedDateTimes getLocalizedDate(dynamic localizedColumn);
  LocalizedDateTimes getLocalizedTime(dynamic localizedColumn);
}

abstract class LocalizedDateTimes extends LocalizedObjects<DateTime> {}

abstract class LocalizedBools extends LocalizedObjects<bool> {}

abstract class LocalizedStrings extends LocalizedObjects<String> {}

abstract class LocalizedObjects<T> {
  bool get isNotEmpty;

  int get length;

  bool get isCurrentLocalized;

  T get currentLocalized;

  void set currentLocalized(T currentLocalized);

  T operator [](String locale);

  void operator []=(String locale, T value);
}
