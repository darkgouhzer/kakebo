import 'package:flutter/material.dart';

class ReportesPage extends StatefulWidget {
  static String name = 'reportes';

  @override
  _ReportesPageState createState() => _ReportesPageState();
}

class _ReportesPageState extends State<ReportesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Reporte'),
              backgroundColor: Colors.lightBlueAccent,
              ),
            body: Text('Pantalla de reportes'),
            
          ),
    );
  }
}