// To parse this JSON data, do
//
//     final candidatosResponse = candidatosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

CatastrosResponse catastrosResponseFromJson(String str) => CatastrosResponse.fromJson(json.decode(str));

class CatastrosResponse {
    CatastrosResponse({
        required this.catastros,
    });

    List<Catastro> catastros;

    // factory ProcesosResponse.fromJson(String str) => ProcesosResponse.fromMap(json.decode(str));
    factory CatastrosResponse.fromJson(Map<String, dynamic> json) => CatastrosResponse(
        catastros: List<Catastro>.from(json["catastros"].map((x) => Catastro.fromJson(x))),
    );

    factory CatastrosResponse.fromMap(Map<String, dynamic> json) => CatastrosResponse(
        catastros: List<Catastro>.from(json["catastros"].map((x) => Catastro.fromMap(x))),
    );
}