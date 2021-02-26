import 'package:flutter/material.dart';
import 'package:source_code/screens/CountDownScreen/components/app_drawer.dart';

import '../../size_config.dart';
import 'components/body.dart';

class ChangeBackgroundScreen extends StatelessWidget {
  static String routeName = "/changebackground";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Đổi ảnh nền"),
      ),
      body: Body(),
      drawer: AppDrawer(),
    );
  }
}
