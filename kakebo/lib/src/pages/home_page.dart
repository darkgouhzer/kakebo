import 'package:flutter/material.dart';
import 'package:kakebo/src/pages/egresos_page.dart';
import 'package:kakebo/src/pages/guia_page.dart';
import 'package:kakebo/src/pages/ingresos_page.dart';
import 'package:kakebo/src/pages/movimientos_page.dart';
import 'package:kakebo/src/pages/reportes_page.dart';
import 'package:kakebo/src/providers/movimientos_info.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MovimientosInfo>(context, listen: false).obtenerMovimientos();
    TextStyle style = TextStyle(fontSize: 35.0, color: Colors.white);

    final ButtonStyle ingresosButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.orange[50],
      primary: Colors.orange,
      minimumSize: Size(250, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff1a237e))),
    );

    final ButtonStyle egresosButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.teal[50],
      primary: Colors.teal,
      minimumSize: Size(250, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff1a237e))),
    );

    final ButtonStyle movsButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.deepOrange[50],
      primary: Colors.deepOrange,
      minimumSize: Size(250, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff1a237e))),
    );

    final ButtonStyle reporteButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.lightBlueAccent[50],
      primary: Colors.lightBlueAccent,
      minimumSize: Size(250, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff1a237e))),
    );

    final ButtonStyle guiaButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.lightGreen[50],
      primary: Colors.lightGreen,
      minimumSize: Size(250, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Color(0xff1a237e))),
    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffE1E2E1),
      appBar: AppBar(
        backgroundColor: Color(0xff0277bd),
        title: Text("Kakebo"),
      ),
      body: Center(
          child: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            ButtonTheme(
              minWidth: 200.0,
              child: ElevatedButton(
                style: ingresosButtonStyle,
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) {
                    return IngresosPage();
                  });
                  Navigator.push(context, route);
                },
                child: Text("Ingresos", style: style),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              minWidth: 200.0,
              child: ElevatedButton(
                style: egresosButtonStyle,
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) {
                    return EgresosPage();
                  });
                  Navigator.push(context, route);
                },
                child: Text("Egresos", style: style),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: ElevatedButton(
                style: movsButtonStyle,
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) {
                    return MovimientosPage();
                  });
                  Navigator.push(context, route);
                },
                child: Text("Movimientos", style: style),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              minWidth: 200.0,
              child: ElevatedButton(
                style: reporteButtonStyle,
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) {
                    return ReportesPage();
                  });
                  Navigator.push(context, route);
                },
                child: Text("Reporte", style: style),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              minWidth: 200.0,
              child: ElevatedButton(
                style: guiaButtonStyle,
                onPressed: () {
                  final route = MaterialPageRoute(builder: (context) {
                    return GuiaPage();
                  });
                  Navigator.push(context, route);
                },
                child: Text("Guía", style: style),
              ),
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        )
      ])),
    ));
  }
}
