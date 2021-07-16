import 'package:app_movie_theater/providers/movies-provider.dart';
import 'package:app_movie_theater/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0) ,
        child: AppBar(
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
      ),
       body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 6.0,),
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            SizedBox(height: 4.0,),
            MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares!'),
          ],
        ),
       ), 
    );
  }
}