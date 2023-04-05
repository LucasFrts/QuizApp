import 'package:flutter/material.dart';
import 'Question.dart';
import './Button.dart';

class Questionary extends StatelessWidget {
  final List<Map<String, String>> answers;
  final String question;
  final dynamic Function(String result) _responder;
  late int value;
  Questionary(this.question, this.answers, this._responder,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(question),
      ...answers.map((answer)  =>  Button(answer['texto'].toString(),() => _responder(answer['valor'].toString()) )).toList()
    ],);
  }
}