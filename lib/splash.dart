import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quizzing_app/homescreen.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => homeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
      child: Text(
        "QuizUp",
        style: TextStyle(
          fontSize: 70.0,
          fontFamily: 'Helvetica',
        ),
      )
      ),
    );
  }
}
