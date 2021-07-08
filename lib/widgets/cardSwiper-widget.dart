import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height:  size.height * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap:() => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
          child: Swiper(
           itemCount: 10,
           layout: SwiperLayout.STACK,
           itemHeight: size.height * 0.4,
           itemWidth:  size.width * 0.6,
           itemBuilder: ( _ , int index){
             return FadeInImage(
               placeholder: AssetImage('assets/loading.gif'), 
               image: NetworkImage('https://i.pinimg.com/564x/11/83/47/1183474b107fe7c20fbd10011efbb179.jpg'),
               fit: BoxFit.cover,
            );
           }, 
          ),
        ),
      ),
    );
  }
}