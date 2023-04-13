class Candidato {
  Candidato({
    required this.id,
    required this.nombre,
    required this.nacionalidad,
    required this.lugarNacimiento,
    required this.saludo,
    required this.genero,
    required this.color,
    required this.mensajes,
    required this.fotos,
    required this.views,
    required this.likes,
    required this.votosNac,
    required this.votosPro,
    required this.votosMun,
    required this.votosLoc,
    required this.votos,
    required this.img,
    required this.proceso,
    required this.catastro,
    required this.usuario,

  });

  String id;
  String nombre;
  String nacionalidad;
  String lugarNacimiento;
  String saludo;
  String genero;
  String color;
  int mensajes;
  int fotos;
  int views;
  int likes;
  int votosNac;
  int votosPro;
  int votosMun;
  int votosLoc;
  int votos;
  String img;
  String proceso;
  String catastro;
  String usuario;

  factory Candidato.fromMap(Map<String, dynamic> json) => Candidato(
        id: json.containsKey('id') ? json['id'] : 'no-id',
        nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
        nacionalidad: json.containsKey('nacionalidad') ? json['nacionalidad'] : 'no-nacionalidad',
        lugarNacimiento: json.containsKey('lugarNacimiento') ? json['lugarNacimiento'] : 'no-lugarNacimiento',
        saludo: json.containsKey('saludo') ? json['saludo'] : 'no-saludo',
        genero: json.containsKey('genero') ? json['genero'] : 'no-genero',
        color: json.containsKey('color') ? json['color'] : 'no-color',
        mensajes: json.containsKey('mensajes') ? json['mensajes'] : 0,
        fotos: json.containsKey('fotos') ? json['fotos'] : 0,
        views: json.containsKey('views') ? json['views'] : 0,
        likes: json.containsKey('likes') ? json['likes'] : 0,
        votosNac: json.containsKey('votosNac') ? json['votosNac'] : 0,
        votosPro: json.containsKey('votosPro') ? json['votosPro'] : 0,
        votosMun: json.containsKey('votosMun') ? json['votosMun'] : 0,
        votosLoc: json.containsKey('votosLoc') ? json['votosLoc'] : 0,
        votos: json.containsKey('votos') ? json['votos'] : 0,
        img: json.containsKey('img') ? json['img'] : 'no-img',
        proceso: json.containsKey('proceso') ? json['proceso'] : 'no-proceso',
        catastro: json.containsKey('catastro') ? json['catastro'] : 'no-catastro',
        usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
        
      );

  factory Candidato.fromJson(Map<String, dynamic> json) => Candidato(
       id: json.containsKey('id') ? json['id'] : 'no-id',
        nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
        nacionalidad: json.containsKey('nacionalidad') ? json['nacionalidad'] : 'no-nacionalidad',
        lugarNacimiento: json.containsKey('lugarNacimiento') ? json['lugarNacimiento'] : 'no-lugarNacimiento',
        saludo: json.containsKey('saludo') ? json['saludo'] : 'no-saludo',
        genero: json.containsKey('genero') ? json['genero'] : 'no-genero',
        color: json.containsKey('color') ? json['color'] : 'no-color',
        mensajes: json.containsKey('mensajes') ? json['mensajes'] : 0,
        fotos: json.containsKey('fotos') ? json['fotos'] : 0,
        views: json.containsKey('views') ? json['views'] : 0,
        likes: json.containsKey('likes') ? json['likes'] : 0,
        votosNac: json.containsKey('votosNac') ? json['votosNac'] : 0,
        votosPro: json.containsKey('votosPro') ? json['votosPro'] : 0,
        votosMun: json.containsKey('votosMun') ? json['votosMun'] : 0,
        votosLoc: json.containsKey('votosLoc') ? json['votosLoc'] : 0,
        votos: json.containsKey('votos') ? json['votos'] : 0,
        img: json.containsKey('img') ? json['img'] : 'no-img',
        proceso: json.containsKey('proceso') ? json['proceso'] : 'no-proceso',
        catastro: json.containsKey('catastro') ? json['catastro'] : 'no-catastro',
        usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
      );
}
