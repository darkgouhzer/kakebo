import 'package:flutter/material.dart';

class GuiaPage extends StatelessWidget {
  static String name = 'guia';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Guía'),
              backgroundColor: Colors.lightGreen,
              ),
            body: Text('Pantalla de guía.'),
            
          ),
    );
  }
}