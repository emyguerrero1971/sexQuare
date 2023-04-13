// To parse this JSON data, do
//
//     final stringResponse = stringResponseFromJson(jsonString);

import 'dart:convert';

StringResponse stringResponseFromJson(String str) => StringResponse.fromJson(json.decode(str));

String stringResponseToJson(StringResponse data) => json.encode(data.toJson());

class StringResponse {
    StringResponse({
        required this.texto,
        this.texto1,
    });

    String texto;
    String? texto1;

    factory StringResponse.fromJson(Map<String, dynamic> json) => StringResponse(
        texto: json.containsKey('texto') ? json['texto'] : 'no-texto',
        texto1: json.containsKey('texto1') ? json['texto1'] : 'no-texto1',
    );

    Map<String, dynamic> toJson() => {
        "texto": texto,
        "texto1": texto1,
    };
}
