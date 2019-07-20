import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(MyApp()); // a "new" object of the class MyApp
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// Leading underscore changes the class to private class
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      "questionText": "What's your favourite colour?",
      "answers": ["Black", "Red", "Green", "Yellow"],
    },
    {
      "questionText": "What's your favourite animal?",
      "answers": ["Lion", "Snake", "Rabbit", "Elephant"],
    },
    {
      "questionText": "What's your favourite team?",
      "answers": ["Barcelona", "Bayern", "Aresenal", "Man City"],
    },
  ];

  void _answerQuestion() {
    // setState does not re render the whole UI but only the concerned widget...
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        // Fancy way of if-else block (? - if and : - else)
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(), // body only takes one widget
      ),
    );
  }
}
