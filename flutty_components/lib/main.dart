import 'package:flutter/material.dart';
import 'package:flutty_components/router/app_routes.dart';
import 'package:flutty_components/screens/screens.dart';
import 'package:flutty_components/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FLUTTER StartUP Project',

        //se trae del AppRoutes la variable con valor de la ruta inicial
        //initialRoute: AppRoutes.initialRoute,
        //se trae todas las rutas de AppRoutes
        //routes: AppRoutes.getAppRoutes(),

        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => Details(),
        },
        //donde redirige si la ruta no existe
        onGenerateRoute: AppRoutes.onGenerateRoute,

        //se trae la config de colores de themes/apptheme
        theme: AppTheme.lightTheme);
  }
}
