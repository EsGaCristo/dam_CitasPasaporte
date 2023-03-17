import 'package:dam_u2_appflutter_avanzada/acercade.dart';
import 'package:dam_u2_appflutter_avanzada/menu.dart';
import 'package:dam_u2_appflutter_avanzada/aplicacion1basica.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _indice = 0;

  void _cambiarIndice(int indice){
    setState(() {
      _indice = indice;
    });
  }
  final List<Widget> _paginas = [
    Aplicacion1basica(),
    Menu(),
    Acercade(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Citas para pasaporte"),),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Principal", ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Curp",),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: "Calculadora", ),
        ],
        backgroundColor: Colors.blueGrey,
        currentIndex: _indice,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: _cambiarIndice,
        iconSize: 30,
      ),
    );
  }
}
