import 'package:flutter/material.dart';
import 'package:source_code/database/db_helper.dart';
import 'package:source_code/model/event.dart';
import 'package:source_code/screens/CountDownScreen/components/app_drawer.dart';

class TestDBTamScreen extends StatelessWidget {
  static String routeName = "/test_db_tam";
  final dbHelper = DBHelper.database();
  // reference to our single class that manages the database
// Button onPressed methods

  void _insert() async {
    // row to insert
    final newEvent = Event(id: DateTime.now().toString());
    Map<String, dynamic> row = {
      'id': newEvent.id,
      'woman_name': newEvent.womanName,
      'woman_avt': newEvent.womanAvatar,
      'man_name': newEvent.manName,
      'man_avt': newEvent.manAvatar,
      'date': DateTime.now().toString(),
      'background': newEvent.background
    };

    final id = DBHelper.insert('user_events', row);
    print(await id);
  }

  void _query() async {
    final data = DBHelper.getData('user_events');
    print(await data);
  }

  void _update() async {
    Map<String, dynamic> row = {
      'id': '2021-03-27 13:55:11.052130',
      'woman_name': 'ly',
      'woman_avt': '',
      'man_name': 'tam',
      'man_avt': '',
      'date': DateTime.now().toString(),
      'background': ''
    };
    print(row['id']);
    DBHelper.update(row, 'user_events');
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
