import 'package:app_movie_theater/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies; 
  final String title;

  const MovieSlider({Key key,this.movies,this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(this.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(this.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
          SizedBox(height:5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: this.movies.length,
                itemBuilder: (_, int index) => _MoviePoster(this.movies[index])
            )
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 190.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
       children: [
         GestureDetector(
           onTap:() => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(20.0),
             child: FadeInImage(
               placeholder: AssetImage('assets/loading.gif'), 
               image: NetworkImage(this.movie.fullPosterImg),
               width: 130.0,
               height: 190.0,
               fit: BoxFit.cover,
            ),
           ),
         ),
        SizedBox(height: 2),
        Text(this.movie.title, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
       ], 
      ),
    );
  }
}
