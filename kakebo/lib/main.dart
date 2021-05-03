import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:kakebo/src/pages/egresos_page.dart';
import 'package:kakebo/src/pages/guia_page.dart';
import 'package:kakebo/src/pages/home_page.dart';
import 'package:kakebo/src/pages/ingresos_page.dart';
import 'package:kakebo/src/pages/movimientos_page.dart';
import 'package:kakebo/src/pages/reportes_page.dart';
import 'package:kakebo/src/providers/movimientos_info.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final movimientos = context.watch<MovimientosInfo>();
    return ChangeNotifierProvider(
      create: (context) => MovimientosInfo(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', 'US'), // English
            const Locale('es', 'ES'),
          ],
          title: 'Material App',
          initialRoute: "/",
          routes: {
            '/': (BuildContext context) => HomePage(),
            IngresosPage.name: (BuildContext context) => IngresosPage(),
            EgresosPage.name: (BuildContext context) => EgresosPage(),
            MovimientosPage.name: (BuildContext context) => MovimientosPage(),
            ReportesPage.name: (BuildContext context) => ReportesPage(),
            GuiaPage.name: (BuildContext context) => GuiaPage(),
          }),
    );
  }
}
