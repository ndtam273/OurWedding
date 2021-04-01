import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/user_app.dart';
import 'package:source_code/size_config.dart';

import './components/body.dart';
import './components/app_drawer.dart';

class CountDownScreen extends StatelessWidget {
  static String routeName = "/countdown";

  _initDataUserApp(BuildContext ctx) {
    Provider.of<UserApp>(
      ctx,
      listen: false,
    ).initDataBase();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _initDataUserApp(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ngày chung đôi"),
      ),
      drawer: AppDrawer(),
      body: Body(),
    );
  }
}
