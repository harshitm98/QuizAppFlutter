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
    return _MyAppState();
  }
}

// Leading underscore changes the class to private class
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _total_score = 0;
  final _questions = const [
    {
      "questionText": "What's your favourite colour?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 3},
        {"text": "Yellow", "score": 5},
      ],
    },
    {
      "questionText": "What's your favourite animal?",
      "answers": [
        {"text": "Lion", "score": 7},
        {"text": "Snake", "score": 4},
        {"text": "Rabbit", "score": 5},
        {"text": "Elephant", "score": 3},
      ],
    },
    {
      "questionText": "What's your favourite team?",
      "answers": [
        {"text": "Barcelona", "score": 2},
        {"text": "Bayern", "score": 5},
        {"text": "Aresenal", "score": 19},
        {"text": "Man City", "score": 6},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _total_score += score;
    print("Total score: " + _total_score.toString());
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

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _total_score = 0;
    });
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
            : Result(_total_score, _resetQuiz), // body only takes one widget
      ),
    );
  }
}
