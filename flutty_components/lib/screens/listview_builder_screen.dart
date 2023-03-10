import 'package:flutter/material.dart';
import 'package:flutty_components/themes/app_theme.dart';

class ListviewBuilderScreen extends StatefulWidget {
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  String imageUrl = '';

  @override
  void initState() {
    super.initState();

    //calcula las posiciones
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    add5();
    isLoading = false;

    setState(() {});

    //despues de actualizar los sigueintes 5 mueve la pantalla un poco hacia abajo
    //para dejar entreveer que se ha cargado mas al usuario
    //solo si estas cerca del final que haga la animacion
    if ((scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

//metodo para añadir 5 unidades mas a la lista mientras te acercas al final del scroll
  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => (lastId + e)));

    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));

    //te guardas el ultimo id y creas 5 registros nuevos
    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      //sin appBar y asi las fotos ocupan 100% de la pantalla
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'details',
                          arguments:
                              'https://picsum.photos/500/300?image=${imagesIds[index]}');
                    },
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/img/loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesIds[index]}'),
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            if (isLoading)
              Positioned(
                bottom: 20,
                //se muestra centrado basandose en el tamaño de la pantalla
                left: size.width * 0.5 - 30,
                child: const _LoadinIcon(),
              ),
          ],
        ),
      ),
    );
  }
}

class _LoadinIcon extends StatelessWidget {
  const _LoadinIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
