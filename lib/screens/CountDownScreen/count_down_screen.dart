import 'package:flutter/material.dart';
import 'package:source_code/size_config.dart';

import 'components/body.dart';

class CountDownScreen extends StatelessWidget {
  static String routeName = "/countdown";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ngày chung đôi"),
      ),
      body: Body(),
    );
  }
}
