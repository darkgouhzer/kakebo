import 'package:flutter/material.dart';
import 'package:kakebo/src/pages/home_page.dart';
import 'package:kakebo/src/pages/registrar_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "/",
      routes: {
        '/'  :  ( BuildContext context ) => HomePage(),
        RegistrarPage.name : (BuildContext context) => RegistrarPage()
      }
    );
  }
}