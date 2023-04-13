// To parse this JSON data, do
//
//     final habitacionesResponse = habitacionesResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

HabitacionesResponse habitacionesResponseFromJson(String str) => HabitacionesResponse.fromJson(json.decode(str));

class HabitacionesResponse {
    HabitacionesResponse({
        required this.habitaciones,
    });

    List<Habitacion> habitaciones;

    factory HabitacionesResponse.fromJson(Map<String, dynamic> json) => HabitacionesResponse(
        habitaciones: List<Habitacion>.from(json["habitaciones"].map((x) => Habitacion.fromJson(x))),
    );

    factory HabitacionesResponse.fromMap(Map<String, dynamic> json) => HabitacionesResponse(
        habitaciones: List<Habitacion>.from(json["habitaciones"].map((x) => Habitacion.fromMap(x))),
    );
}