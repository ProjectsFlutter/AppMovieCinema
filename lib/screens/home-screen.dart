import 'package:app_movie_theater/providers/movies-provider.dart';
import 'package:app_movie_theater/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in cinema'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            }
          )
        ],
      ),
       body:SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares!'),
          ],
        ),
       ), 
    );
  }
}