# FlutterPrueba

He dedicado demasiado tiempo a pensar la estructura de la aplicación y no he podido usar el json propuesto. 

Habría que crear un Provider que haga un parse desde el json hacia una clase propia.
En el main.dart al arrancar la aplicación se haría una llamada a todos los providers declarados para recopilar datos
Ejemplo:
return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Provider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

Del json se puede pillar toda la info o solamente la deseada y guardar en un objeto al que posteriormente se instancia 
final jsonData = await _getJsonData('urlDelJsonProporcionado');
final infoFromJson = MiClase.fromJson(jsonData);

En la segunda pantalla de detalles solamente me ha dado tiempo a mandarle la url por argumentos para poder imprimirla y mostrar algo de detalles.

He empleado demasiado tiempo en hacer que la pagina sea 'RefreshOnDrag', y también en los metodos de ampliar lista si se acerca el final de los elementos cargados y la animación del loading.
