class Catastro {
  Catastro({
    required this.nombre,
    this.nacionalidad,
    this.lugarNacimiento,
    this.fechaNacimiento,
    this.estadoCivil,
    this.celular,
    this.celular2,
    this.email,
    this.signo,
    this.edad,
    this.genero,
    this.etnia,
    this.ojos,
    this.nariz,
    this.labios,
    this.cabello,
    this.altura,
    this.peso,
    this.piel,
    this.flor,
    this.gift,
    this.otroGift,
    this.medidas,
    this.contextura,
    this.caracter,
    this.idiomas,
    this.religion,
    this.estudios,
    this.profesion,
    this.color,
    this.saludo,
    this.facebook,
    this.instagram,
    this.youtube,
    this.twitter,
    this.likes,
    this.views,
    this.usuario,
  });

  String nombre;
  String? nacionalidad;
  String? lugarNacimiento;
  String? fechaNacimiento;
  String? estadoCivil;
  String? celular;
  String? celular2;
  String? email;
  String? signo;
  String? edad;
  String? genero;
  String? etnia;
  String? ojos;
  String? nariz;
  String? labios;
  String? cabello;
  String? altura;
  String? peso;
  String? piel;
  String? flor;
  String? gift;
  String? otroGift;
  String? medidas;
  String? contextura;
  String? caracter;
  String? idiomas;
  String? religion;
  String? estudios;
  String? profesion;
  String? color;
  String? saludo;
  String? facebook;
  String? instagram;
  String? youtube;
  String? twitter;
  int? likes;
  int? views;
  String? usuario;

  factory Catastro.fromMap(Map<String, dynamic> json) => Catastro(
        nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
        nacionalidad: json.containsKey('nacionalidad')
            ? json['nacionalidad']
            : 'no-nacionalidad',
        lugarNacimiento: json.containsKey('lugarNacimiento')
            ? json['lugarNacimiento']
            : 'no-lugarNacimiento',
        fechaNacimiento: json.containsKey('fechaNacimiento')
            ? json['fechaNacimiento']
            : 'no-fechaNacimiento',
        estadoCivil: json.containsKey('estadoCivil')
            ? json['estadoCivil']
            : 'no-estadoCivil',
        celular: json.containsKey('celular') ? json['celular'] : 'no-celular',
        celular2:
            json.containsKey('celular2') ? json['celular2'] : 'no-celular2',
        email: json.containsKey('email') ? json['email'] : 'no-email',
        signo: json.containsKey('signo') ? json['signo'] : 'no-signo',
        edad: json.containsKey('edad') ? json['edad'] : 'no-edad',
        genero: json.containsKey('genero') ? json['genero'] : 'no-genero',
        etnia: json.containsKey('etnia') ? json['etnia'] : 'no-etnia',
        ojos: json.containsKey('ojos') ? json['ojos'] : 'no-ojos',
        nariz: json.containsKey('nariz') ? json['nariz'] : 'no-nariz',
        labios: json.containsKey('labios') ? json['labios'] : 'no-labios',
        cabello: json.containsKey('cabello') ? json['cabello'] : 'no-cabello',
        altura: json.containsKey('altura') ? json['altura'] : 'no-altura',
        peso: json.containsKey('peso') ? json['peso'] : 'no-peso',
        piel: json.containsKey('piel') ? json['piel'] : 'no-piel',
        flor: json.containsKey('flor') ? json['flor'] : 'no-flor',
        gift: json.containsKey('gift') ? json['gift'] : 'no-gift',
        otroGift: json.containsKey('otroGift') ? json['otroGift'] : 'no-otroGift',
        medidas: json.containsKey('medidas') ? json['medidas'] : 'no-medidas',
        contextura: json.containsKey('contextura') ? json['contextura'] : 'no-contextura',
        caracter: json.containsKey('caracter') ? json['caracter'] : 'no-caracter',
        idiomas: json.containsKey('idiomas') ? json['idiomas'] : 'no-idiomas',
        religion:
            json.containsKey('religion') ? json['religion'] : 'no-religion',
        estudios:
            json.containsKey('estudios') ? json['estudios'] : 'no-estudios',
        profesion:
            json.containsKey('profesion') ? json['profesion'] : 'no-profesion',
        color: json.containsKey('color') ? json['color'] : 'no-color',
        saludo: json.containsKey('saludo') ? json['saludo'] : 'no-saludo',
        facebook:
            json.containsKey('facebook') ? json['facebook'] : 'no-facebook',
        instagram:
            json.containsKey('instagram') ? json['instagram'] : 'no-instagram',
        youtube: json.containsKey('youtube') ? json['youtube'] : 'no-youtube',
        twitter: json.containsKey('twitter') ? json['twitter'] : 'no-twitter',
        likes: json.containsKey('likes') ? json['likes'] : 0,
        views: json.containsKey('views') ? json['views'] : 0,
        usuario:
            json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
      );

  factory Catastro.fromJson(Map<String, dynamic> json) => Catastro(
        nombre: json.containsKey('nombre') ? json['nombre'] : 'no-nombre',
        nacionalidad: json.containsKey('nacionalidad')
            ? json['nacionalidad']
            : 'no-nacionalidad',
        lugarNacimiento: json.containsKey('lugarNacimiento')
            ? json['lugarNacimiento']
            : 'no-lugarNacimiento',
        fechaNacimiento: json.containsKey('fechaNacimiento')
            ? json['fechaNacimiento']
            : 'no-fechaNacimiento',
        estadoCivil: json.containsKey('estadoCivil')
            ? json['estadoCivil']
            : 'no-estadoCivil',
        celular: json.containsKey('celular') ? json['celular'] : 'no-celular',
        celular2:
            json.containsKey('celular2') ? json['celular2'] : 'no-celular2',
        email: json.containsKey('email') ? json['email'] : 'no-email',
        signo: json.containsKey('signo') ? json['signo'] : 'no-signo',
        edad: json.containsKey('edad') ? json['edad'] : 'no-edad',
        genero: json.containsKey('genero') ? json['genero'] : 'no-genero',
        etnia: json.containsKey('etnia') ? json['etnia'] : 'no-etnia',
        ojos: json.containsKey('ojos') ? json['ojos'] : 'no-ojos',
        nariz: json.containsKey('nariz') ? json['nariz'] : 'no-nariz',
        labios: json.containsKey('labios') ? json['labios'] : 'no-labios',
        cabello: json.containsKey('cabello') ? json['cabello'] : 'no-cabello',
        altura: json.containsKey('altura') ? json['altura'] : 'no-altura',
        peso: json.containsKey('peso') ? json['peso'] : 'no-peso',
        piel: json.containsKey('piel') ? json['piel'] : 'no-piel',
        flor: json.containsKey('flor') ? json['flor'] : 'no-flor',
        gift: json.containsKey('gift') ? json['gift'] : 'no-gift',
        otroGift: json.containsKey('otroGift') ? json['otroGift'] : 'no-otroGift',
        medidas: json.containsKey('medidas') ? json['medidas'] : 'no-medidas',
        contextura: json.containsKey('contextura') ? json['contextura'] : 'no-contextura',
        caracter: json.containsKey('caracter') ? json['caracter'] : 'no-caracter',
        idiomas: json.containsKey('idiomas') ? json['idiomas'] : 'no-idiomas',
        religion:
            json.containsKey('religion') ? json['religion'] : 'no-religion',
        estudios:
            json.containsKey('estudios') ? json['estudios'] : 'no-estudios',
        profesion:
            json.containsKey('profesion') ? json['profesion'] : 'no-profesion',
        color: json.containsKey('color') ? json['color'] : 'no-color',
        saludo: json.containsKey('saludo') ? json['saludo'] : 'no-saludo',
        facebook:
            json.containsKey('facebook') ? json['facebook'] : 'no-facebook',
        instagram:
            json.containsKey('instagram') ? json['instagram'] : 'no-instagram',
        youtube: json.containsKey('youtube') ? json['youtube'] : 'no-youtube',
        twitter: json.containsKey('twitter') ? json['twitter'] : 'no-twitter',
        likes: json.containsKey('likes') ? json['likes'] : 0,
        views: json.containsKey('views') ? json['views'] : 0,
        usuario:
            json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
      );
}
