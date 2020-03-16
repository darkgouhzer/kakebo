import 'dart:io';

import 'package:kakebo/src/models/ingresos_egresos_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';




class DBProvider {

  static Database _database; 
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if ( _database != null ) return _database;

    _database = await initDB();
    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'KakeboDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE mov_in_out ('
          ' id INTEGER PRIMARY KEY,'
          ' categoria TEXT,'
          ' monto REAL,'
          ' concepto TEXT,'
          ' fecha TEXT,'
          ' tipo TEXT'
          ')'
        );
      }
    
    );

  }

  // CREAR Registros
  nuevoMovRaw( IngresosEgresosModel nuevoMovimiento ) async {

    final db  = await database;

    final res = await db.rawInsert(
      "INSERT Into mov_in_out (id, categoria, monto, concepto, fecha, tipo) "
      "VALUES ( ${ nuevoMovimiento.id }, '${ nuevoMovimiento.categoria }', '${ nuevoMovimiento.monto }', " +
      "'${ nuevoMovimiento.concepto }', '${ nuevoMovimiento.fecha}', '${nuevoMovimiento.tipo}')"
    );
    return res;

  }

  nuevoMov( IngresosEgresosModel nuevoMovimiento ) async {

    final db  = await database;
    final res = await db.insert('mov_in_out',  nuevoMovimiento.toJson() );
    return res;
  }


  // SELECT - Obtener información
  Future<IngresosEgresosModel> getMovById( int id ) async {

    final db  = await database;
    final res = await db.query('mov_in_out', where: 'id = ?', whereArgs: [id]  );
    return res.isNotEmpty ? IngresosEgresosModel.fromJson( res.first ) : null;

  }

  Future<List<IngresosEgresosModel>> getTodosMov() async {

    final db  = await database;
    final res = await db.query('mov_in_out');

    List<IngresosEgresosModel> list = res.isNotEmpty 
                              ? res.map( (c) => IngresosEgresosModel.fromJson(c) ).toList()
                              : [];
    return list;
  }

  Future<List<IngresosEgresosModel>> getMovPorTipo( String tipo ) async {

    final db  = await database;
    final res = await db.rawQuery("SELECT * FROM mov_in_out WHERE tipo='$tipo'");

    List<IngresosEgresosModel> list = res.isNotEmpty 
                              ? res.map( (c) => IngresosEgresosModel.fromJson(c) ).toList()
                              : [];
    return list;
  }

  // Actualizar Registros
  Future<int> updateMov( IngresosEgresosModel nuevoScan ) async {

    final db  = await database;
    final res = await db.update('mov_in_out', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id] );
    return res;

  }

  // Eliminar registros
  Future<int> deleteMov( int id ) async {

    final db  = await database;
    final res = await db.delete('mov_in_out', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM mov_in_out');
    return res;
  }
}

