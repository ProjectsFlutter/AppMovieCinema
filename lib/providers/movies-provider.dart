import 'package:app_movie_theater/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '6bbd742ad8dde52daa43858057ffee11';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularPage = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int,List<Cast>> movieCast = {};

  MoviesProvider() {
    print('MoviesProvider init');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    final url = Uri.https(_baseUrl, endpoint,{
      'api_key': _apiKey,
      'language': _languaje, 
      'page': '$page'
    });
    final response = await http.get(url);
    return response.body;
  } 

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage ++;

    final jsonData = await this._getJsonData('3/movie/popular',_popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies,...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async{
     if(movieCast.containsKey(movieId)) return movieCast[movieId]!;

     final jsonData = await this._getJsonData('3/movie/$movieId/credits');
     final creditsResponse = CreditsResponse.fromJson(jsonData);
     movieCast[movieId] = creditsResponse.cast;
     return movieCast[movieId]!;
  }
  
  Future<List<Movie>> searchMovie(String _query) async{
    final url = Uri.https(_baseUrl, '3/search/movie',{
      'api_key': _apiKey,
      'language': _languaje, 
      'query': _query
    });
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    
    return searchResponse.results;
  }
}
  