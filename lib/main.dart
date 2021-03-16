import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/user.dart';
import 'package:source_code/routes.dart';
import 'screens/ChangeBackgroundScreen/change_background_screen.dart';
import 'screens/CountDownScreen/count_down_screen.dart';
import 'package:source_code/theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: User(),
      child: MaterialApp(
          title: 'Our Wedding',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          initialRoute: CountDownScreen.routeName,
          routes: routes),
    );
  }
}
