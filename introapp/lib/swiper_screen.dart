import 'package:flutter/material.dart';
import 'package:introapp/home_screen.dart';
import 'package:introapp/quiz_screen.dart';
import 'package:introapp/result_screen.dart';



class SwiperScreen extends StatefulWidget {
  SwiperScreen({ Key? key }) : super(key: key);
  List<String>userAnswers = [];

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  String activeScreenName = "home_screen"; //hafızada tutulan bir değişken
  List<String> userAnswers = [];

 void goToQuiz(){
    setState((){
      activeScreenName = "quiz_screen";
    });
  }

    void addAnswer(String answer) {
    userAnswers.add(answer);
    print("Listeye yeni cevap eklendi:");
    print(userAnswers);
  }


  

  void goToResult(){
    setState((){
      activeScreenName = "result_screen";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(goToQuiz);
        if (activeScreenName == "quiz-screen") {
      activeScreen = QuizScreen(
        chooseAnswer: (answer) => addAnswer(answer),
      );
    }
  
   
    return Scaffold(
      body: activeScreen,
    );
  }
}