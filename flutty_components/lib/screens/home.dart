import 'package:flutter/material.dart';
import 'package:flutty_components/router/app_routes.dart';
import 'package:flutty_components/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
        backgroundColor: const Color.fromARGB(124, 70, 49, 73),
        appBar: AppBar(
          title: const Text('Componentes Listados'),
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) => ListTile(
                  leading: Icon(
                    menuOptions[i].icon,
                    color: AppTheme.primary,
                  ),
                  title: Text(menuOptions[i].name),
                  textColor: Colors.white,
                  tileColor: const Color.fromARGB(123, 59, 70, 107),
                  onTap: () {
                    //hard way
                    //   final route = MaterialPageRoute(
                    //      builder: (context) => const ListView1() );
                    //    Navigator.push(context, route);

                    //easy way
                    Navigator.pushNamed(context, menuOptions[i].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
