import 'package:flutter/material.dart';
import 'package:source_code/database/db_helper.dart';
import 'package:source_code/screens/CountDownScreen/components/app_drawer.dart';

class TestDBTamScreen extends StatelessWidget {
  static String routeName = "/test_db_tam";

  // reference to our single class that manages the database
  final dbHelper = DBHelper.database();
// Button onPressed methods

  void _insert() async {
    // row to insert
    
    print('inserted row id: ');
  }

  void _query() async {}

  void _update() async {
    // row to update
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
  }

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test DB TAM'),
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
