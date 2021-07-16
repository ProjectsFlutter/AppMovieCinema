import 'package:app_movie_theater/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '6bbd742ad8dde52daa43858057ffee11';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider init');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _languaje, 
      'page': '1'
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',{
      'api_key': _apiKey, 
      'language': _languaje, 
      'page': '1'
    });
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies,...popularResponse.results];
    notifyListeners();
  }
}
