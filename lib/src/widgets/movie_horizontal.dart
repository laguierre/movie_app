import 'package:flutter/material.dart';
import 'package:movie_app/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  MovieHorizontal(
      {Key key, @required this.peliculas, @required this.siguientePagina})
      : super(key: key);

  final List<Pelicula> peliculas;
  final Function siguientePagina;
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });
    return Container(
        height: size.height * 0.2,
        child: PageView.builder(
          itemCount: peliculas.length,
          pageSnapping: false,
          controller: _pageController,
          //children: _tarjetas(context),
          itemBuilder: (context, i) => _tarjeta(context, peliculas[i]),
        ));
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                height: 160,
                fit: BoxFit.cover,
                placeholder: AssetImage('lib/assets/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg())),
          ),
          SizedBox(height: 5.0),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {}).toList();
  }
}
