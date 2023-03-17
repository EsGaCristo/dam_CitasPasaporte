
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
enum Genero {hombre,mujer}

class Aplicacion1basica extends StatefulWidget {
  const Aplicacion1basica({Key? key}) : super(key: key);

  @override
  State<Aplicacion1basica> createState() => _Aplicacion1basicaState();
}

class _Aplicacion1basicaState extends State<Aplicacion1basica> {
  Genero _status = Genero.mujer;
  @override
  final campo1 = TextEditingController();
  final campo2 = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Aplicaion 1 - Basica"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
             campo1.text = "";
             campo2.text = "";
             _status = Genero.mujer;
            });
          }, icon: Icon(Icons.cleaning_services))
        ],
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(30),child: Text("CURP PIRATA",style: TextStyle( fontSize: 26, color: Colors.amber),), ),
          Padding(padding: EdgeInsets.all(30),child:
          TextField(textAlign: TextAlign.center, controller: campo1,  decoration: InputDecoration(labelText: "Apellidos"),),
          ),
          Padding(padding: EdgeInsets.all(30),child:
          TextField(textAlign: TextAlign.center, controller: campo2,  decoration: InputDecoration(labelText: "Nombres"),),
          ),
          SizedBox(height: 15,),

          RadioListTile(
              title: Text("Mujer"),
              value: Genero.mujer,
              groupValue: _status,
              onChanged: (Genero? valor){
                setState(() {
                  _status = valor!;
                });
          }),

          RadioListTile(
              title: Text("Hombre"),
              value: Genero.hombre,
              groupValue: _status,
              onChanged: (Genero? valor){
                setState(() {
                  _status = valor!;
                });
              }),

          ElevatedButton(onPressed: (){generacion();}, child: Text("Generar CURP")),
          TextButton(onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Ayuda"),
                  content: Text("*Para generar una curp llenar campos"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cerrar"),
                    ),
                  ],
                );
              },
            );
          },
            child: Text("Presione aqui para informacion"),),
        ],
      ),
    );
  }

  void generacion() {

    var aux = "Datos no validos ";

    if(campo1.text.replaceAll(" ", "") != "" && campo2.text.replaceAll(" ", "") != ""){
      aux = (campo1.text.substring(0,2) + campo2.text.substring(0,2)+
          _status.name.substring(0,1)).toUpperCase() +
          Random().nextInt(999-100).toString() +"NTSRHA1";
      Clipboard.setData(ClipboardData(text: aux));

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Su curp se ha copiado al portapapeles")
          )
      );

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Datos no ingresados correctamente")
          )
      );


    }

    campo1.text = "";
    campo2.text = "";
  }
}
