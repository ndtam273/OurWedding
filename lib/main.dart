import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:source_code/routes.dart';
import 'package:source_code/screens/CountDownScreen/count_down_screen.dart';
import 'package:source_code/theme.dart';

import 'screens/CountDownScreen/providers/person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Persion(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: CountDownScreen.routeName,
        routes: routes,
      ),
    );
  }
}
