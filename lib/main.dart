import 'package:flutter/material.dart';
import 'package:quizappinflutter/myquizstart.dart';
import 'package:quizappinflutter/questionarray.dart';
import 'package:quizappinflutter/subjectarray.dart';

void main()async
{
  await SubjectArray.downloadSubject();
  // await QuestionArray.downloadQuestions();
  runApp(MyQuizStart());
}