import 'package:flutter/material.dart';
import 'package:introapp/home_screen.dart';
import 'package:introapp/quiz_screen.dart';
import 'package:introapp/result_screen.dart';



class SwiperScreen extends StatefulWidget {
  const SwiperScreen({ Key? key }) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  String activeScreenName = "home_screen";

 void goToQuiz(){
    setState((){
      activeScreenName = "quiz_screen";
    });
  }

  void goToResult(){
    setState((){
      activeScreenName = "result_screen";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(goToQuiz);
  
    if(activeScreenName == "quiz_screen") {
      activeScreen = QuizScreen(onResult: goToResult);
    } else if(activeScreenName == "result_screen") {
      activeScreen = ResultScreen();
    }
    return Scaffold(
      body: activeScreen,
    );
  }
}