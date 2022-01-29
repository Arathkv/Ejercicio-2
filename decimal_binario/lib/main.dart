/*

  Escuela (Universidad Tecnologica Metropolitana);
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
  TextEditingController decimal = new TextEditingController();

  String residuo ='';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Convertir Decimal a Binario'),
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
                  labelText: 'Número Decimal',
                  hintText: 'Escribe un número decimal',
                ),
                controller: decimal,
              ),
            ),
            //second input filed

            RaisedButton(
              color: Colors.yellow,
              child: Text('Convertir'),
              onPressed: (){
                setState((){
                  residuo = '';
                  int numero = int.parse(decimal.text);

                  while(numero >=1) {

                    residuo = (numero % 2).toString() + residuo;
                    numero = numero ~/ 2;
                  }

                });
              },
            ),



            SizedBox(height: 15),
            new Text(residuo,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),



          ],
        ),
      ),
    );
  }
}
