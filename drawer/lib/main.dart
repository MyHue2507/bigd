import 'package:flutter/material.dart';
import 'mainpage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Demo" ,
      home: MainPage(),
    );
  }
}