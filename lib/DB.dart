import 'package:flutter_tabpar/TaskModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  MyDatabase._();

  static MyDatabase myDatabase = MyDatabase._();
  static final String dbName = 'task.db';
  static final String tableName = 'tasks';
  static final String columnIdName = 'id';
  static final String columnTaskName = 'name';
  static final String columnTaskValueName = 'value';
  static final String sqlCreateTable = '''CREATE TABLE $tableName (
  $columnIdName INTEGER PRIMARY KEY AUTOINCREMENT ,
  $columnTaskName TEXT NOT NULL,
  $columnTaskValueName INTEGER NOT NULL
  );''';

  Database database;
 initDb() async {
    if (database == null)
      return await createDb();
    else
      return database;
  }
  Future<Database> createDb() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'demo.db');
      return openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute(sqlCreateTable);
      });
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
  insertTask(TaskModel taskModel) async{
   var db=await initDb();
   db.insert(tableName, TaskModel.toMap(taskModel));
  }
  Future<List<Map>>getAllTask()async{
    var db=await initDb();
    return await db.query(tableName);
  }
  Future<List<Map>> getTask(String taskName)async{
    var db=await initDb();
  return db.query(tableName,where: "$columnTaskName=?",whereArgs: [tableName]);
  }
  Future<List<Map>> getTaskWhere(bool value)async{
   var _value=value?1:0;
    var db=await initDb();
    return db.query(tableName,where: "$columnTaskValueName=?",whereArgs: [_value]);
  }
  Future updateTask(TaskModel taskModel)async{
    var db=await initDb();
    db.update(tableName, TaskModel.toMap(taskModel),where: "$columnIdName=${taskModel.id}");
  }
  deleteTask(int id)async{
    var db=await initDb();
    db.delete(tableName,where: "$columnIdName=$id");
  }
}
