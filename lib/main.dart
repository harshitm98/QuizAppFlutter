import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp()); // a "new" object of the class MyApp
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void answerQuestion(){
    print('Answer chosen!');
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
            Text("The questions!"),
            RaisedButton(
              child: Text("Answer 1"),
              onPressed: answerQuestion, // By removing the paranthesis, we are passing the pointer / name
              // to the function so that it (flutter) can execute and not us while we are passing the fn
            ),
            RaisedButton(
              child: Text("Answer 2"),
              onPressed: () =>{
                // ...
                print("Answer 2 is chosen...")
              }, // Anonymous function...
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer 4"),
              onPressed: answerQuestion,
            ),
          ],
        ), // body only takes one widget
      ),
    );
  }
}
