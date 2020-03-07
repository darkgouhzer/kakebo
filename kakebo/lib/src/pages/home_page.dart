import 'package:flutter/material.dart';
import 'package:kakebo/src/pages/registrar_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextStyle  style = TextStyle(fontSize: 35.0, color: Colors.white);

    return SafeArea(child: Scaffold(
          backgroundColor: Color(0xffE1E2E1),
          appBar: AppBar(
            backgroundColor: Color(0xff000051),
            title: Text("Kokebo"),
            ),
          body: Center(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 200.0,
                  child:RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
                      child: Text("Registrar", style: style),
                      color: Color(0xff1a237e),                    
                      onPressed: (){
                        final route = MaterialPageRoute(
                          builder: (context){
                            return RegistrarPage();
                          }
                          );
                        Navigator.push(context, route);
                      }
                  )
                ),
                SizedBox(height: 20.0,)
                ,
                 ButtonTheme(
                  minWidth: 200.0,
                  child:RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
                    child: Text("Historial", style:style),
                    color: Color(0xff1a237e),
                    onPressed: (){}
                  ),
                ),
                 SizedBox(height: 30.0,)
              ],
            )
              ),
      )
    );
  }
}