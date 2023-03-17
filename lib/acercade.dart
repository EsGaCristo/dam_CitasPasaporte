import 'package:flutter/material.dart';

class Acercade extends StatefulWidget {
  const Acercade({Key? key}) : super(key: key);

  @override
  State<Acercade> createState() => _AcercadeState();
}

class _AcercadeState extends State<Acercade> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Text("(C) RESERVADOS ",textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color:Colors.red)),
        Text("ESTRADA GARCIA",textAlign: TextAlign.center,style: TextStyle(fontSize: 30, color:Colors.red)),
        Text("Instituto Tecnologico De Tepic",textAlign: TextAlign.center,style: TextStyle(fontSize: 15, color:Colors.blue)),
      ],
    );
  }
}
