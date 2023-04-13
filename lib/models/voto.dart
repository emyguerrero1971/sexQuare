class Voto {
  Voto({
      required this.id,
      required this.candidato,
      required this.usuario,
      required this.proceso,
      required this.lat,
      required this.lng,
      required this.referente,
      required this.estado,

  });

  String id;
  String candidato;
  String usuario;
  String proceso;
  double lat;
  double lng;
  String referente;
  bool estado;

  factory Voto.fromMap(Map<String, dynamic> json) => Voto(
    id: json.containsKey('id') ? json['id'] : 'no-id',
    candidato: json.containsKey('candidato') ? json['candidato'] : 'no-candidato',
    usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
    proceso: json.containsKey('proceso') ? json['proceso'] : 'no-proceso',
    lat: json.containsKey('lat') ? json['lat'] : 0.0,
    lng: json.containsKey('lon') ? json['lon'] : 0.0,
    referente: json.containsKey('referente') ? json['referente'] : 'no-referente',
    estado: json.containsKey('estado') ? json['estado'] : false,
  );

  factory Voto.fromJson(Map<String, dynamic> json) => Voto(
    id: json.containsKey('id') ? json['id'] : 'no-id',
    candidato: json.containsKey('candidato') ? json['candidato'] : 'no-candidato',
    usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
    proceso: json.containsKey('proceso') ? json['proceso'] : 'no-proceso',
    lat: json.containsKey('lat') ? json['lat'] : 0.0,
    lng: json.containsKey('lon') ? json['lon'] : 0.0,
    referente: json.containsKey('referente') ? json['referente'] : 'no-referente',
    estado: json.containsKey('estado') ? json['estado'] : false,
  );
}