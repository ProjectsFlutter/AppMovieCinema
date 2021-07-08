import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
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
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black38,
          child: Text('movie title', style: TextStyle( fontSize: 20.0)),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://imagenes.t13.cl/images/original/2019/05/1557689182-goku.jpg'),
          fit: BoxFit.cover
        ),
      ) ,
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'), 
              image: NetworkImage('https://64.media.tumblr.com/9ebdb23c9de4344f8c569651c9692886/tumblr_plzvfwduW71y3nf57o1_1280.png'),
              height: 150.0
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Text('Movie Title ', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines:2),
              Text('Movie Original title ', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 20, color: Colors.yellow),
                  SizedBox(width:5),
                  Text('Movie Vote Average', style: textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
