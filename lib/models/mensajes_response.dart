// To parse this JSON data, do
//
//     final mensajesResponse = mensajesResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

MensajesResponse mensajesResponseFromJson(String str) => MensajesResponse.fromJson(json.decode(str));

class MensajesResponse {
    MensajesResponse({
        required this.mensajes,
    });

    List<Mensaje> mensajes;

    // factory ProcesosResponse.fromJson(String str) => ProcesosResponse.fromMap(json.decode(str));
    factory MensajesResponse.fromJson(Map<String, dynamic> json) => MensajesResponse(
        mensajes: List<Mensaje>.from(json["mensajes"].map((x) => Mensaje.fromJson(x))),
    );

    factory MensajesResponse.fromMap(Map<String, dynamic> json) => MensajesResponse(
        mensajes: List<Mensaje>.from(json["mensajes"].map((x) => Mensaje.fromMap(x))),
    );
}