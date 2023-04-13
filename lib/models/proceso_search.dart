class ProcesoSearch {
  ProcesoSearch({
      required this.id,
      required this.descripcion,
      this.pais,
      this.provincia,
      this.ciudad,
      required this.ambito});

  String id;
  String descripcion;
  Object? pais;
  Object? provincia;
  Object? ciudad;
  String ambito;

  factory ProcesoSearch.fromMap(Map<String, dynamic> json) => ProcesoSearch(
        id: json.containsKey('id') ? json['id'] : 'no-id',
        descripcion: json.containsKey('descripcion') ? json['descripcion'] : 'no-descripcion',
        pais: json.containsKey('pais') ? json['pais'] : 'no-pais',
        provincia: json.containsKey('provincia') ? json['provincia'] : 'no-provincia',
        ciudad: json.containsKey('ciudad') ? json['ciudad'] : 'no-ciudad',
        ambito: json.containsKey('ambito') ? json['ambito'] : 'no-ambito',
      );
}
