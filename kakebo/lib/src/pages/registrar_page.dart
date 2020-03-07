import 'package:flutter/material.dart';

class RegistrarPage extends StatelessWidget {
 
  static String name = 'registrar'; 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Registrar gasto'),
             backgroundColor: Color(0xff000051),
            ),
          
          body: Text("hola estas por registrar un gasto"),
        )
      );
  }
}