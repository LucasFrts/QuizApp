
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Questionary.dart';
import 'Result.dart';
main()=>runApp(const QuizApp());

class _QuizState extends State<QuizApp>{

  int _selectedQuestion = 0;
  int _quantidadeAcertada = 0;
  final  _askAndAnswers = const [
    {
      'pergunta' : 'Qual é a sua cor favorita?',
      'resposta': [
        {"texto":"Azul"    , "valor": "1"  } ,
        {"texto":"Verde"   , "valor": "1"  } ,
        {"texto":"Vermelho", "valor": "1"  } ,
        {"texto":"Amarelo" , "valor": "1"  }]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'resposta':[
        {"texto": "Cachorro",   "valor": "1"},
        {"texto": "Gato",       "valor": "1"},
        {"texto": "Passarinho", "valor": "1"},
        {"texto": "Coelho"    , "valor": "1"}
        ],
    },
    {
      'pergunta': 'Qual a sua bebida favorita?',
      'resposta': [
        {"texto":"Café"         , "valor": "1"}, 
        {"texto":"Leite"        , "valor": "1"}, 
        {"texto":"Refrigerante" , "valor": "1"}, 
        {"texto":"Água"         , "valor": "1"}
        ]
    }
  ];

  late List<Map<String, String>> answers;

  bool get hasQuestion {
    return _selectedQuestion < _askAndAnswers.length;
  }

   dynamic _responder(String result){
    
    setState(() {
      _selectedQuestion++;
      if(result == "1"){
     
        _quantidadeAcertada++;
      
    }
    print(_quantidadeAcertada);
    });
  }

  

  
  @override
  Widget build(BuildContext context){
    if(hasQuestion){
      answers =  _askAndAnswers.elementAt(_selectedQuestion)['resposta'] as List<Map<String, String>>;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz', textAlign: TextAlign.center), backgroundColor: const Color.fromARGB(255, 0, 146, 124),
        ),
        body: hasQuestion ? 
            Questionary(
            _askAndAnswers[_selectedQuestion]['pergunta'] as String, 
            answers, 
            _responder
            )
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
