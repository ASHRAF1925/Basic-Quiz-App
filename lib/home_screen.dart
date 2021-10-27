import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category_selection.dart';


var scale = 1.0;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  final myController = TextEditingController();
 String Username="";

  Future<void>set_name(String temp)async{
    Username=temp;
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString("name", Username);
  }
  final Color color1=Colors.purpleAccent;
  final Color color2=Colors.blueAccent;


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Startback.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                "Let's Start the Test!!",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Satisfy",
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Enter Your Name Below!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  onSubmitted: (text){
                    Username=text;
                    set_name(text);

                    print("$Username is setterd");

                  },
                  onChanged: (text)
                  {
                    Username=text;
                    set_name(text);

                    print("$Username is setterd");
                  },
                  controller: myController,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    //fontFamily: "Satisfy",
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent,
                    alignLabelWithHint: true,
                    //filled: true,
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enter Your Name here",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Name",

                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),

          GestureDetector(

            onTap: () {
              print("$Username is found on glowing_button");
              setState(() {

                scale = 1.0;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Category_Selection(Username),
              ));
            },

            child: AnimatedContainer(
              transform: Matrix4.identity()..scale(scale),
              duration: Duration(milliseconds: 200),
              height: 48,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      color1,
                      color2,
                    ],
                  ),
                  boxShadow:  [
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
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  "Lets Play",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                  Icons.play_arrow_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
