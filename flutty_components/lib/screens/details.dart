import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtén los argumentos de la ruta actual
    final String url = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: const Text('Detalles'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text('Info'),
            ),
          )
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 120,
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }
}
