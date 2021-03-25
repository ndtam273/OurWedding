import 'package:flutter/material.dart';
import 'package:source_code/database/database_helper.dart';
import 'package:source_code/screens/CountDownScreen/components/app_drawer.dart';

class TestDBScreen extends StatelessWidget {
  static String routeName = "/test";

  // reference to our single class that manages the database
  final dbHelper = DataBaseHelper.instance;
// Button onPressed methods

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DataBaseHelper.columnNameMan: 'columnNameMan',
      DataBaseHelper.columnAvatarMan: 'columnAvatarMan',
      DataBaseHelper.columnNameWoman: 'columnNameWoman',
      DataBaseHelper.columnAvatarWoman: 'columnAvatarWoman',
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DataBaseHelper.columnId: 1,
      DataBaseHelper.columnNameMan: 'columnNameMan 1',
      DataBaseHelper.columnAvatarMan: 'columnAvatarMan 1',
      DataBaseHelper.columnNameWoman: 'columnNameWoman 1',
      DataBaseHelper.columnAvatarWoman: 'columnAvatarWoman 1',
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'insert',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _insert();
              },
            ),
            RaisedButton(
              child: Text(
                'query',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _query();
              },
            ),
            RaisedButton(
              child: Text(
                'update',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _update();
              },
            ),
            RaisedButton(
              child: Text(
                'delete',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
