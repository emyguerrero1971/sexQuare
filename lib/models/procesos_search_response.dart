// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromMap(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

class ProcesosSearchResponse {
    ProcesosSearchResponse({
        required this.procesos,
    });

    List<ProcesoSearch> procesos;

    factory ProcesosSearchResponse.fromJson(String str) => ProcesosSearchResponse.fromMap(json.decode(str));

    factory ProcesosSearchResponse.fromMap(Map<String, dynamic> json) => ProcesosSearchResponse(
        procesos: List<ProcesoSearch>.from(json["procesos"].map((x) => ProcesoSearch.fromMap(x))),
    );
}