import 'package:flutter/material.dart';
import 'package:calculator_app/body.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      //TODO Theme Data
      // theme: new ThemeData(
      //   brightness: Brightness.dark,
      // ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow.shade700,
          title: Text(
            'Calculator',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}
