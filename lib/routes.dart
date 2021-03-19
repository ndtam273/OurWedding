import 'package:flutter/material.dart';
import 'package:source_code/screens/CameraScreen/camera_screen.dart';
import 'package:source_code/screens/ChangeBackgroundScreen/change_background_screen.dart';
import 'package:source_code/screens/CountDownScreen/count_down_screen.dart';
import 'package:source_code/screens/PreviewScreen/preview_screen.dart';

final Map<String, WidgetBuilder> routes = {
  CountDownScreen.routeName: (context) => CountDownScreen(),
  ChangeBackgroundScreen.routeName: (context) => ChangeBackgroundScreen(),
  CameraScreen.routeName: (context) => CameraScreen(),
  PreviewScreen.routeName: (context) => PreviewScreen(),
};
