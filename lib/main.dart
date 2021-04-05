import 'package:covid_app/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid BR app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: ('Google'),
      ),
      home: HomeScreen(),
    );
  }
}
