import 'package:app_movie_theater/models/models.dart';
import 'package:app_movie_theater/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              CastingCard(movie.id)
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 5.0, right: 5.0),
          color: Colors.black38,
          child: Text(movie.title, style: TextStyle( fontSize: 16.0), textAlign: TextAlign.center)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover
        ),
      ) ,
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
  final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage(movie.fullPosterImg),
                height: 150.0,
                width: 120.0,
              ),
            ),
          ),
          SizedBox(width: 5.0),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200.0),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines:2),
                Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 20, color: Colors.yellow),
                    SizedBox(width:5),
                    Text(movie.voteAverage.toString(), style: textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1
      ),
    );
  }
}