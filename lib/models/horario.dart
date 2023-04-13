import 'dart:convert';
import 'package:sexquare/models/models.dart';

class Horario {
  Horario({
    required this.id,
    required this.boolEstado,
    this.imgHorario,
    required this.textDia,
    required this.textPrimerFin,
    required this.textPrimerIni,
    required this.textSegundoFin,
    required this.textSegundoIni,
    required this.usuario,
  });

  String id;
  bool boolEstado;
  String? imgHorario;
  String textDia;
  String textPrimerFin;
  String textPrimerIni;
  String textSegundoFin;
  String textSegundoIni;
  Usuario usuario;

  factory Horario.fromMap(Map<String, dynamic> json) => Horario(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
    imgHorario: json.containsKey('imgHorario')
            ? json['imgHorario']
            : null,
    textDia: json.containsKey('textDia') ? json['textDia'] : 'no-textDia',
    textPrimerFin: json.containsKey('textPrimerFin') ? json['textPrimerFin'] : 'no-textPrimerFin',
    textPrimerIni: json.containsKey('textPrimerIni') ? json['textPrimerIni'] : 'no-textPrimerIni',
    textSegundoFin: json.containsKey('textSegundoFin') ? json['textSegundoFin'] : 'no-textSegundoFin',
    textSegundoIni: json.containsKey('textSegundoIni') ? json['textSegundoIni'] : 'no-textSegundoIni',
    usuario: Usuario.fromJson(
        json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
  );

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
    imgHorario: json.containsKey('imgHorario')
            ? json['imgHorario']
            : null,
    textDia: json.containsKey('textDia') ? json['textDia'] : 'no-textDia',
    textPrimerFin: json.containsKey('textPrimerFin') ? json['textPrimerFin'] : 'no-textPrimerFin',
    textPrimerIni: json.containsKey('textPrimerIni') ? json['textPrimerIni'] : 'no-textPrimerIni',
    textSegundoFin: json.containsKey('textSegundoFin') ? json['textSegundoFin'] : 'no-textSegundoFin',
    textSegundoIni: json.containsKey('textSegundoIni') ? json['textSegundoIni'] : 'no-textSegundoIni',
    usuario: Usuario.fromJson(
        json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'boolEstado': boolEstado,
    'imgHorario': imgHorario,
    'textDia': textDia,
    'textPrimerFin': textPrimerFin,
    'textPrimerIni': textPrimerIni,
    'textSegundoFin': textSegundoFin,
    'textSegundoIni': textSegundoIni,
    'usuario': usuario
  };

  String toJson() => json.encode(toMap());

  Horario copy() => Horario(
    id: id,
    boolEstado: boolEstado,
    imgHorario: imgHorario,
    textDia: textDia,
    textPrimerFin: textPrimerFin,
    textPrimerIni: textPrimerIni,
    textSegundoFin: textSegundoFin,
    textSegundoIni: textSegundoIni,
    usuario: usuario,
  );
}
