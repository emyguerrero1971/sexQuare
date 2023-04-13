class Mensaje {
  Mensaje({
    required this.id,
    required this.descripcion,
    required this.tipo,
    required this.candidato,
    required this.usuario,
    required this.likes,
    required this.estado,
  });

  String id;
  String descripcion;
  String tipo;
  String candidato;
  String usuario;
  int likes;
  bool estado;

  factory Mensaje.fromMap(Map<String, dynamic> json) => Mensaje(
        id: json.containsKey('_id') ? json['_id'] : 'no-id',
        descripcion: json.containsKey('descripcion')
            ? json['descripcion']
            : 'no-descripcion',
        tipo: json.containsKey('tipo') ? json['tipo'] : 'no-tipo',
        candidato:
            json.containsKey('candidato') ? json['candidato'] : 'no-candidato',
        usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
        likes: json.containsKey('likes') ? json['likes'] : 0,
        estado: json.containsKey('estado') ? json['estado'] : false,
      );

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        id: json.containsKey('_id') ? json['_id'] : 'no-id',
        descripcion: json.containsKey('descripcion')
            ? json['descripcion']
            : 'no-descripcion',
        tipo: json.containsKey('tipo') ? json['tipo'] : 'no-tipo',
        candidato:
            json.containsKey('candidato') ? json['candidato'] : 'no-candidato',
        usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
        likes: json.containsKey('likes') ? json['likes'] : 0,
        estado: json.containsKey('estado') ? json['estado'] : false,
      );
}
