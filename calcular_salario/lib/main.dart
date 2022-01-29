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
  TextEditingController horas = new TextEditingController();
  String result ='0';
  String comentario='';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular Salario Semanal'),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                  labelText: 'Horas Trabajadas',
                  hintText: 'Horas Trabajadas',
                ),
                controller: horas,
              ),
            ),

            RaisedButton(
              color: Colors.grey,
              child: Text('Calcular Salario'),
              onPressed: (){
                setState((){
                  int total = int.parse(horas.text);
                  int salario=0;
                  comentario='';
                  if (total>40)
                  {
                    int hextra = total-40;
                    salario = 40*120 + hextra*175;
                  }
                  else{
                    salario = total * 120;
                    if (total<27)
                    {
                      comentario = 'Se levantará un acta administrativa por faltas';
                    }
                  }
                  result = 'Salario: ' + salario.toString();
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
