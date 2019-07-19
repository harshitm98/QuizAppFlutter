import 'package:flutter/material.dart';

import './question.dart';

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

  void _answerQuestion() {
    // setState does not re render the whole UI but only the concerned widget...
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favourite colour?",
      "What's your favourite animal?",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            // We created our own widget Question here
            // Makes it easier to manage the code, helps with performance since makes the code more efficient
            Question(
              questions[_questionIndex],
            ),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed:
                  _answerQuestion, // By removing the paranthesis, we are passing the pointer / name
              // to the function so that it (flutter) can execute and not us while we are passing the fn
            ),
            RaisedButton(
              child: Text("Answer 2"),
              onPressed: () => {
                // ...
                print("Answer 2 is chosen...")
              }, // Anonymous function...
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer 4"),
              onPressed: _answerQuestion,
            ),
          ],
        ), // body only takes one widget
      ),
    );
  }
}
