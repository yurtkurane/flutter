import 'package:flutter/material.dart';
import 'package:introapp/home_screen.dart';
import 'package:introapp/quiz_screen.dart';

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
  
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(goToQuiz);
  
    if(activeScreenName == "quiz_screen") activeScreen = QuizScreen();
  
    return Container(
      child: activeScreen,
    );
  }
}