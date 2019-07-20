import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // We created our own widget Question here
        // Makes it easier to manage the code, helps with performance since makes the code more efficient
        Question(
          questions[questionIndex]["questionText"],
        ),
        /*
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
            ),*/

        // '...' does is spreads the list. That is takes all the values in the list and adds/spreads them individually
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>).map((answer) {
          // So now pointer is passed in form of an anonymous function so that we can pass arguments through answerQuestion() so 
          // answerQuestion() will be executed but only when anonymous function is executed. 
          return Answer(() => answerQuestion(answer["score"]), answer['text']);
        }).toList(),
      ],
    );
  }
}
