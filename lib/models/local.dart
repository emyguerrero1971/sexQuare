import 'dart:convert';
import 'package:sexquare/models/models.dart';

class Local {
  Local({
    required this.id,
    required this.boolEstado,
    required this.dblLatitud,
    required this.dblLongitud,
    required this.entHabitaciones,
    required this.imgLocal,
    required this.textAmbito,
    required this.textCelular,
    required this.textCelular2,
    required this.textCelular3,
    required this.textDescripcion,
    required this.textDireccion,
    required this.textEmail,
    required this.textEmail2,
    required this.selCategoria,
    required this.selTipo,
    // required this.ciudad,
    // required this.provincia,
    // required this.pais,
    required this.usuario,
  });

  String id;
  bool boolEstado;
  double dblLatitud;
  double dblLongitud;
  int entHabitaciones;
  String imgLocal;
  String textAmbito;
  String textCelular;
  String textCelular2;
  String textCelular3;
  String textDescripcion;
  String textDireccion;
  String textEmail;
  String textEmail2;
  String selCategoria;
  String selTipo;
  // Ciudad ciudad;
  // Provincia provincia;
  // Pais pais;
  Usuario usuario;

  factory Local.fromMap(Map<String, dynamic> json) => Local(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
    dblLatitud: json.containsKey('dblLatitud') ? json['dblLatitud'] : 0.0,
    dblLongitud: json.containsKey('dblLongitud') ? json['dblLongitud'] : 0.0,
    imgLocal: json.containsKey('imgLocal') ? json['imgLocal'] : null,
    entHabitaciones: json.containsKey('entHabitaciones') ? json['entHabitaciones'] : 0,
    textAmbito: json.containsKey('textAmbito') ? json['textAmbito'] : 'no-ambito',
    textCelular: json.containsKey('textCelular') ? json['textCelular'] : 'no-celular',
    textCelular2: json.containsKey('textCelular2') ? json['textCelular2'] : 'no-celular',
    textCelular3: json.containsKey('textCelular3') ? json['textCelular3'] : 'no-celular',
    textDescripcion: json.containsKey('textDescripcion') ? json['textDescripcion'] : 'no-descripcion',
    textDireccion: json.containsKey('textDireccion') ? json['textDireccion'] : 'no-direccion',
    textEmail: json.containsKey('textEmail') ? json['textEmail'] : 'no-email',
    textEmail2: json.containsKey('textEmail2') ? json['textEmail2'] : 'no-email',
    selCategoria: json.containsKey('selCategoria') ? json['selCategoria'] : 'no-categoria',
    selTipo: json.containsKey('selTipo') ? json['selTipo'] : 'no-tipo',
    usuario: Usuario.fromJson(
        json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
  );

  factory Local.fromJson(Map<String, dynamic> json) => Local(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
    dblLatitud: json.containsKey('dblLatitud') ? json['dblLatitud'] : 0.0,
    dblLongitud: json.containsKey('dblLongitud') ? json['dblLongitud'] : 0.0,
    entHabitaciones: json.containsKey('entHabitaciones') ? json['entHabitaciones'] : 0,
    imgLocal: json.containsKey('imgLocal') ? json['imgLocal'] : null,
    textAmbito: json.containsKey('textAmbito') ? json['textAmbito'] : 'no-ambito',
    textCelular: json.containsKey('textCelular') ? json['textCelular'] : 'no-celular',
    textCelular2: json.containsKey('textCelular2') ? json['textCelular2'] : 'no-celular',
    textCelular3: json.containsKey('textCelular3') ? json['textCelular3'] : 'no-celular',
    textDescripcion: json.containsKey('textDescripcion') ? json['textDescripcion'] : 'no-descripcion',
    textDireccion: json.containsKey('textDireccion') ? json['textDireccion'] : 'no-direccion',
    textEmail: json.containsKey('textEmail') ? json['textEmail'] : 'no-email',
    textEmail2: json.containsKey('textEmail2') ? json['textEmail2'] : 'no-email',
    selCategoria: json.containsKey('selCategoria') ? json['selCategoria'] : 'no-categoria',
    selTipo: json.containsKey('selTipo') ? json['selTipo'] : 'no-tipo',
    usuario: Usuario.fromJson(
        json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'boolEstado': boolEstado,
    'dblLatitud': dblLatitud,
    'dblLongitud': dblLongitud,
    'entHabitaciones': entHabitaciones,
    'imgLocal': imgLocal,
    'textAmbito': textAmbito,
    'textCelular': textCelular,
    'textCelular2': textCelular2,
    'textCelular3': textCelular3,
    'textDescripcion': textDescripcion,
    'textDireccion': textDireccion,
    'textEmail': textEmail,
    'textEmail2': textEmail2,
    'selCategoria': selCategoria,
    'selTipo': selTipo,
    'usuario': usuario
  };

  String toJson() => json.encode(toMap());

  Local copy() => Local(
    id: id,
    boolEstado: boolEstado,
    dblLatitud: dblLatitud,
    dblLongitud: dblLongitud,
    entHabitaciones: entHabitaciones,
    imgLocal: imgLocal,
    textAmbito: textAmbito,
    textCelular: textCelular,
    textCelular2: textCelular2,
    textCelular3: textCelular3,
    textDescripcion: textDescripcion,
    textDireccion: textDireccion,
    textEmail: textEmail,
    textEmail2: textEmail2,
    selCategoria: selCategoria,
    selTipo: selTipo,
    usuario: usuario,
  );
}
