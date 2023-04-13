// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.dispositivoId,
    required this.numcel,
    required this.nombre,
    required this.online,
    required this.rol,
    required this.genero,
    required this.edad,
    required this.etnia,
    required this.religion,
    required this.paisId,
    required this.provinciaId,
    required this.ciudadId,
    required this.img,
    required this.tokenDispositivoId,
    required this.app,
    required this.estado,
    required this.status,
    required this.fechaRegistro,
    required this.fechaCaducidad,
    required this.administradorId,
    required this.uid,
    this.localId,
  });

  String dispositivoId;
  String numcel;
  String nombre;
  bool online;
  String rol;
  String genero;
  String edad;
  String etnia;
  String religion;
  String paisId;
  String provinciaId;
  String ciudadId;
  String img;
  String tokenDispositivoId;
  String app;
  bool estado;
  String status;
  String fechaRegistro;
  String fechaCaducidad;
  String administradorId;
  String uid;
  String? localId;

  Map<String, dynamic> toJson() => {
    "dispositivoId": dispositivoId,
    "numcel": numcel,
    "nombre": nombre,
    "online": online,
    "rol": rol,
    "genero": genero,
    "edad": edad,
    "etnia": etnia,
    "religion": religion,
    "paisId": paisId,
    "provinciaId": provinciaId,
    "ciudadId": ciudadId,
    "localId": localId,
    "img": img,
    "tokenDispositivoId": tokenDispositivoId,
    "app": app,
    "estado": estado,
    "status": status,
    "fechaRegistro": fechaRegistro,
    "fechaCaducidad": fechaCaducidad,
    "administradorId": administradorId,
    "uid": uid,
  };

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
    dispositivoId: json.containsKey('dispositivoId') ? json['dispositivoId'] : 'no-dispositivoId',
    numcel: json.containsKey('numcel') ? json['numcel'] : 'no-numcel',
    nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
    online: json.containsKey('online') ? json['online'] : false,
    rol: json.containsKey('rol') ? json['rol'] : 'no-rol',
    genero: json.containsKey('genero') ? json['genero'] : 'no-genero',
    edad: json.containsKey('edad') ? json['edad'] : 'no-edad',
    etnia: json.containsKey('etnia') ? json['etnia'] : 'no-etnia',
    religion: json.containsKey('religion') ? json['religion'] : 'no-religion',
    paisId: json.containsKey('paisId') ? json['paisId'] : 'no-paisId',
    provinciaId: json.containsKey('provinciaId') ? json['provinciaId'] : 'no-provinciaId',
    ciudadId: json.containsKey('ciudadId') ? json['ciudadId'] : 'no-ciudadId',
    localId: json.containsKey('localId') ? json['localId'] : 'no-localId',
    img: json.containsKey('img') ? json['img'] : 'no-img',
    tokenDispositivoId: json.containsKey('tokenDispositivoId') ? json['tokenDispositivoId'] : 'no-tokenDispositivoId',
    app: json.containsKey('app') ? json['app'] : 'no-app',
    estado: json.containsKey('estado') ? json['estado'] : false,
    status: json.containsKey('status') ? json['status'] : 'no-status',
    fechaRegistro: json.containsKey('fechaRegistro') ? json['fechaRegistro'] : 'no-fechaRegistro',
    fechaCaducidad: json.containsKey('fechaCaducidad') ? json['fechaCaducidad'] : 'no-fechaCaducidad',
    administradorId: json.containsKey('administradorId') ? json['administradorId'] : 'no-administradorId',
    uid: json.containsKey('uid') ? json['uid'] : 'no-uid',
  );

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    dispositivoId: json.containsKey('dispositivoId') ? json['dispositivoId'] : 'no-dispositivoId',
    numcel: json.containsKey('numcel') ? json['numcel'] : 'no-numcel',
    nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
    online: json.containsKey('online') ? json['online'] : false,
    rol: json.containsKey('rol') ? json['rol'] : 'no-rol',
    genero: json.containsKey('genero') ? json['genero'] : 'no-genero',
    edad: json.containsKey('edad') ? json['edad'] : 'no-edad',
    etnia: json.containsKey('etnia') ? json['etnia'] : 'no-etnia',
    religion: json.containsKey('religion') ? json['religion'] : 'no-religion',
    paisId: json.containsKey('paisId') ? json['paisId'] : 'no-paisId',
    provinciaId: json.containsKey('provinciaId') ? json['provinciaId'] : 'no-provinciaId',
    ciudadId: json.containsKey('ciudadId') ? json['ciudadId'] : 'no-ciudadId',
    localId: json.containsKey('localId') ? json['localId'] : 'no-localId',
    img: json.containsKey('img') ? json['img'] : 'no-img',
    tokenDispositivoId: json.containsKey('tokenDispositivoId') ? json['tokenDispositivoId'] : 'no-tokenDispositivoId',
    app: json.containsKey('app') ? json['app'] : 'no-app',
    estado: json.containsKey('estado') ? json['estado'] : false,
    status: json.containsKey('status') ? json['status'] : 'no-status',
    fechaRegistro: json.containsKey('fechaRegistro') ? json['fechaRegistro'] : 'no-fechaRegistro',
    fechaCaducidad: json.containsKey('fechaCaducidad') ? json['fechaCaducidad'] : 'no-fechaCaducidad',
    administradorId: json.containsKey('administradorId') ? json['administradorId'] : 'no-administradorId',
    uid: json.containsKey('uid') ? json['uid'] : 'no-uid',
  );
}
