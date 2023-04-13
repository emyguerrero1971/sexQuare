// To parse this JSON data, do
//
//     final instalacionesResponse = instalacionesResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

InstalacionesResponse instalacionesResponseFromJson(String str) => InstalacionesResponse.fromJson(json.decode(str));

class InstalacionesResponse {
    InstalacionesResponse({
        required this.instalaciones,
    });

    List<Instalacion> instalaciones;

    factory InstalacionesResponse.fromJson(Map<String, dynamic> json) => InstalacionesResponse(
        instalaciones: List<Instalacion>.from(json["instalaciones"].map((x) => Instalacion.fromJson(x))),
    );

    factory InstalacionesResponse.fromMap(Map<String, dynamic> json) => InstalacionesResponse(
        instalaciones: List<Instalacion>.from(json["instalaciones"].map((x) => Instalacion.fromMap(x))),
    );
}