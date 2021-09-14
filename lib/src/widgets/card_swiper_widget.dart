import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({@required this.peliculas});

  final List<Pelicula> peliculas;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.65,
        itemHeight: size.height * 0.48,
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int index) {
          peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
          return Hero(
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detalle',
                    arguments: peliculas[index]),
                child: FadeInImage(
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  placeholder: AssetImage('lib/assets/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },

        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
