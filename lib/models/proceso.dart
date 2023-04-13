class Proceso {
  Proceso({
    required this.id,
    required this.descripcion,
    this.pais,
    this.provincia,
    this.ciudad,
    this.local,
    required this.ambito
  });

  String id;
  String descripcion;
  Object? pais;
  Object? provincia;
  Object? ciudad;
  Object? local;
  String ambito;


  factory Proceso.fromMap(Map<String, dynamic> json) => Proceso(
    id: json.containsKey('id') ? json['id'] : 'no-id',
    descripcion: json.containsKey('descripcion') ? json['descripcion'] : 'no-descripcion',
    pais: json.containsKey('pais') ? json['pais'] : 'no-pais',
    provincia: json.containsKey('provincia') ? json['provincia'] : 'no-provincia',
    ciudad: json.containsKey('ciudad') ? json['ciudad'] : 'no-ciudad',
    local: json.containsKey('local') ? json['local'] : 'no-local',
    ambito: json.containsKey('ambito') ? json['ambito'] : 'no-ambito',
  );

  factory Proceso.fromJson(Map<String, dynamic> json) => Proceso(
    id: json.containsKey('id') ? json['id'] : 'no-id',
    descripcion: json.containsKey('descripcion') ? json['descripcion'] : 'no-descripcion',
    pais: json.containsKey('pais') ? json['pais'] : 'no-pais',
    provincia: json.containsKey('provincia') ? json['provincia'] : 'no-provincia',
    ciudad: json.containsKey('ciudad') ? json['ciudad'] : 'no-ciudad',
    local: json.containsKey('local') ? json['local'] : 'no-local',
    ambito: json.containsKey('ambito') ? json['ambito'] : 'no-ambito',
  );
}