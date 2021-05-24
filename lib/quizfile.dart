import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String title = "Quiz";

  static int level = 1;
  static int score = 0;

  static Generator gen = new Generator();
  static Question question = gen.generate(level);

  String state = "";
  String body = question.body;
  String value1 = question.ans[0];
  String value2 = question.ans[1];
  String value3 = question.ans[2];
  String value4 = question.ans[3];

  String validResult = question.valid.toString();

  void submit1(){
    if (value1 == validResult)
      setState(() => validAns());
    else
      setState(() => state = "False");
  }

  void submit2(){
    if (value2 == validResult)
      setState(() => validAns());
    else
      setState(() => state = "False");
  }

  void submit3(){
    if (value3 == validResult)
      setState(() => validAns());
    else
      setState(() => state = "False");
  }

  void submit4(){
    if (value4 == validResult)
      setState(() => validAns());
    else
      setState(() => state = "False");
  }

  void validAns(){
    state = "True";
    score += 10;
    level += 1;
    question = gen.generate(level);
    body = question.body;
    value1 = question.ans[0];
    value2 = question.ans[1];
    value3 = question.ans[2];
    value4 = question.ans[3];
    validResult = question.valid.toString();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Level : $level",
              style: TextStyle(
                fontSize: 20.0,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Score : $score",
                style: TextStyle(
                  fontSize: 20.0,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(body,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,)),
            ),
            RaisedButton(onPressed: submit1,
              child: Text(value1),
              color: Colors.red,
              textColor: Colors.white,),
            RaisedButton(onPressed: submit2,
              child: Text(value2),
              color: Colors.red,
              textColor: Colors.white,),
            RaisedButton(onPressed: submit3,
              child: Text(value3),
              color: Colors.red,
              textColor: Colors.white,),
            RaisedButton(onPressed: submit4,
              child: Text(value4),
              color: Colors.red,
              textColor: Colors.white,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(state,
                style: TextStyle(
                  fontSize: 20.0,
                ),),
            ),
        ],
        )
      ),
    );
  }
}

  class Question{
    int level;
    int valid;
    String body;
    List<String> ans;
    Question(int level, int valid, String body, List<String> ans){
      this.level = level;
      this.valid = valid;
      this.body = body;
      this.ans = ans;
    }
  }

  class Generator{
    static final r = new Random();

    Question generate(int level){
      int limit = level * 10;
      int x = r.nextInt(limit) + 1;
      int y = r.nextInt(limit) + 1;
      int o = r.nextInt(3);

      String body = makeBody(x, y, o);
      int validAns = getValidAnswer(x, y, o);
      List<String> ans = new List();
      ans.add(validAns.toString());

      while(ans.length != 4){
        int num = r.nextInt(limit);
        if(!ans.contains(num)){
          ans.add(num.toString());
        }
      }
      ans.shuffle();
      return new Question(level, validAns, body, ans);
    }
    String makeBody(int x, int y, int o){
      switch(o){
        case 1:
          return "$x - $y";
        case 2:
          return "$x * $y";
        case 3:
          return "$x / $y";
        default:
          return "$x + $y";
      }
    }
    int getValidAnswer(int x, int y, int o){
      switch(o){
        case 1:
          return x - y;
        case 2:
          return x * y;
        case 3:
          return (x/y).round();
        default:
          return x + y;
      }
    }

    }
