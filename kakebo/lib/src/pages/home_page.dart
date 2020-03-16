import 'package:flutter/material.dart';
import 'package:kakebo/src/pages/egresos_page.dart';
import 'package:kakebo/src/pages/guia_page.dart';
import 'package:kakebo/src/pages/ingresos_page.dart';
import 'package:kakebo/src/pages/reportes_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextStyle  style = TextStyle(fontSize: 35.0, color: Colors.white);

    return SafeArea(child: Scaffold(
          backgroundColor: Color(0xffE1E2E1),
          appBar: AppBar(
            backgroundColor: Color(0xff0277bd),
            title: Text("Kakebo"),
            ),
          body: Center(
            
            child: ListView(
              children: <Widget>[ Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 SizedBox(height: 50.0,),
                ButtonTheme(
                  minWidth: 200.0,
                  child:RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
                      child: Text("Ingresos", style: style),
                      color: Colors.orange, 
                      shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xff1a237e))),              
                      onPressed: (){
                        final route = MaterialPageRoute(
                          builder: (context){
                            return IngresosPage();
                          }
                          );
                        Navigator.push(context, route);
                      }
                  )
                ),
                SizedBox(height: 20.0,),
                 ButtonTheme(
                  minWidth: 200.0,
                  child:RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
                    child: Text("Egresos", style:style),
                    color: Colors.teal,
                    shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xff1a237e))),
                    onPressed: (){
                         final route = MaterialPageRoute(
                          builder: (context){
                            return EgresosPage();
                          }
                          );
                        Navigator.push(context, route);
                    }
                  ),
                ),
                 SizedBox(height: 20.0,)
                ,
                 ButtonTheme(
                  minWidth: 200.0,
                  child:RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
                    child: Text("Reporte", style:style),
                    color: Colors.lightBlueAccent,
                    shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xff1a237e))),
                    onPressed: (){

                          final route = MaterialPageRoute(
                          builder: (context){
                            return ReportesPage();
                          }
                          );
                        Navigator.push(context, route);
                    }
                  ),
                ),
                 SizedBox(height: 20.0,)
                ,
                 ButtonTheme(
                  minWidth: 200.0,
                  child:RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
                    child: Text("Guía", style:style),
                    color: Colors.lightGreen,
                    shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xff1a237e))),
                    onPressed: (){                      
                      final route = MaterialPageRoute(
                      builder: (context){
                        return GuiaPage();
                      }
                      );
                    Navigator.push(context, route);
                    }
                  ),
                ),
                 SizedBox(height: 30.0,)
              ],
            )])
              
          ),
              
      )
    );
  }
}