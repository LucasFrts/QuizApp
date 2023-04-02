import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String texto;
  final void Function() onPress;
  const Button(this.texto, this.onPress, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
      onPressed: onPress, 
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan.shade600)),
      child: Text(texto, style: const TextStyle(
        fontSize: 18,
        color:Color.fromARGB(255, 238, 238, 238)
      ),)
      ,
      ),
    );
  }
}