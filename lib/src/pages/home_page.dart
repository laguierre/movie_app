import 'package:flutter/material.dart';
import 'package:movie_app/src/provider/peliculas_provider.dart';
import 'package:movie_app/src/widgets/card_swiper_widget.dart';
import 'package:movie_app/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPolulares();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _swiperTarjetas(),
            _footer(context),
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
          } else {
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

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Populares',
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 5.0),
          StreamBuilder(
              stream: peliculasProvider.popularesStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData)
                  return MovieHorizontal(peliculas: snapshot.data, siguientePagina: peliculasProvider.getPolulares, );
                else
                  return Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }
}
