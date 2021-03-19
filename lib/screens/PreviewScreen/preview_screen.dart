import 'package:flutter/material.dart';

import '../../size_config.dart';
import './components/body.dart';

class PreviewScreen extends StatelessWidget {
  static String routeName = "/preview_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Screen"),
      ),
      body: Body(),
    );
  }
}
