import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question_class.dart';
import 'package:quiz_app/result_secreen.dart';

class show_correct_ans extends StatefulWidget {
  List<Question> mainlist;
  String Username;
  int score;

  show_correct_ans(this.mainlist, this.Username,this.score);

  @override
  _show_correct_ansState createState() =>
      _show_correct_ansState(mainlist, Username,score);
}

class _show_correct_ansState extends State<show_correct_ans> {
  List<Question> mainlist;
  String Username;
  int score;


  _show_correct_ansState(this.mainlist, this.Username, this.score);

  bool Opa = false;
  bool Opb = false;
  bool Opc = false;
  bool Opd = false;
  late Color opsa;
  late Color opsb;
  late Color opsc;
  late Color opsd;
  int total_score = 0;
  double oph = 150;
  double opw = 350;
  double imgh = 80.0;
  double imgw = 300.0;

  int qid = 0;
  late int total_questions;



  final Color color1 = Colors.green;
  final Color color2 = Colors.red;

  var scale = 1.0;

  @override
  void initState() {
    total_questions = mainlist.length;

    //...................................................

    if (mainlist[qid].answered) {
      if (mainlist[qid].option1 == mainlist[qid].answered_ans) {
        opsa = Colors.redAccent;
        opsb = Colors.blueGrey;
        opsc = Colors.blueGrey;
        opsd = Colors.blueGrey;
      } else if (mainlist[qid].option2 == mainlist[qid].answered_ans) {
        opsb = Colors.redAccent;
        opsc = Colors.blueGrey;
        opsd = Colors.blueGrey;
        opsa = Colors.blueGrey;
      } else if (mainlist[qid].option3 == mainlist[qid].answered_ans) {
        opsc = Colors.redAccent;
        opsb = Colors.blueGrey;
        opsa = Colors.blueGrey;
        opsd = Colors.blueGrey;
      } else if (mainlist[qid].option4 == mainlist[qid].answered_ans) {
        opsd = Colors.redAccent;
        opsb = Colors.blueGrey;
        opsc = Colors.blueGrey;
        opsa = Colors.blueGrey;
      }

      //....
      if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
        opsa = Colors.green;
      } else if (mainlist[qid].option2 == mainlist[qid].correct_ans) {
        opsb = Colors.green;
      } else if (mainlist[qid].option3 == mainlist[qid].correct_ans) {
        opsc = Colors.green;
      } else if (mainlist[qid].option4 == mainlist[qid].correct_ans) {
        opsd = Colors.green;
      }
    } else {
      if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
        opsa = Colors.green;
        opsb = Colors.yellow;
        opsc = Colors.yellow;
        opsd = Colors.yellow;
      } else if (mainlist[qid].option2 == mainlist[qid].correct_ans) {
        opsb = Colors.green;
        opsa = Colors.yellow;
        opsc = Colors.yellow;
        opsd = Colors.yellow;
      } else if (mainlist[qid].option3 == mainlist[qid].correct_ans) {
        opsc = Colors.green;
        opsa = Colors.yellow;
        opsb = Colors.yellow;
        opsd = Colors.yellow;
      } else if (mainlist[qid].option4 == mainlist[qid].correct_ans) {
        opsd = Colors.green;
        opsa = Colors.yellow;
        opsb = Colors.yellow;
        opsc = Colors.yellow;
      }
    }

    super.initState();
  }

  buttons_form() {
    print("Total Questions $total_questions");
    if (qid == 0) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              setState(() {
                qid = qid + 1;

                if (mainlist[qid].answered) {
                  if (mainlist[qid].option1 == mainlist[qid].answered_ans) {
                    opsa = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].answered_ans) {
                    opsb = Colors.redAccent;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].answered_ans) {
                    opsc = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].answered_ans) {
                    opsd = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  }

                  //....
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                  }
                } else {
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                    opsa = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                  }
                }
              });
            },
          ),
        ],
      );
    } else if (qid > 0 && qid < total_questions - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //SizedBox(width: 100,),
          ElevatedButton(
            child: Text("Prev"),
            onPressed: () {
              setState(() {
                qid = qid - 1;
                if (mainlist[qid].answered) {
                  if (mainlist[qid].option1 == mainlist[qid].answered_ans) {
                    opsa = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].answered_ans) {
                    opsb = Colors.redAccent;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].answered_ans) {
                    opsc = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].answered_ans) {
                    opsd = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  }

                  //....
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                  }
                } else {
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                    opsa = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                  }
                }
              });
            },
          ),
          SizedBox(
            width: 100,
          ),

          ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              setState(() {
                qid = qid + 1;

                if (mainlist[qid].answered) {
                  if (mainlist[qid].option1 == mainlist[qid].answered_ans) {
                    opsa = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].answered_ans) {
                    opsb = Colors.redAccent;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].answered_ans) {
                    opsc = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].answered_ans) {
                    opsd = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  }

                  //....
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                  }
                } else {
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                    opsa = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                  }
                }
              });
            },
          ),
        ],
      );
    } else if (qid == (total_questions - 1)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text("Prev"),
            onPressed: () {
              setState(() {
                qid = qid - 1;
                if (mainlist[qid].answered) {
                  if (mainlist[qid].option1 == mainlist[qid].answered_ans) {
                    opsa = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].answered_ans) {
                    opsb = Colors.redAccent;
                    opsc = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].answered_ans) {
                    opsc = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                    opsd = Colors.blueGrey;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].answered_ans) {
                    opsd = Colors.redAccent;
                    opsb = Colors.blueGrey;
                    opsc = Colors.blueGrey;
                    opsa = Colors.blueGrey;
                  }

                  //....
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                  }
                } else {
                  if (mainlist[qid].option1 == mainlist[qid].correct_ans) {
                    opsa = Colors.green;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option2 ==
                      mainlist[qid].correct_ans) {
                    opsb = Colors.green;
                    opsa = Colors.yellow;
                    opsc = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option3 ==
                      mainlist[qid].correct_ans) {
                    opsc = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsd = Colors.yellow;
                  } else if (mainlist[qid].option4 ==
                      mainlist[qid].correct_ans) {
                    opsd = Colors.green;
                    opsa = Colors.yellow;
                    opsb = Colors.yellow;
                    opsc = Colors.yellow;
                  }
                }
              });
            },
          ),
          SizedBox(
            width: 100,
          ),
          ElevatedButton(
            child: Text("End"),
            onPressed: () {
              total_score=score;
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    result_page(mainlist, total_score, Username),
              ));
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Correct Answers"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              // color: Colors.yellow,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pulse.gif"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mainlist.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    qid = index;
                                    if (mainlist[qid].answered) {
                                      if (mainlist[qid].option1 ==
                                          mainlist[qid].answered_ans) {
                                        opsa = Colors.redAccent;
                                        opsb = Colors.blueGrey;
                                        opsc = Colors.blueGrey;
                                        opsd = Colors.blueGrey;
                                      } else if (mainlist[qid].option2 ==
                                          mainlist[qid].answered_ans) {
                                        opsb = Colors.redAccent;
                                        opsc = Colors.blueGrey;
                                        opsd = Colors.blueGrey;
                                        opsa = Colors.blueGrey;
                                      } else if (mainlist[qid].option3 ==
                                          mainlist[qid].answered_ans) {
                                        opsc = Colors.redAccent;
                                        opsb = Colors.blueGrey;
                                        opsa = Colors.blueGrey;
                                        opsd = Colors.blueGrey;
                                      } else if (mainlist[qid].option4 ==
                                          mainlist[qid].answered_ans) {
                                        opsd = Colors.redAccent;
                                        opsb = Colors.blueGrey;
                                        opsc = Colors.blueGrey;
                                        opsa = Colors.blueGrey;
                                      }

                                      //....
                                      if (mainlist[qid].option1 ==
                                          mainlist[qid].correct_ans) {
                                        opsa = Colors.green;
                                      } else if (mainlist[qid].option2 ==
                                          mainlist[qid].correct_ans) {
                                        opsb = Colors.green;
                                      } else if (mainlist[qid].option3 ==
                                          mainlist[qid].correct_ans) {
                                        opsc = Colors.green;
                                      } else if (mainlist[qid].option4 ==
                                          mainlist[qid].correct_ans) {
                                        opsd = Colors.green;
                                      }
                                    } else {
                                      if (mainlist[qid].option1 ==
                                          mainlist[qid].correct_ans) {
                                        opsa = Colors.green;
                                        opsb = Colors.yellow;
                                        opsc = Colors.yellow;
                                        opsd = Colors.yellow;
                                      } else if (mainlist[qid].option2 ==
                                          mainlist[qid].correct_ans) {
                                        opsb = Colors.green;
                                        opsa = Colors.yellow;
                                        opsc = Colors.yellow;
                                        opsd = Colors.yellow;
                                      } else if (mainlist[qid].option3 ==
                                          mainlist[qid].correct_ans) {
                                        opsc = Colors.green;
                                        opsa = Colors.yellow;
                                        opsb = Colors.yellow;
                                        opsd = Colors.yellow;
                                      } else if (mainlist[qid].option4 ==
                                          mainlist[qid].correct_ans) {
                                        opsd = Colors.green;
                                        opsa = Colors.yellow;
                                        opsb = Colors.yellow;
                                        opsc = Colors.yellow;
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor:
                                        mainlist[qid].right_answered && index == qid && mainlist[qid].answered
                                            ? Colors.greenAccent
                                            : !mainlist[qid].right_answered && index == qid && mainlist[qid].answered
                                                ? Colors.redAccent
                                                : Colors.yellowAccent,
                                    child: Text(
                                      (index + 1).toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              height: 560,
              width: double.infinity,
              //color: Colors.red,
              child: ListView(
                children: [
                  AnimatedContainer(
                    transform: Matrix4.identity()..scale(scale),
                    duration: Duration(milliseconds: 200),
                    height: 100,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          colors: [
                            color1,
                            color2,
                          ],
                        ),
                        boxShadow: [
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
                        ]),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            mainlist[qid].question_id.toString() + ".",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            mainlist[qid].question_description,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ////////option1
                  Container(
                    height: oph,
                    width: opw,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(40),
                      color: opsa,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: imgh,
                          width: imgw,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(mainlist[qid].image1),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(width: 3, color: Colors.white),
                          ),
                        ),
                        Text(
                          mainlist[qid].option1,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /////////op2
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: oph,
                    width: opw,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(40),
                      color: opsb,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: imgh,
                          width: imgw,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(mainlist[qid].image2),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(width: 3, color: Colors.white),
                          ),
                        ),
                        Text(
                          mainlist[qid].option2,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /////op3
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: oph,
                    width: opw,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(40),
                      color: opsc,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: imgh,
                          width: imgw,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(mainlist[qid].image3),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(width: 3, color: Colors.white),
                          ),
                        ),
                        Text(
                          mainlist[qid].option3,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ////op4
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: oph,
                    width: opw,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(40),
                      color: opsd,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: imgh,
                          width: imgw,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(mainlist[qid].image4),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(width: 3, color: Colors.white),
                          ),
                        ),
                        Text(
                          mainlist[qid].option4,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  buttons_form(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
