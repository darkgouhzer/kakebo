import 'dart:convert';

IngresosEgresosModel ingresosEgresosFromJson(String str) =>
    IngresosEgresosModel.fromJson(json.decode(str));

String ingresosEgresosToJson(IngresosEgresosModel data) =>
    json.encode(data.toJson());

class IngresosEgresosModel {
  int id;
  String categoria;
  double monto;
  String concepto;
  String fecha;
  String tipo;

  IngresosEgresosModel({
    this.id,
    this.categoria,
    this.monto,
    this.concepto,
    this.fecha,
    this.tipo,
  });

  factory IngresosEgresosModel.fromJson(Map<String, dynamic> json) =>
      IngresosEgresosModel(
        id: json["id"],
        categoria: json["categoria"],
        monto: json["monto"].toDouble(),
        concepto: json["concepto"],
        fecha: json["fecha"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoria": categoria,
        "monto": monto,
        "concepto": concepto,
        "fecha": fecha,
        "tipo": tipo,
      };
}
