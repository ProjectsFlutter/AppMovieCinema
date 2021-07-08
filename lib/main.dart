import 'package:flutter/material.dart';
import 'screens/screens.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Theater',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details':(_) => DetailScreen() 
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
        )
      ),
    );
  }
}