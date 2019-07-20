import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;  // Means it's a function or 
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: RaisedButton(
        color: Colors.blue,
        child: Text(answerText),
        onPressed: selectHandler,
        textColor: Colors.white,
      ),
    );
  }
}
