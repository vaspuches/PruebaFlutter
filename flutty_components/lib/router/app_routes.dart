import 'package:flutter/material.dart';

import 'package:flutty_components/models/models.dart';
import 'package:flutty_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview_builder_screen',
        name: 'Infinit Scroll & pull to refresh',
        screen: const ListviewBuilderScreen(),
        icon: Icons.build_circle_rounded),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    //por cada ruta devuelve un objeto de este tipo en appRoutes
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  //alternativas a rutas
  // static Map<String, Widget Function(BuildContext)> routes = {
  // 'home': (BuildContext context) => const HomeScreen(),
  //  'home2': (BuildContext context) => const Home2(),
  //  'alert_screen': (BuildContext context) => const AlertScreen()
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => const ListviewBuilderScreen());
  }
}
