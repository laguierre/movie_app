import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/peliculas_provider.dart';
import 'package:movie_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
        future: peliculasProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(peliculas: snapshot.data);
          }
          else {
            return Container(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });

    /*
    peliculasProvider.getEnCines();
    return CardSwiper(peliculas: [1,2,3,4,5]);*/
  }
}
