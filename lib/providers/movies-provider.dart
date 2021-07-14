import 'dart:convert';

import 'package:app_movie_theater/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  String _apiKey    ='6bbd742ad8dde52daa43858057ffee11';
  String _baseUrl   ='api.themoviedb.org';
  String _languaje  ='es-ES';

  MoviesProvider(){
    print('MoviesProvider init');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async{
     var url = Uri.https(_baseUrl, '3/movie/now_playing', {
       'api_key'  : _apiKey,
       'language' : _languaje,
       'page'     : '1'
     });
     final response = await http.get(url);
     final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
     print( nowPlayingResponse.results[1].title);
  }
}