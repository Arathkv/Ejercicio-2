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
  TextEditingController palabras = new TextEditingController();

  String frase ='';
  String fraseoriginal='';
  String comentario='';
  bool palindromo=true;
  int cantidad=0;
  String cuenta='';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Palíndromos'),
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
                  labelText: 'Frase',
                  hintText: 'Escribe una frase',
                ),
                controller: palabras,
              ),
            ),
            //second input filed

            RaisedButton(
              color: Colors.green,
              child: Text('Verificar Frase'),
              onPressed: (){
                setState((){
                  cantidad=0;
                  frase='';
                  palindromo=true;
                  frase = palabras.text.toUpperCase();
                  fraseoriginal=frase;
                  fraseoriginal=fraseoriginal.trimLeft();
                  fraseoriginal=fraseoriginal.trimRight();
                  frase = frase.replaceAll(' ', '');

                  int longitud=frase.length;
                  for (int i=0; i<longitud; i++)
                  {
                    if (frase[i]!=frase[(longitud-1)-i])
                    {
                      palindromo = false;
                    }
                  }
                  if (palindromo)
                  {
                    comentario='Si es palíndromo';
                    cantidad=1;
                    for (int x=0; x<fraseoriginal.length; x++)
                    {
                      if (fraseoriginal[x]==' ')
                      {
                        cantidad++;
                      }
                    }
                    cuenta = cantidad.toString();
                  }
                  else
                  {
                    comentario='No es palíndromo';
                  }



                });
              },
            ),

            SizedBox(height: 15),
            new Text(comentario,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),

            SizedBox(height: 15),
            new Text(cuenta,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),


          ],
        ),
      ),
    );
  }
}
