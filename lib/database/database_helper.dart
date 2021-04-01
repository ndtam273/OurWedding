import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static final _databaseName = "MyDataBase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnId = '_id';

  static final columnNameMan = 'name_man';
  static final columnAvatarMan = 'avatar_man';
  static final columnNameWoman = 'name_woman';
  static final columnAvatarWoman = 'avatar_woman';
  static final columnWeddingDay = 'wedding_day';

  // make this a singleton class
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnNameMan TEXT,
            $columnAvatarMan TEXT,
            $columnNameWoman TEXT,
            $columnAvatarWoman TEXT,
            $columnWeddingDay INTEGER
          )
          ''');
  }

  // Helper methods
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<Map<String, dynamic>> queryFirstRows() async {
    List<Map<String, Object>> records = await queryAllRows();
    return records.first;
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $table'),
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
