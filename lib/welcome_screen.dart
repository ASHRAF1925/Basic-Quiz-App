import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class welcome_screen extends StatefulWidget {
  const welcome_screen({Key? key}) : super(key: key);

  @override
  _welcome_screenState createState() => _welcome_screenState();
}

class _welcome_screenState extends State<welcome_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wavingflag.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            "Know The Nation\nTest Your Knowledge About the Country !!",
            style: TextStyle(
              fontSize: 50.0,
              color: Colors.white,
              fontFamily: "Satisfy",
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
