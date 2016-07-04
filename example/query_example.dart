// Copyright (c) 2016, Roberto Tassi. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:sqltree/sqltree.dart' as sql;

import 'package:sqltree_schema/sqltree_schema.dart' as sql;

import 'users_schema.g.dart' as DB;

main() {
  // 1. preparazione della query
  var query = new Query(sql.select(DB.USERS.columns)
    ..from(DB.USERS)
    ..where(sql.equal(DB.USERS.STATUS, sql.parameter('status'))));

  // TODO parametri: definizione nome, tipo, trasformazione e assegnamento valore (date e booleani)
  // il tipo lo setto insieme al valore del parametro
  query["status"] =
      true; // il parametro viene settato così com'è senza fare supposizione sul tipo
  query.set("status",
      true); // il parametro viene settato così com'è senza fare supposizione sul tipo

  query.set("status", true,
      type: SqlType
          .TINYINT); // il parametro viene convertito in int e mandato come tale
  query.setTinyInt("status",
      true); // il parametro viene convertito in int e mandato come tale

  query.set("status", true,
      converter: (status) =>
          status ? 1 : 0); // il parametro viene convertito e mandato come tale
  // query.set("status", true, descriptor: new BoolDescriptor());

  // TODO resultset: definizione nome, tipo, trasformazione
  // posso definire i tipi per forzare il tipo di recupero (in questo modo possono essere recuperati correttamente)
  query.valueDescriptors["status"] = new DateDescriptor();
  query.setValueDescriptor["status"] = new DateDescriptor();

  // 2. esecuzione della query e recupero ResultSet
  QueryResult result = new QueryResult();

  // TODO specifico di come è implementata la connessione

  // 3. lettura resultset
  for (var record in result.rows) {
    // resultset: recupero valore
    record[DB.USERS.ID];
    record.getValue(DB.USERS.ID, new DateDescriptor());
    record.getDate(DB.USERS.ID);
    record.getDateTime(DB.USERS.ID);
    record.getTime(DB.USERS.ID);
    record.getBool(DB.USERS.ID);
  }
}

class Query {
  final sql.SqlStatement statement;

  final QueryParameters parameters = new QueryParameters();

  Query(this.statement);
}

class QueryParameters {}

class QueryResult {
  List<QueryResultRow> rows;
}

class QueryResultRow {}
