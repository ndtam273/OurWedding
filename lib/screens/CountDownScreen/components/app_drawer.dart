import 'package:flutter/material.dart';
import 'package:source_code/screens/ChangeBackgroundScreen/change_background_screen.dart';

import '../count_down_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Our Wedding'),
            automaticallyImplyLeading: true,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(CountDownScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.picture_in_picture),
            title: Text('Change background'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ChangeBackgroundScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
