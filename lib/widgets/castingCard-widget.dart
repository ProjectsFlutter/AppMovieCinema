import 'package:app_movie_theater/models/models.dart';
import 'package:app_movie_theater/providers/movies-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int movieId;
  const CastingCard(this.movieId);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        
        if(!snapshot.hasData){
          return Container(
            constraints: BoxConstraints(maxWidth: 150.0),
            height: 180.0,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<Cast> cast = snapshot.data!;
        
        return Container(
          margin: EdgeInsets.only(bottom: 30.0),
          width: double.infinity,
          height: 180.0,
          // color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (_, int index) => _CastCard(cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: 110.0,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(actor.fullProfilePath),
              height: 140.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.0),
          Text(actor.name,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2)
        ],
      ),
    );
  }
}
