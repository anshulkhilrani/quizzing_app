import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzing_app/quizfile.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {

  Widget card(){ 
    return Padding(padding: EdgeInsets.all(20),
    child: InkWell(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Quiz()));
      },
        child: Material(
          elevation: 10.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Material(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      child:Image(
                        image: AssetImage(
                          "images/math.jpg",
                        ),
                      ),
                    ),
                  ),
          )),
                Center(
                  child: Text("Math Quiz",
                  style: TextStyle(
                      fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                )
              ],
            ),
          ),
        ),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizUp'),
      ),
      body: ListView(
        children: <Widget>[
          card(),
        ],
      )
    );
  }
}
