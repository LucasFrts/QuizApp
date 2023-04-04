
import 'package:flutter/material.dart';
import 'Questionary.dart';
import 'Result.dart';
main()=>runApp(const QuizApp());

class _QuizState extends State<QuizApp>{

  int _selectedQuestion = 0;
  final List<Map<String, Object>> _askAndAnswers = const [
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

  bool get hasQuestion {
    return _selectedQuestion < _askAndAnswers.length;
  }

  void _responder(){
    setState(() {
      _selectedQuestion++;
    });
  }

  

  
  @override
  Widget build(BuildContext context){
    if(hasQuestion){
      answers =  _askAndAnswers.elementAt(_selectedQuestion)['resposta'] as List<String>;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz', textAlign: TextAlign.center), backgroundColor: const Color.fromARGB(255, 0, 146, 124),
        ),
        body: hasQuestion ? 
            Questionary(_askAndAnswers[_selectedQuestion]['pergunta'] as String, answers, _responder)
           : const Result()
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
