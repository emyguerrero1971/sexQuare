// To parse this JSON data, do
//
//     final procesosResponse = procesosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

ProcesosResponse procesosResponseFromJson(String str) => ProcesosResponse.fromJson(json.decode(str));

class ProcesosResponse {
    ProcesosResponse({
        required this.procesos,
    });

    List<Proceso> procesos;

    // factory ProcesosResponse.fromJson(String str) => ProcesosResponse.fromMap(json.decode(str));
    factory ProcesosResponse.fromJson(Map<String, dynamic> json) => ProcesosResponse(
        procesos: List<Proceso>.from(json["procesos"].map((x) => Proceso.fromJson(x))),
    );

    factory ProcesosResponse.fromMap(Map<String, dynamic> json) => ProcesosResponse(
        procesos: List<Proceso>.from(json["procesos"].map((x) => Proceso.fromMap(x))),
    );
}
