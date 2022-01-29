/*
Escuela (Univercida Tecnologica Metropolitana);
Materia (Desarrollo Movil Multiplaforma);
Maestro (Joel Ivan Chuc Uc);
Actividad (Actividad 2 Unidad 1);
Alumno (Arath Koh Velázquez);
Cuatrimestre (5);
Grupo (B);
Parcial (1);

*/

import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
  )
  );
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  TextEditingController altura = new TextEditingController();
  TextEditingController peso = new TextEditingController();
  String result ='0';
  String comentario='';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular Índice de Masa Corporal'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // first input field
            Padding(padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura',
                  hintText: 'Altura en centímetros',
                ),
                controller: altura,
              ),
            ),
            //second input filed
            Padding(padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso',
                  hintText: 'Peso en kilogramos',
                ),
                controller: peso,
              ),
            ),
            RaisedButton(
              color: Colors.yellow,
              child: Text('Calcular IMC'),
              onPressed: (){
                setState((){
                  comentario='';
                  double alto = double.parse(altura.text)/100;
                  double pesa = double.parse(peso.text);
                  double imc =  pesa / (alto*alto);
                  result = imc.toString();

                  if (imc>30)
                  {
                    comentario = 'Obesidad';
                  }
                  else if (imc>=25 && imc<=29.9)
                  {
                    comentario = 'Peso superior al normal';
                  }
                  else if (imc>=18.5 && imc<=24.9)
                  {
                    comentario = 'Normal';
                  }
                  else if (imc <18.5)
                  {
                    comentario = 'Peso inferior al normal';
                  }

                });
              },
            ),
            SizedBox(height: 15),
            new Text(result,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),

            SizedBox(height: 15),
            new Text(comentario,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),),


          ],
        ),
      ),
    );
  }
}
