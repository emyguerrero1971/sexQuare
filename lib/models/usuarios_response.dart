// To parse this JSON data, do
//
//     final usuariosResponse = usuariosResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

UsuariosResponse usuariosResponseFromJson(String str) => UsuariosResponse.fromMap(json.decode(str));

class UsuariosResponse {
    UsuariosResponse({
        required this.usuarios,
    });

    List<Usuario> usuarios;

    factory UsuariosResponse.fromJson(String str) => UsuariosResponse.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory UsuariosResponse.fromMap(Map<String, dynamic> json) => UsuariosResponse(
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
    );
}