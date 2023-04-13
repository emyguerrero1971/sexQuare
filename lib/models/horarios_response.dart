// To parse this JSON data, do
//
//     final horariosResponse = horariosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

HorariosResponse horariosResponseFromJson(String str) => HorariosResponse.fromJson(json.decode(str));

class HorariosResponse {
    HorariosResponse({
        required this.horarios,
    });

    List<Horario> horarios;

    factory HorariosResponse.fromJson(Map<String, dynamic> json) => HorariosResponse(
        horarios: List<Horario>.from(json["horarios"].map((x) => Horario.fromJson(x))),
    );

    factory HorariosResponse.fromMap(Map<String, dynamic> json) => HorariosResponse(
        horarios: List<Horario>.from(json["horarios"].map((x) => Horario.fromMap(x))),
    );
}