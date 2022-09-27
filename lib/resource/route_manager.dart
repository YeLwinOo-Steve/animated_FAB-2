import 'package:flutter/material.dart';

import '../presentation/about_2d.dart';
import '../presentation/about_app.dart';
import '../presentation/ch_plus_key.dart';
import '../presentation/home.dart';
import '../presentation/htoe_kwat.dart';
import '../presentation/lone_pine.dart';
import '../presentation/mwal_kwat.dart';
import '../presentation/one_change.dart';
import '../presentation/ta_kwat_kaung.dart';

class AppRoutes {
  static const splash = '/splash';
  static const home = '/home';
  static const taKwatKaung = '/takwatkaung';
  static const lonePine = '/lonepine';
  static const oneChange = '/onechange';
  static const mwalKwat = '/mwalkwat';
  static const chPlusKey = '/chpluskey';
  static const htoeKwat = '/htoekwat';
  static const about2D = '/about2D';
  static const aboutApp = '/aboutApp';
}

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => Home());
      case AppRoutes.taKwatKaung:
        return MaterialPageRoute(builder: (context) => TaKwatKaung());
      case AppRoutes.lonePine:
        return MaterialPageRoute(builder: (context) => LonePine());
      case AppRoutes.oneChange:
        return MaterialPageRoute(builder: (context) => OneChange());
      case AppRoutes.mwalKwat:
        return MaterialPageRoute(builder: (context) => MwalKwat());
      case AppRoutes.chPlusKey:
        return MaterialPageRoute(builder: (context) => ChPlusKey());
      case AppRoutes.htoeKwat:
        return MaterialPageRoute(builder: (context) => HtoeKwat());
      case AppRoutes.about2D:
        return MaterialPageRoute(builder: (context) => About2D());
      case AppRoutes.aboutApp:
        return MaterialPageRoute(builder: (context) => AboutApp());
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
