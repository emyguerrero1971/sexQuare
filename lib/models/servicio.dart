class Servicio {
  Servicio({
    required this.compania,
    required this.valcompania,
    required this.vaginal,
    required this.valvaginal,
    required this.oral,
    required this.valoral,
    required this.anal,
    required this.valanal,
    required this.poses,
    required this.valposes,
    required this.hotshow,
    required this.valhotshow,
    required this.poledance,
    required this.valpoledance,
    required this.trajes,
    required this.valtrajes,
    required this.sextoys,
    required this.valsextoys,
    required this.fetiches,
    required this.valfetiches,
    required this.fantasias,
    required this.valfantasias,
    required this.trios,
    required this.valtrios,
    required this.grupos,
    required this.valgrupos,
    required this.salidas,
    required this.valsalidas,
    required this.usuario,
  });

  bool compania;
  int valcompania;
  bool vaginal;
  int valvaginal;
  bool oral;
  int valoral;
  bool anal;
  int valanal;
  bool poses;
  int valposes;
  bool hotshow;
  int valhotshow;
  bool poledance;
  int valpoledance;
  bool trajes;
  int valtrajes;
  bool sextoys;
  int valsextoys;
  bool fetiches;
  int valfetiches;
  bool fantasias;
  int valfantasias;
  bool trios;
  int valtrios;
  bool grupos;
  int valgrupos;
  bool salidas;
  int valsalidas;
  String usuario;

  factory Servicio.fromMap(Map<String, dynamic> json) => Servicio(
        compania: json.containsKey('compania') ? json['compania'] : false,
        valcompania: json.containsKey('valcompania') ? json['valcompania'] : 0,
        vaginal: json.containsKey('vaginal') ? json['vaginal'] : false,
        valvaginal: json.containsKey('valvaginal') ? json['valvaginal'] : 0,
        oral: json.containsKey('oral') ? json['oral'] : false,
        valoral: json.containsKey('valoral') ? json['valoral'] : 0,
        anal: json.containsKey('anal') ? json['anal'] : false,
        valanal: json.containsKey('valanal') ? json['valanal'] : 0,
        poses: json.containsKey('poses') ? json['poses'] : false,
        valposes: json.containsKey('valposes') ? json['valposes'] : 0,
        hotshow: json.containsKey('hotshow') ? json['hotshow'] : false,
        valhotshow: json.containsKey('valhotshow') ? json['valhotshow'] : 0,
        poledance: json.containsKey('poledance') ? json['poledance'] : false,
        valpoledance: json.containsKey('valpoledance') ? json['valpoledance'] : 0,
        trajes: json.containsKey('trajes') ? json['trajes'] : false,
        valtrajes: json.containsKey('valtrajes') ? json['valtrajes'] : 0,
        sextoys: json.containsKey('sextoys') ? json['sextoys'] : false,
        valsextoys: json.containsKey('valsextoys') ? json['valsextoys'] : 0,
        fetiches: json.containsKey('fetiches') ? json['fetiches'] : false,
        valfetiches: json.containsKey('valfetiches') ? json['valfetiches'] : 0,
        fantasias: json.containsKey('fantasias') ? json['fantasias'] : false,
        valfantasias: json.containsKey('valfantasias') ? json['valfantasias'] : 0,
        trios: json.containsKey('trios') ? json['trios'] : false,
        valtrios: json.containsKey('valtrios') ? json['valtrios'] : 0,
        grupos: json.containsKey('grupos') ? json['grupos'] : false,
        valgrupos: json.containsKey('valgrupos') ? json['valgrupos'] : 0,
        salidas: json.containsKey('salidas') ? json['salidas'] : false,
        valsalidas: json.containsKey('valsalidas') ? json['valsalidas'] : 0,
        usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
      );

  factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        compania: json.containsKey('compania') ? json['compania'] : false,
        valcompania: json.containsKey('valcompania') ? json['valcompania'] : 0,
        vaginal: json.containsKey('vaginal') ? json['vaginal'] : false,
        valvaginal: json.containsKey('valvaginal') ? json['valvaginal'] : 0,
        oral: json.containsKey('oral') ? json['oral'] : false,
        valoral: json.containsKey('valoral') ? json['valoral'] : 0,
        anal: json.containsKey('anal') ? json['anal'] : false,
        valanal: json.containsKey('valanal') ? json['valanal'] : 0,
        poses: json.containsKey('poses') ? json['poses'] : false,
        valposes: json.containsKey('valposes') ? json['valposes'] : 0,
        hotshow: json.containsKey('hotshow') ? json['hotshow'] : false,
        valhotshow: json.containsKey('valhotshow') ? json['valhotshow'] : 0,
        poledance: json.containsKey('poledance') ? json['poledance'] : false,
        valpoledance: json.containsKey('valpoledance') ? json['valpoledance'] : 0,
        trajes: json.containsKey('trajes') ? json['trajes'] : false,
        valtrajes: json.containsKey('valtrajes') ? json['valtrajes'] : 0,
        sextoys: json.containsKey('sextoys') ? json['sextoys'] : false,
        valsextoys: json.containsKey('valsextoys') ? json['valsextoys'] : 0,
        fetiches: json.containsKey('fetiches') ? json['fetiches'] : false,
        valfetiches: json.containsKey('valfetiches') ? json['valfetiches'] : 0,
        fantasias: json.containsKey('fantasias') ? json['fantasias'] : false,
        valfantasias: json.containsKey('valfantasias') ? json['valfantasias'] : 0,
        trios: json.containsKey('trios') ? json['trios'] : false,
        valtrios: json.containsKey('valtrios') ? json['valtrios'] : 0,
        grupos: json.containsKey('grupos') ? json['grupos'] : false,
        valgrupos: json.containsKey('valgrupos') ? json['valgrupos'] : 0,
        salidas: json.containsKey('salidas') ? json['salidas'] : false,
        valsalidas: json.containsKey('valsalidas') ? json['valsalidas'] : 0,
        usuario: json.containsKey('usuario') ? json['usuario'] : 'no-usuario',
      );
}