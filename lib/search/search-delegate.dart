import 'package:flutter/material.dart';

class movieSearchDelegate extends SearchDelegate{
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => "Buscar peliculas";

  @override
  List<Widget> buildActions(BuildContext context) {
      // TODO: implement buildActions
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: ()=> query='',
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // TODO: implement buildLeading
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context,null);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size:130.0),
        ),
      );
    }
    return Container();
  }

}