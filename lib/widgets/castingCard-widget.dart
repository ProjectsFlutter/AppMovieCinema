import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      width: double.infinity,
      height: 180.0,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, int index) =>_CastCard(),
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 10.0),
      width: 110.0,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'), 
              image: NetworkImage('https://i.pinimg.com/originals/c0/69/dc/c069dc250304c1d526965fb39e6089d6.jpg'),
              height: 140.0,
              width:  100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.0),
          Text('Cast name, first , secound', 
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis, 
          maxLines:2
          )
        ],
      ),
    );
  }
}