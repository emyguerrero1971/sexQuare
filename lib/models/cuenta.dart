class Cuenta {
  Cuenta({
    required this.id,
    required this.tipo,
    required this.numero,
    required this.banco,
    required this.titular,
    required this.pais,
    required this.administrador,
    required this.estado,
  });

  String id;
  String tipo;
  String numero;
  String banco;
  String titular;
  String pais;
  String administrador;
  bool estado;


  factory Cuenta.fromMap(Map<String, dynamic> json) => Cuenta(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    tipo: json.containsKey('tipo') ? json['tipo']: 'no-tipo',
    numero: json.containsKey('numero') ? json['numero'] : 'no-numero',
    banco: json.containsKey('banco') ? json['banco'] : 'no-banco',
    titular: json.containsKey('titular') ? json['titular'] : 'no-titular',
    pais: json.containsKey('pais') ? json['pais'] : 'no-pais',
    administrador: json.containsKey('administrador') ? json['administrador'] : 'no-administrador',
    estado: json.containsKey('estado') ? json['estado'] : false,
  );

  factory Cuenta.fromJson(Map<String, dynamic> json) => Cuenta(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    tipo: json.containsKey('tipo') ? json['tipo']: 'no-tipo',
    numero: json.containsKey('numero') ? json['numero'] : 'no-numero',
    banco: json.containsKey('banco') ? json['banco'] : 'no-banco',
    titular: json.containsKey('titular') ? json['titular'] : 'no-titular',
    pais: json.containsKey('pais') ? json['pais'] : 'no-pais',
    administrador: json.containsKey('administrador') ? json['administrador'] : 'no-administrador',
    estado: json.containsKey('estado') ? json['estado'] : false,
  );
}
