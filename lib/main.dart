
import 'package:flutter/material.dart';
import 'Question.dart';
import './Button.dart';

main()=>runApp(const QuizApp());

class _QuizState extends State<QuizApp>{

  int _perguntaSelecionada = 0;
  final List<String> perguntas = [
    
  ];
  final List<Map<String, Object>> askAndAnswers = [
    {
      'pergunta' : 'Qual é a sua cor favorita?',
      'resposta': ["Azul", "Verde", "Vermelho", "Amarelo"]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'resposta':["Cachorro", "Gato", "Passarinho", "Coelho"],
    },
    {
      'pergunta': 'Qual a sua bebida favorita?',
      'resposta': ["Café", "Leite", "Refrigerante", "Água"]
    }
  ];
  late List<String> answers;
  late List<Widget> buttonList;


  void _responder(){
    setState(() {
      _perguntaSelecionada++;
    });
  }

  

  
  @override
  Widget build(BuildContext context){
    
    answers = askAndAnswers.elementAt(_perguntaSelecionada)['resposta'] as List<String>;
    buttonList = answers.map((texto)  =>  Button(texto, _responder)).toList() ;


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'), backgroundColor: const Color.fromARGB(255, 0, 146, 124),
        ),
        body:Column(children: [
            Question(askAndAnswers[_perguntaSelecionada]['pergunta'] as String),
            ...buttonList
          ])
      ),

    );
  }
}

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});


  @override
  _QuizState createState(){
    return _QuizState();
  }

}
