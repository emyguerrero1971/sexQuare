import 'package:sexquare/models/models.dart';

class Cambio {
  Cambio({
    required this.id,
    required this.rol,
    required this.referencia,
    required this.valor,
    required this.estado,
    required this.administrador,
    required this.usuario,
    required this.fecha,
  });

  String id;
  String rol;
  String referencia;
  int valor;
  bool estado;
  String administrador;
  Usuario usuario;
  String fecha;

  factory Cambio.fromMap(Map<String, dynamic> json) => Cambio(
        id: json.containsKey('_id') ? json['_id'] : 'no-id',
        rol: json.containsKey('rol') ? json['rol'] : 'no-rol',
        referencia: json.containsKey('referencia')
            ? json['referencia']
            : 'no-referencia',
        valor: json.containsKey('valor') ? json['valor'] : 0,
        estado: json.containsKey('estado') ? json['estado'] : false,
        administrador: json.containsKey('administrador')
            ? json['administrador']
            : 'no-administrador',
        usuario: Usuario.fromJson(
            json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
        fecha: json.containsKey('fecha') ? json['fecha'] : 'no-fecha',
      );

  factory Cambio.fromJson(Map<String, dynamic> json) => Cambio(
        id: json.containsKey('_id') ? json['_id'] : 'no-id',
        rol: json.containsKey('rol') ? json['rol'] : 'no-rol',
        referencia: json.containsKey('referencia')
            ? json['referencia']
            : 'no-referencia',
        valor: json.containsKey('valor') ? json['valor'] : 0,
        estado: json.containsKey('estado') ? json['estado'] : false,
        administrador: json.containsKey('administrador')
            ? json['administrador']
            : 'no-administrador',
        usuario: Usuario.fromJson(
            json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
        fecha: json.containsKey('fecha') ? json['fecha'] : 'no-fecha',
      );
}
