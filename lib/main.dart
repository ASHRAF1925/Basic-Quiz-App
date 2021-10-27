import 'package:flutter/material.dart';
import 'package:quiz_app/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Know Your Country",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: welcome_screen(),
    );
  }
}
