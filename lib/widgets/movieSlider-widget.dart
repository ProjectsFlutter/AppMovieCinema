import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Populares',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height:5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, int index) => _MoviePoster()
            )
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
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
               image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/61VnhWzz0WL._AC_.jpg'),
               width: 130.0,
               height: 190.0,
               fit: BoxFit.cover,
            ),
           ),
         ),
        SizedBox(height: 2),
        Text('Lorem lo rem lorem rem lo', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
       ], 
      ),
    );
  }
}
