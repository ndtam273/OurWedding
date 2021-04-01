import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/user_app.dart';
import 'package:source_code/screens/CountDownScreen/count_down_screen.dart';

class BackgroundItem extends StatelessWidget {
  final File bgFile;

  BackgroundItem(
    this.bgFile,
  );

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Provider.of<UserApp>(
          context,
          listen: false,
        ).updateBackgroundSelected(bgFile.path);
        Navigator.of(context).pushReplacementNamed(CountDownScreen.routeName);
      },
      child: Image.file(bgFile),
    );
  }
}
