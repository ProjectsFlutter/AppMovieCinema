import 'package:app_movie_theater/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies; 
  final String title;
  final Function onNextPage; 
  const MovieSlider({Key key,this.movies,this.title, this.onNextPage}): super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
        if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
          widget.onNextPage();
        }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(this.widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(this.widget.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
          SizedBox(height:5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: this.widget.movies.length,
                itemBuilder: (_, int index) => _MoviePoster(this.widget.movies[index])
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
