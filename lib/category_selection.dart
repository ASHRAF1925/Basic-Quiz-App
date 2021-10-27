import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/quizpage.dart';

class Category_Selection extends StatefulWidget {
  String username;


  Category_Selection(this.username);

  @override
  _Category_SelectionState createState() => _Category_SelectionState(username);
}

class _Category_SelectionState extends State<Category_Selection> {
  final Color color1 = Colors.purpleAccent;
  final Color color2 = Colors.lightBlueAccent;
  var glowing = true;
  var scale = 1.0;
  String username;

  _Category_SelectionState(this.username);

  List<String> images = [
    "assets/images/logo1.png",
    "assets/images/libaration.jpg",
    "assets/images/national_synbols.png",
    "assets/images/map.jpg",
    "assets/images/tour.jpg",
  ];

  List<String> des = [
    "Every Country has some Basic Infos\nIf You think you know The Basic Infos of Bangladesh \nJust test yourself !!",
    "Bangladesh has a great history  of Liberation. If you think you have known the History...\nJust Test Yourself !!",
    "Like Other Countries Bangladesh also has some Symbols !\n Lets see You Know them or not!!",
    "Bangladesh is not a very big country.The map is so small.But our heart is so big.\n Lets see how big is your heart !!",
    "Lets Visit Some places of Bangladesh \n check your score of Travelling!",
  ];

  Widget customcard(String category, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          print("$username is on Category Selection");
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => quiz_page(category,username),
          ));
        },
        child: AnimatedContainer(
          transform: Matrix4.identity()..scale(scale),
          duration: Duration(milliseconds: 200),
          height: 400,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  color1,
                  color2,
                ],
              ),
              boxShadow: glowing
                  ? [
                      BoxShadow(
                        color: color1.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 16,
                        offset: Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: color2.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 16,
                        offset: Offset(8, 0),
                      ),
                      BoxShadow(
                        color: color1.withOpacity(0.2),
                        spreadRadius: 16,
                        blurRadius: 32,
                        offset: Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: color2.withOpacity(0.2),
                        spreadRadius: 16,
                        blurRadius: 32,
                        offset: Offset(8, 0),
                      )
                    ]
                  : []),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    // changing from 200 to 150 as to look better
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(100.0)),
                      border: new Border.all(
                        color: Colors.greenAccent,
                        width: 4.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: "Quando",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  des,
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white, fontFamily: "Alike"),
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            customcard("Basic Infos", images[0], des[0]),
            customcard("Liberation War", images[1], des[1]),
            customcard("National Symbols", images[2], des[2]),
            customcard("Map Explore", images[3], des[3]),
            customcard("Tourism", images[4], des[4]),
          ],
        ),
      ),
    );
  }
}
