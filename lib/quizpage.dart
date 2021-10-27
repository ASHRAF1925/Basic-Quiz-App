import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question_class.dart';
import 'package:quiz_app/result_secreen.dart';
import 'package:audioplayers/audioplayers.dart';


class quiz_page extends StatefulWidget {
  String Category_type;
  String Username;


  quiz_page(this.Category_type, this.Username);

  @override
  _quiz_pageState createState() => _quiz_pageState(Category_type,Username);
}

class _quiz_pageState extends State<quiz_page> {
  String Category_type;
  String Username;

  _quiz_pageState(this.Category_type, this.Username);

  bool Opa=false;
 bool Opb=false;
 bool Opc=false;
 bool Opd=false;
 Color opsa=Colors.blueGrey;
  Color opsb=Colors.blueGrey;
  Color opsc=Colors.blueGrey;
  Color opsd=Colors.blueGrey;
 int total_score=0;
  double oph=150;
  double opw=350;
  double imgh=80.0;
  double imgw=300.0;

  late Question temp;
  int qid=0;
  late int total_questions;

//  Question(question_id, question_description, option1, option2, option3, option4, image1, image2, image3, image4, correct_ans, answered_ans, answered, right_answered, not_touched)

  List <Question> Basic_infos = [
    Question(
        1,
        "Which one is the flag of Bangladesh ?",
        "The Red & Green",
        "The Red & White",
        "The Red, Blue, and Black on a White background. ",
        "The blue field with a prominent, off-centre golden disk",
        "assets/question_images/bd.gif",
        "assets/question_images/japan.gif",
        "assets/question_images/korea.gif",
        "assets/question_images/palao.gif",
        "The Red & Green",
        "not_answered",
        false,
        false,
        true),
    Question(
        2,
        "Which one is the Map of Bangladesh ?",
        "option1",
        "option2",
        "option3",
        "option4",
        "assets/question_images/bht.jpg",
        "assets/question_images/ind.jpg",
        "assets/question_images/bd_map.jpg",
        "assets/question_images/myanmar_map.jpg",
        "option3",
        "not_answered",
        false,
        false,
        true),
    Question(
        3,
        "Which one is the flag of Bangladesh ?",
        "The Red & Green",
        "The Red & White",
        "The Red, Blue, and Black on a White background. ",
        "The blue field with a prominent, off-centre golden disk",
        "assets/question_images/bd.gif",
        "assets/question_images/japan.gif",
        "assets/question_images/korea.gif",
        "assets/question_images/palao.gif",
        "The Red & Green",
        "not_answered",
        false,
        false,
        true),
    Question(
        4,
        "Which one is the Map of Bangladesh ?",
        "option1",
        "option2",
        "option3",
        "option4",
        "assets/question_images/bht.jpg",
        "assets/question_images/ind.jpg",
        "assets/question_images/bd_map.jpg",
        "assets/question_images/myanmar_map.jpg",
        "option3",
        "not_answered",
        false,
        false,
        true),
  ];
  late List <Question> Liberation_war;
  late List <Question> National_Symbols;
  late List <Question> Map_Explore;
  late List <Question> Tourism;
  late List <Question> mainlist;
  final Color color1 = Colors.green;
  final Color color2 = Colors.red;
  var glowing = true;
  var scale = 1.0;
  int second=60;
  int miniutes=2;
  late Timer timer;
  late Timer counter;
  int count=120;

  @override
  void initState() {
    timer_clock();
    start_counter();
    if(Category_type=="Basic Infos")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;




    }
    else if(Category_type=="Liberation War")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;
      /*return Text(
            "Answer the Questions of + $Category_type"

        );*/

    }
    else if(Category_type=="National Symbols")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;
      /* return Text(
          "Answer the Questions of + $Category_type"

      );*/

    }
    else if(Category_type=="Map Explore")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;
      /*return Text(
            "Answer the Questions of + $Category_type"

        );*/

    }
    else if(Category_type=="Tourism")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;

    }

    super.initState();
  }

  start_counter()
  {
    counter=Timer.periodic(Duration(seconds: 1), (_) {
      count--;
      print(count);
      if(count==0)
        {
          score_calculate();


          counter.cancel();
          playaudio();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => result_page(mainlist,total_score,Username),
          ));

        }

    });
  }
  timer_clock()
  {
      if(second==59)
        {
          miniutes=miniutes-1;
        }
    timer=Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {

        second--;
        if(second<0)
        {
          second=59;
        }
        if(second==59)
        {
          miniutes=miniutes-1;
          if(miniutes<0)
          {
            miniutes=0;
          }
        }


      });

    });
    return SizedBox(
      width: 10,
    );
  }

 Condition_Check()
  {
    if(Category_type=="Basic Infos")
      {
        mainlist=Basic_infos;
        total_questions=mainlist.length;

        /*return Text(
          "Answer the Questions of $Category_type"

        );*/
        return SizedBox(
          height: 10,
        );

      }
    else if(Category_type=="Liberation War")
      {
        mainlist=Basic_infos;
        total_questions=mainlist.length;
        /*return Text(
            "Answer the Questions of + $Category_type"

        );*/
        return SizedBox(
          height: 10,
        );
      }
    else if(Category_type=="National Symbols")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;
     /* return Text(
          "Answer the Questions of + $Category_type"

      );*/
      return SizedBox(
        height: 10,
      );
    }
    else if(Category_type=="Map Explore")
      {
        mainlist=Basic_infos;
        total_questions=mainlist.length;
        /*return Text(
            "Answer the Questions of + $Category_type"

        );*/
        return SizedBox(
          height: 10,
        );
      }
    else if(Category_type=="Tourism")
    {
      mainlist=Basic_infos;
      total_questions=mainlist.length;
      return SizedBox(
        height: 10,
      );
    }
  }
 score_calculate()
 { total_score=0;
   for(int i=0;i<total_questions;i++)
   {
     if(mainlist[i].right_answered)
     {
       total_score=total_score+10;
     }
   }

 }
 void playaudio()async {
   AudioPlayer audioPlayer = AudioPlayer();
   int results = await audioPlayer.play("assets/Wrong Answer.mp3", isLocal: true);
 }

 buttons_form()
  { print("Total Questions $total_questions");
    if(qid==0)
      {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(

              child: Text("Next"),
              onPressed: (){
                setState(() {
                  qid=qid+1;
                  if(mainlist[qid].answered)
                  {
                    if(mainlist[qid].answered_ans==mainlist[qid].option1)
                    {
                      opsa=Colors.greenAccent;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                      opsd=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option2)
                    {
                      opsb=Colors.greenAccent;
                      opsc=Colors.blueGrey;
                      opsd=Colors.blueGrey;
                      opsa=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option3)
                    {
                      opsc=Colors.greenAccent;
                      opsd=Colors.blueGrey;
                      opsa=Colors.blueGrey;
                      opsb=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option4)
                    {
                      opsd=Colors.greenAccent;
                      opsa=Colors.blueGrey;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                    }
                  }
                  else{
                    opsd=Colors.blueGrey;
                    opsa=Colors.blueGrey;
                    opsb=Colors.blueGrey;
                    opsc=Colors.blueGrey;
                  }

                });
              },
            ),

          ],


        );
      }
    else  if(qid>0&&qid<total_questions-1)
      {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //SizedBox(width: 100,),
            ElevatedButton(
              child: Text("Prev"),
              onPressed: (){
                setState(() {
                  qid=qid-1;
                  if(mainlist[qid].answered)
                  {
                    if(mainlist[qid].answered_ans==mainlist[qid].option1)
                    {
                      opsa=Colors.greenAccent;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                      opsd=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option2)
                    {
                      opsb=Colors.greenAccent;
                      opsc=Colors.blueGrey;
                      opsd=Colors.blueGrey;
                      opsa=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option3)
                    {
                      opsc=Colors.greenAccent;
                      opsd=Colors.blueGrey;
                      opsa=Colors.blueGrey;
                      opsb=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option4)
                    {
                      opsd=Colors.greenAccent;
                      opsa=Colors.blueGrey;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                    }
                  }
                  else{
                    opsd=Colors.blueGrey;
                    opsa=Colors.blueGrey;
                    opsb=Colors.blueGrey;
                    opsc=Colors.blueGrey;
                  }
                });
              },
            ),
            SizedBox(width: 100,),


            ElevatedButton(
              child: Text("Next"),
              onPressed: (){

                setState(() {

                  qid=qid+1;

                  if(mainlist[qid].answered)
                    {
                      if(mainlist[qid].answered_ans==mainlist[qid].option1)
                        {
                          opsa=Colors.greenAccent;
                          opsb=Colors.blueGrey;
                          opsc=Colors.blueGrey;
                          opsd=Colors.blueGrey;
                        }
                      else if (mainlist[qid].answered_ans==mainlist[qid].option2)
                      {
                        opsb=Colors.greenAccent;
                        opsc=Colors.blueGrey;
                        opsd=Colors.blueGrey;
                        opsa=Colors.blueGrey;
                      }
                      else if (mainlist[qid].answered_ans==mainlist[qid].option3)
                      {
                        opsc=Colors.greenAccent;
                        opsd=Colors.blueGrey;
                        opsa=Colors.blueGrey;
                        opsb=Colors.blueGrey;
                      }
                      else if (mainlist[qid].answered_ans==mainlist[qid].option4)
                      {
                        opsd=Colors.greenAccent;
                        opsa=Colors.blueGrey;
                        opsb=Colors.blueGrey;
                        opsc=Colors.blueGrey;
                      }
                    }
                  else{
                    opsd=Colors.blueGrey;
                    opsa=Colors.blueGrey;
                    opsb=Colors.blueGrey;
                    opsc=Colors.blueGrey;
                  }
                });
              },
            ),

          ],

        );
      }
    else if(qid==(total_questions-1))
      {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 10,),
            ElevatedButton(
              child: Text("Prev"),
              onPressed: (){
                setState(() {
                  qid=qid-1;
                  if(mainlist[qid].answered)
                  {
                    if(mainlist[qid].answered_ans==mainlist[qid].option1)
                    {
                      opsa=Colors.greenAccent;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                      opsd=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option2)
                    {
                      opsb=Colors.greenAccent;
                      opsc=Colors.blueGrey;
                      opsd=Colors.blueGrey;
                      opsa=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option3)
                    {
                      opsc=Colors.greenAccent;
                      opsd=Colors.blueGrey;
                      opsa=Colors.blueGrey;
                      opsb=Colors.blueGrey;
                    }
                    else if (mainlist[qid].answered_ans==mainlist[qid].option4)
                    {
                      opsd=Colors.greenAccent;
                      opsa=Colors.blueGrey;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                    }
                  }
                  else{
                    opsd=Colors.blueGrey;
                    opsa=Colors.blueGrey;
                    opsb=Colors.blueGrey;
                    opsc=Colors.blueGrey;
                  }
                });
              },
            ),
            SizedBox(width: 100,),


            ElevatedButton(
              child: Text("End"),
              onPressed: (){
                score_calculate();
                counter.cancel();
                playaudio();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => result_page(mainlist,total_score,Username),
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
        title: Text(Category_type+" Quiz"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child:  Column(
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
                  Row(
                    children: [
                      Text("Remaining time: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.bold,
                          color: Colors.white,
                        ),

                      ),
                      Text("$miniutes Minute :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.bold,
                          color: Colors.white,
                        ),

                      ),
                      Text("$second Second.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: 1-count/120,
                    backgroundColor: Colors.white,
                    minHeight: 10,
                    valueColor: AlwaysStoppedAnimation(Colors.greenAccent),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mainlist.length,
                      itemBuilder: (context,index){
                        return Row(
                          children: [
                            GestureDetector(

                              onTap: (){
                                setState(() {
                                  qid=index;
                                  if(mainlist[qid].answered)
                                  {
                                    if(mainlist[qid].answered_ans==mainlist[qid].option1)
                                    {
                                      opsa=Colors.greenAccent;
                                      opsb=Colors.blueGrey;
                                      opsc=Colors.blueGrey;
                                      opsd=Colors.blueGrey;
                                    }
                                    else if (mainlist[qid].answered_ans==mainlist[qid].option2)
                                    {
                                      opsb=Colors.greenAccent;
                                      opsc=Colors.blueGrey;
                                      opsd=Colors.blueGrey;
                                      opsa=Colors.blueGrey;
                                    }
                                    else if (mainlist[qid].answered_ans==mainlist[qid].option3)
                                    {
                                      opsc=Colors.greenAccent;
                                      opsd=Colors.blueGrey;
                                      opsa=Colors.blueGrey;
                                      opsb=Colors.blueGrey;
                                    }
                                    else if (mainlist[qid].answered_ans==mainlist[qid].option4)
                                    {
                                      opsd=Colors.greenAccent;
                                      opsa=Colors.blueGrey;
                                      opsb=Colors.blueGrey;
                                      opsc=Colors.blueGrey;
                                    }
                                  }
                                  else{
                                    opsd=Colors.blueGrey;
                                    opsa=Colors.blueGrey;
                                    opsb=Colors.blueGrey;
                                    opsc=Colors.blueGrey;
                                  }

                                });
                              },

                              child: Container(
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: mainlist[qid].answered && index==qid  ? Colors.greenAccent : index==qid ? Colors.yellowAccent : Colors.grey,
                                  child: Text(
                                    (index+1).toString(),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );
                      }
                    ),
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

                 Condition_Check(),
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
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            mainlist[qid].question_id.toString()+ ".",
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
                  SizedBox(height: 10,),

                  ////////option1
                  GestureDetector(
                    onTap: ()
                    {
                      Opa=true;
                      Opb=false;
                      Opc=false;
                      Opd=false;

                      if(mainlist[qid].option1==mainlist[qid].correct_ans)
                        {
                          mainlist[qid].right_answered=true;

                        }
                      else
                        {
                          mainlist[qid].right_answered=false;
                        }
                      mainlist[qid].answered_ans=mainlist[qid].option1;
                      mainlist[qid].answered=true;
                      mainlist[qid].not_touched=false;

                      print("working");
                      setState(() {
                        opsa=Colors.greenAccent;
                        opsb=Colors.blueGrey;
                        opsc=Colors.blueGrey;
                        opsd=Colors.blueGrey;

                      });
                      print("Question number $qid is answerd ");
                      print(mainlist[qid].right_answered.toString());
                      print("nice one");
                    },
                    child: Container(

                      height:oph,
                      width: opw,
                      decoration: BoxDecoration(
                         // borderRadius: BorderRadius.circular(40),
                          color:opsa,
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
                            height:imgh ,
                            width: imgw,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(mainlist[qid].image1),
                                fit: BoxFit.fill,
                              ),
                                border: Border.all(
                                   width: 3,
                                    color: Colors.white),

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
                  ),
                  /////////op2
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: ()
                    {
                      Opa=false;
                      Opb=true;
                      Opc=false;
                      Opd=false;
                      if(mainlist[qid].option2==mainlist[qid].correct_ans)
                      {
                        mainlist[qid].right_answered=true;


                      }
                      else
                      {
                        mainlist[qid].right_answered=false;
                      }
                      mainlist[qid].answered_ans=mainlist[qid].option2;
                      mainlist[qid].answered=true;
                      mainlist[qid].not_touched=false;

                      print("working");
                      setState(() {
                        opsb=Colors.greenAccent;
                        opsa=Colors.blueGrey;
                        opsc=Colors.blueGrey;
                        opsd=Colors.blueGrey;

                      });
                      print("Question number $qid is answerd ");
                      print(mainlist[qid].right_answered.toString());
                      print("nice one");
                    },
                    child: Container(

                      height:oph,
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
                            height:imgh ,
                            width: imgw,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(mainlist[qid].image2),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(
                                  width: 3,
                                  color: Colors.white),

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
                  ),
                  /////op3
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: ()
                    {
                      Opa=false;
                      Opb=false;
                      Opc=true;
                      Opd=false;
                      if(mainlist[qid].option3==mainlist[qid].correct_ans)
                      {
                        mainlist[qid].right_answered=true;

                      }
                      else
                      {
                        mainlist[qid].right_answered=false;
                      }
                      mainlist[qid].answered_ans=mainlist[qid].option3;
                      mainlist[qid].answered=true;
                      mainlist[qid].not_touched=false;

                      print("working");
                      setState(() {
                        opsc=Colors.greenAccent;
                        opsa=Colors.blueGrey;
                        opsb=Colors.blueGrey;
                        opsd=Colors.blueGrey;

                      });
                      print("Question number $qid is answerd ");
                      print(mainlist[qid].right_answered.toString());
                      print("nice one");
                    },
                    child: Container(

                      height:oph,
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
                            height:imgh ,
                            width: imgw,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(mainlist[qid].image3),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(
                                  width: 3,
                                  color: Colors.white),

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
                  ),
                  ////op4
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: ()
                    {Opa=false;
                    Opb=false;
                    Opc=false;
                    Opd=true;
                    if(mainlist[qid].option4==mainlist[qid].correct_ans)
                    {
                      mainlist[qid].right_answered=true;

                    }
                    else
                    {
                      mainlist[qid].right_answered=false;
                    }
                    mainlist[qid].answered_ans=mainlist[qid].option4;
                    mainlist[qid].answered=true;
                    mainlist[qid].not_touched=false;

                    print("working");
                    setState(() {
                      opsd=Colors.greenAccent;
                      opsb=Colors.blueGrey;
                      opsc=Colors.blueGrey;
                      opsa=Colors.blueGrey;

                    });
                    print("Question number $qid is answerd ");
                    print(mainlist[qid].right_answered.toString());
                    print("nice one");
                    },
                    child: Container(

                      height:oph,
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
                            height:imgh ,
                            width: imgw,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(mainlist[qid].image4),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(
                                  width: 3,
                                  color: Colors.white),

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


