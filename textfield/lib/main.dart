import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Demo",
      home: LoginPage(),
    );
  }
}