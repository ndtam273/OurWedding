import 'package:provider/provider.dart';

import 'providers/user_app.dart';

final List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<UserApp>(
    create: (_) => UserApp(),
  ),
];
