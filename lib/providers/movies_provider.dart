import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  // https://api.themoviedb.org/3/movie/now_playing?api_key=9e00a19f7438604c00242f630a4df6ce&language=en-US&page=1

  final String _apiKey = '9e00a19f7438604c00242f630a4df6ce';
  final String _baseUrl = 'api.themoviedb.org';
  final String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  // Future es por tipado para saber que el resultado de la funcion es asincrono
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _languaje, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    // var url = Uri.https(_baseUrl, '3/movie/now_playing',
    //     {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    // final response = await http.get(url);
    final response = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    // var url = Uri.https(_baseUrl, '3/movie/popular',
    //     {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    // final response = await http.get(url);
    _popularPage++;
    final response = await _getJsonData('3/movie/now_playing', _popularPage);
    final popularResponse = PopularResponse.fromJson(response);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
