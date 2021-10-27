import 'package:flutter/material.dart';
import 'package:quiz_app/category_selection.dart';
import 'package:quiz_app/question_class.dart';
import 'package:quiz_app/show_answers.dart';


class result_page extends StatefulWidget {
  List<Question> mainlist;
  int score;
  String username;


  result_page(this.mainlist, this.score, this.username);

  @override
  _result_pageState createState() => _result_pageState(mainlist, score,username);
}

class _result_pageState extends State<result_page> {
  List<Question> mainlist;
  int score;
  late int total_mark;

  var scale = 1.0;
  final Color color1 = Colors.green;
  final Color color2 = Colors.red;
   String Username;


  _result_pageState(this.mainlist, this.score, this.Username);
  @override
  void initState() {
    total_mark=mainlist.length*10;
    // TODO: implement initState
    super.initState();
  }

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score Bar"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/result.gif"),
          fit: BoxFit.fill,
        )),
        child: Column(children: [

          SizedBox(
            height: 250,
          ),
          Text("Hey $Username !!",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
            ),
          ),
          Text("Your Score is $score /$total_mark",
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 40,
          ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {

                scale = 1.0;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>Category_Selection(Username),
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
                  boxShadow:
                      [
                    BoxShadow(
                      color: color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color:color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color:color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color:color2.withOpacity(0.2),
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
                   "Try Again!",
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

          SizedBox(
            height: 20,
          ),



          GestureDetector(
            onTap: () {
              setState(() {

                scale = 1.0;
              });
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>show_correct_ans(mainlist,Username,score),
              ));
            },


            child: AnimatedContainer(
              transform: Matrix4.identity()..scale(scale),
              duration: Duration(milliseconds: 200),
              height: 48,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                    Colors.yellow,
                      Colors.blueAccent,

                    ],
                  ),
                  boxShadow:
                  [
                    BoxShadow(
                      color: color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color:color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color:color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color:color2.withOpacity(0.2),
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
                    "Show The Answers ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                      IconData(0xe156, fontFamily: 'MaterialIcons'),
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
