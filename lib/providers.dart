import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/person.dart';
import 'providers/user.dart';

final List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<User>(
    create: (_) => User(),
  ),
  ChangeNotifierProvider<Persion>(
    create: (_) => Persion(),
  ),
];
