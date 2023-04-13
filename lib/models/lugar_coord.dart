class LugarCoord {
  LugarCoord({
    required this.id,
    required this.codtel,
    required this.nombre,
  });

  String id;
  String codtel;
  String nombre;

  factory LugarCoord.fromMap(Map<String, dynamic> json) => LugarCoord(
        id: json.containsKey('id') ? json['id'] : 'no-id',
        codtel: json.containsKey('codtel') ? json['codtel'] : 'no-codtel',
        nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
      );
}