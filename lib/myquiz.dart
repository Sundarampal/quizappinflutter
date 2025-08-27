import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'question.dart';

import 'questionarray.dart';

class MyQuiz extends StatefulWidget {
  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  String currentquestiontext = "Press any button to start the quiz";
  int questionno = -1;
  int correctanswers = 0;
  bool isTestOver = false;
  List<Question> questions = QuestionArray.questions;
  Question? currentquestion;
  List<Widget> scores = [];

  void setQuestion(bool b) {
    //isTestOver=false;
    //questionno=-1;
    //scores.clear();
print("Question se");
    if (isTestOver) return;

    if (questionno == -1) {
      questionno++;
      currentquestion = questions[questionno];
      currentquestiontext = currentquestion!.question;
      return;
    }

    if (questionno >= questions.length - 1) {
      addResult(b);
      currentquestiontext = "Questions Over. Correct answers = $correctanswers";
      isTestOver = true;
      return;
    }

    addResult(b);
    questionno++;
    if (questionno <= questions.length - 1) {
      currentquestion = questions[questionno];
      currentquestiontext = currentquestion!.question;
    }
  }

  void addResult(bool b) {
    bool iscorrect = b == currentquestion!.correctAnswer;
    //scores.clear();
    if (iscorrect) {
      correctanswers++;
      scores.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(const Icon(Icons.close, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentquestiontext,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              onPressed: () {
                print("Submitted True");
                setState(() {
                  // addResult(true);
                  setQuestion(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                print("Submitted False");
                setState(() {
                  // addResult(false);
                  setQuestion(false);
                });
              },
            ),
          ),
        ),
        SizedBox(height: 10),

      ],
    );
  }
}
