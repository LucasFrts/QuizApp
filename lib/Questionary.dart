import 'package:flutter/material.dart';
import 'Question.dart';
import './Button.dart';

class Questionary extends StatelessWidget {
  final List<String> answers;
  final String question;
  final void Function() _responder;
  const Questionary(this.question, this.answers, this._responder,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(question),
      ...answers.map((texto)  =>  Button(texto, _responder)).toList()
    ],);
  }
}