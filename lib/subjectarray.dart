import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:quizappinflutter/subject.dart';
import 'subject.dart';
import 'package:flutter/material.dart';
class SubjectArray {
  static List<Subject> subjects = [];
static List<ElevatedButton> buttons=[];

  static Future<String> downloadSubject() async {
    final url = Uri.https(
      "sundarampal.github.io",
      "/myjsonfiles/allquizzes.json",
    );
    try {
      final response = await http.get(url);
      final a = convert.jsonDecode(response.body);
      int n=a.length;
      // print(n);
      // print(a);
      for (int i = 0; i <= n - 1; i++) {
        String subjectname = a[i]["quizname"].toString();
        String subjecturl = a[i]["quizurl"].toString();
        print(subjectname);
        print(subjecturl);

        subjects.add(Subject(subjectname, subjecturl));
        buttons.add(ElevatedButton(onPressed: (){

          print(subjecturl);
        }, child:  Text(subjectname,style: const TextStyle(fontSize: 25.0, color: Colors.black),)));
      }
      return "ok";
    } catch (ex) {
      print(ex);
      return "no";
    }
  }

}
