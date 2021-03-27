import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'MyDatabase.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_events(id TEXT PRIMARY KEY, woman_name TEXT, woman_avt TEXT, man_name TEXT, man_avt TEXT, date TEXT, background TEXT)');
    }, version: 1);
  }

  static Future<String> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return data['id'];
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<int> update(Map<String, dynamic> row, String table) async {
    final db = await DBHelper.database();
    print('row here .... $row');
    String id = row['id'];
    print('id here....$id');
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  // static final _databaseName = "MyDataBase.db";
  // static final _databaseVersion = 1;

  // static final table = 'my_table';

  // static final columnId = '_id';

  // static final columnNameMan = 'name_man';
  // static final columnAvatarMan = 'avatar_man';
  // static final columnNameWoman = 'name_woman';
  // static final columnAvatarWoman = 'avatar_woman';
  // static final columnBackground = 'background';
  // static final columnWeddingDate = "weddingDate";

  // // make this a singleton class
  // DataBaseHelper._privateConstructor();
  // static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  // // only have a single app-wide reference to the database
  // static Database _database;
  // Future<Database> get database async {
  //   if (_database != null) return _database;
  //   // lazily instantiate the db the first time it is accessed
  //   _database = await _initDatabase();
  //   print('init database');
  //   return _database;
  // }

  // // this opens the database (and creates it if it doesn't exist)
  // _initDatabase() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, _databaseName);
  //   return await openDatabase(
  //     path,
  //     version: _databaseVersion,
  //     onCreate: _onCreate,
  //   );
  // }

  // // SQL code to create the database table
  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //         CREATE TABLE $table (
  //           $columnId INTEGER PRIMARY KEY,
  //           $columnNameMan TEXT,
  //           $columnAvatarMan TEXT,
  //           $columnNameWoman TEXT,
  //           $columnAvatarWoman TEXT,
  //           $columnBackground TEXT,
  //           $columnWeddingDate DATETIME

  //         )
  //         ''');
  // }

  // // Helper methods

  // // Inserts a row in the database where each key in the Map is a column name
  // // and the value is the column value. The return value is the id of the
  // // inserted row.
  // Future<int> insert(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   return await db.insert(table, row);
  // }

  // // All of the rows are returned as a list of maps, where each map is
  // // a key-value list of columns.
  // Future<List<Map<String, dynamic>>> queryAllRows() async {
  //   Database db = await instance.database;
  //   return await db.query(table);
  // }

  // // All of the methods (insert, query, update, delete) can also be done using
  // // raw SQL commands. This method uses a raw query to give the row count.
  // Future<int> queryRowCount() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db.rawQuery('SELECT COUNT(*) FROM $table'));
  // }

  // // We are assuming here that the id column in the map is set. The other
  // // column values will be used to update the row.
  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // // Deletes the row specified by the id. The number of affected rows is
  // // returned. This should be 1 as long as the row exists.
  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }
}
