import 'package:app_movie_theater/models/models.dart';
import 'package:app_movie_theater/providers/movies-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class movieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Buscar peliculas";

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  Widget _emplyContainer() {
    return Container(
      child: Center(
        child: Icon(Icons.movie_creation_outlined,
            color: Colors.black38, size: 130.0),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) return _emplyContainer();

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.searchMovie(query),
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if(!snapshot.hasData) return _emplyContainer();
          final movies = snapshot.data;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder:(_, int index)=> _MovieItem(movies[index])
          );

        });
  }
}

class _MovieItem extends StatelessWidget {
  final movie;
  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    movie.heroId ="search-${movie.id}";
    return ListTile(
      leading: Hero(
        tag: movie.heroId,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'), 
          image: NetworkImage(movie.fullPosterImg),
          width: 50.0,
          fit:BoxFit.contain
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (){
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
