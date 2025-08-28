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
        String url1 = a[i]["url1"].toString();
        String url2 = a[i]["url2"].toString();
        print(subjectname);
        print(url1);
            print(url2);

        subjects.add(Subject(subjectname, url1,url2));
        buttons.add(ElevatedButton(onPressed: (){

          print(url1);
        }, child:  Text(subjectname,style: const TextStyle(fontSize: 25.0, color: Colors.black),)));
      }
      return "ok";
    } catch (ex) {
      print(ex);
      return "no";
    }
  }

}
