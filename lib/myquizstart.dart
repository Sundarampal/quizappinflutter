import 'package:flutter/material.dart';
import 'package:quizappinflutter/myquiz.dart';
import 'package:quizappinflutter/subjectarray.dart';

class MyQuizStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Card(
                child: Text(
                  "Quiz App",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.grey.shade900,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                // child: MyQuiz(),
                child: Column(children: SubjectArray.buttons,),
              ),
            ),
          ),
        ),

      ),
    );
  }
}
