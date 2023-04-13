// To parse this JSON data, do
//
//     final serviciosResponse = serviciosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

ServiciosResponse serviciosResponseFromJson(String str) => ServiciosResponse.fromMap(json.decode(str));

class ServiciosResponse {
    ServiciosResponse({
        required this.servicios,
    });

    List<Servicio> servicios;

    factory ServiciosResponse.fromJson(String str) => ServiciosResponse.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory ServiciosResponse.fromMap(Map<String, dynamic> json) => ServiciosResponse(
        servicios: List<Servicio>.from(json["servicios"].map((x) => Servicio.fromMap(x))),
    );
}