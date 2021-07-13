import 'package:flutter/widgets.dart';

class MoviesProvider extends ChangeNotifier{
  MoviesProvider(){
    print('MoviesProvider init');
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies(){
    print('getOnDisplayMovies');
  }
}