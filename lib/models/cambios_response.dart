// To parse this JSON data, do
//
//     final cambiosResponse = cambiosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

CambiosResponse cambiosResponseFromJson(String str) => CambiosResponse.fromJson(json.decode(str));

class CambiosResponse {
    CambiosResponse({
        required this.cambios,
    });

    List<Cambio> cambios;

    factory CambiosResponse.fromJson(Map<String, dynamic> json) => CambiosResponse(
        cambios: List<Cambio>.from(json["cambios"].map((x) => Cambio.fromJson(x))),
    );

    factory CambiosResponse.fromMap(Map<String, dynamic> json) => CambiosResponse(
        cambios: List<Cambio>.from(json["cambios"].map((x) => Cambio.fromMap(x))),
    );
}