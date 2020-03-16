
import 'package:flutter/material.dart';

import 'db_provider.dart';
import 'package:kakebo/src/models/ingresos_egresos_model.dart';

class MovimientosInfo with ChangeNotifier{

  List<IngresosEgresosModel> movimientos = List<IngresosEgresosModel>();
  obtenerMovimientos() async {
     movimientos = await DBProvider.db.getTodosMov();
     notifyListeners();
  }

  agregarMoviento( IngresosEgresosModel mov ) async{
    await DBProvider.db.nuevoMov(mov);
    obtenerMovimientos();
    notifyListeners();
  }

  borrarMovimiento( int id ) async {
    await DBProvider.db.deleteMov(id);
    obtenerMovimientos()();
     notifyListeners();
  }

  borrarMovTODOS() async {
    
    await DBProvider.db.deleteAll();
    obtenerMovimientos()();
     notifyListeners();
  }
}