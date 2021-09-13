import 'package:flutter/material.dart';
import 'package:movie_app/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  const MovieHorizontal({Key key, @required this.peliculas}) : super(key: key);

  final List<Pelicula> peliculas;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.2,
        child: PageView(
          pageSnapping: false,
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.3,
          ),
          children: _tarjetas(context),
        ));
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
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
    }).toList();
  }
}
