import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:source_code/screens/CameraScreen/camera_screen.dart';
import 'package:source_code/screens/ChangeBackgroundScreen/change_background_screen.dart';
import 'package:source_code/screens/CountDownScreen/count_down_screen.dart';
import 'package:source_code/screens/PreviewScreen/preview_screen.dart';
import 'package:source_code/screens/TestDBTam/test_db_tam.dart';

import 'screens/TestDB/test_db.dart';

final Map<String, WidgetBuilder> routes = {
  CountDownScreen.routeName: (context) => CountDownScreen(),
  ChangeBackgroundScreen.routeName: (context) => ChangeBackgroundScreen(),
  CameraScreen.routeName: (context) => CameraScreen(),
  PreviewScreen.routeName: (context) => PreviewScreen(),
  TestDBScreen.routeName: (context) => TestDBScreen(),
  TestDBTamScreen.routeName: (context) => TestDBTamScreen()
};
