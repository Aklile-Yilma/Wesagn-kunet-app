
import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:wesagnkunet/infrastructure/lib/localdb/DBRequest.dart';


class DBClient{

  Database? db;
  String path;

  DBClient(this.path);

  Future init() async{
    db = await openDatabase(path, version: 1);
  }

  Future<int> _insert(DBRequest request) async{
    return await db!.insert(request.tableName, request.getInputMap());
  }

  Future<int> _update(DBRequest request) async{
    return await db!.update(
                          request.tableName,
                          request.getInputMap(),
                          where: request.getCondition(),
                          whereArgs: request.getConditionArgs()
                        );

  }

  Future<List<Map>> _select<R>(DBRequest<R> request) async{
    
    return await db!.query(
                          request.tableName,
                          where: request.getCondition(),
                          whereArgs: request.getConditionArgs()
                        );

  }

  Future<R?> execute<R>(DBRequest<R> request) async{
    if(db == null){
      await init();
    }

    if(await _checkAndCreateTable(request)){
      return null;
    }

    dynamic response;

    switch(request.getOperationType()){
      
      case OperationType.insert:
        response = await _insert(request);
        break;

      case OperationType.update:
        response = await _update(request);
        break;

      case OperationType.select:
        response = await _select(request);
        break;

    }

    return request.deserializeObject(response);

  }


  Future<bool> _checkAndCreateTable(DBRequest request) async{

    if(! await _checkTableExists(request.tableName)){
      log("Createing Table ${request.tableName}");
      await db!.execute(request.getCreateTableQuery());
      return true;
    }

    return false;

  }

  Future<bool> _checkTableExists(String tableName) async{

    var result = (await db!.query("sqlite_master", where: 'name = ?', whereArgs: [tableName]));

    return result.isNotEmpty;

  }

}