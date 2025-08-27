import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'question.dart';

class QuestionArray {
  static Future<String> downloadQuestions() async {
    final url = Uri.https(
      "sundarampal.github.io",
      "/myjsonfiles/truefalsequestions.json",
    );
    try {
      final response = await http.get(url);
      final a = convert.jsonDecode(response.body);
      int n=a.length;
       print(n);
      for (int i = 0; i <= n - 1; i++) {
        String question = a[i]["question"].toString();
        bool correctanswer = (a[i]["correctanswer"].toString()=="true")?true:false;
        print(question);
        print(correctanswer);

        questions.add(Question(a[i]["question"], correctanswer));
      }
      return "ok";
    } catch (ex) {
      print(ex);
      return "no";
    }
  }

  static List<Question> questions = [];
  //   Question("C is a programming language? T/F", true),
  //   Question("C++ is not an object oriented language.. T/F", false),
  //   Question("Python has dictionary.. T/F", true),
  //   Question("Hukulganj is the capital of Japan T/F", false),
  //   Question("America is the best places T/F", true)
  // ];
}
