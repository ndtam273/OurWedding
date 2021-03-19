import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/user_app.dart';
import 'package:source_code/screens/CountDownScreen/count_down_screen.dart';

import '../../enums.dart';
import '../../size_config.dart';

class PreviewScreen extends StatelessWidget {
  static String routeName = "/preview_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final imagePath = arguments['imagePath'];
    final sex = arguments['sex'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Screen"),
      ),
      body: Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          // Save Provider
          if (sex == Sex.Man) {
            Provider.of<UserApp>(
              context,
              listen: false,
            ).updateAvatarMan(imagePath);
          } else {
            Provider.of<UserApp>(
              context,
              listen: false,
            ).updateAvatarWoman(imagePath);
          }
          // Back to ...
          Navigator.popUntil(
            context,
            ModalRoute.withName(CountDownScreen.routeName),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
