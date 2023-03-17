import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  DateTime _dateTime = DateTime.now();

  void callDataPicker() async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    ).then((value){
      setState(() {
        _dateTime = value!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(40),
        children: [
            Text("Generar cita",textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.red),),
            SizedBox(height: 40),
            Text("${_dateTime.day.toString()} / ${_dateTime.month.toString()} / ${_dateTime.year.toString()}", style: TextStyle(fontSize: 30),),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: callDataPicker ,
                child: Text("Seleccione fecha")
            ),
            Padding(padding: EdgeInsets.all(30),child:
            TextField(textAlign: TextAlign.center,  decoration: InputDecoration(labelText: "Inserte CURP", border: OutlineInputBorder()),),
            ),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Se ha generado su cita para pasaporte")
                      )
                  );
                } ,
                child: Text("Agendar cita")
            ),
        ],//
      ),
    );
  }
}


