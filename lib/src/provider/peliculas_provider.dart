import 'dart:convert';

import 'package:movie_app/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';//'0d3ef5f052d5ec394f414b4bac7d1906';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.http(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return await peliculas.items;
  }
}
