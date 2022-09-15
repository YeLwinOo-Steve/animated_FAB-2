import 'package:flutter/material.dart';

import 'presentation/home.dart';
import 'resource/route_manager.dart';
import 'resource/theme_manager.dart';

void main() => runApp(const Root());

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      home: const Home(),
    );
  }
}
