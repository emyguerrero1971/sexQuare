// To parse this JSON data, do
//
//     final candidatosResponse = candidatosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

CandidatosResponse candidatosResponseFromJson(String str) => CandidatosResponse.fromMap(json.decode(str));

class CandidatosResponse {
    CandidatosResponse({
        required this.candidatos,
    });

    List<Candidato> candidatos;

    factory CandidatosResponse.fromJson(String str) => CandidatosResponse.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory CandidatosResponse.fromMap(Map<String, dynamic> json) => CandidatosResponse(
        candidatos: List<Candidato>.from(json["candidatos"].map((x) => Candidato.fromMap(x))),
    );
}