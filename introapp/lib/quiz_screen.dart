import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required void Function() onResult});


  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.of(context).pushNamed('/result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(questions[currentQuestionIndex].question),
              ...questions[currentQuestionIndex].answers.map((answer) {
                return ElevatedButton(
                  onPressed: () {
                    nextQuestion();
                  },
                  child: Text(answer),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
