// To parse this JSON data, do
//
//     final lugarCoordenadasResponse = lugarCoordenadasResponseFromJson(jsonString);

import 'dart:convert';

LugarPorCoordenadasResponse lugarPorCoordenadasResponseFromJson(String str) =>
    LugarPorCoordenadasResponse.fromJson(json.decode(str));

class LugarPorCoordenadasResponse {
  LugarPorCoordenadasResponse({
    required this.id,
    required this.nombre,
    this.codtel,
    this.cctld,
    this.bandera,
    this.ambito,
    this.provincias,
    this.ciudades,
    this.locales,
    this.votantes,
    this.visible,
    this.estado,
  });

  String id;
  String nombre;
  String? codtel;
  String? cctld;
  String? bandera;
  String? ambito;
  String? provincias;
  String? ciudades;
  String? locales;
  int? votantes;
  bool? visible;
  bool? estado;

  factory LugarPorCoordenadasResponse.fromJson(Map<String, dynamic> json) =>
      LugarPorCoordenadasResponse(
        id: json["id"],
        nombre: json["nombre"],
        codtel: json["codtel"],
        cctld: json["cctld"],
        bandera: json["bandera"],
        ambito: json["ambito"],
        provincias: json["provincias"],
        ciudades: json["ciudades"],
        locales: json["locales"],
        votantes: json["votantes"],
        visible: json["visible"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "codtel": codtel,
        "cctld": cctld,
        "bandera": bandera,
        "ambito": ambito,
        "provincias": provincias,
        "ciudades": ciudades,
        "locales": locales,
        "votantes": votantes,
        "visible": visible,
        "estado": estado,
      };
}
