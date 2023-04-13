import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static bool refresh = true;
  static String _nombre = 'seXquare';
  static String _genero = 'M';
  static String _edad = '2';
  static String _etnia = 'L';
  static String _religion = 'C';
  static String _img = 'https://res.cloudinary.com/dnnwiqvxe/image/upload/v1678633529/seXquare/usr_transparent_gris_dhmkb4.png';
  static String _id = '';
  static String _countryDial = '';
  static String _numCel = '9999999999';
  static String _rol = 'NOR_ROL';
  static String _pais = '';
  static String _paisId = '';
  static String _provincia = '';
  static String _provinciaId = '';
  static String _ciudad = '';
  static String _ciudadId = '';
  static String _local = '';
  static String _localId = '';
  static String _procesoId = '';
  static String _candidatoId = '';
  static String _ambito = '';
  static String _token = '';
  static double _lat = 0;
  static double _lng = 0;
  static String _version = '';
  static String _sistema = '';
  static String _fechaRegistro = '';
  static String _fechaCaducidad = '';
  static String _nombreProceso = '';
  static String _buscar = '';
  static String _emailContacto = 'powerxquare@gmail.com';
  static String _emailContacto1 = 'ecuafac@gmail.com';
  static String _numeroContacto = '+593 99 088 2956';
  static String _numeroContacto1 = '+593 95 955 1475';
  static String _numeroContacto2 = '+593 98 387 1767';
  static String _ctaPagos = 'Kenneth Guerrero Alvarado, Banco Pichincha, Cta_Ah No. 6308515200';
  static String _valProFis = '120';
  static String _valProVir = '140';
  static String _valUsrWom = '100';
  static String _valUsrMan = '110';
  static String _valUsrGay = '140';
  static String _valUsrTrs = '140';
  static String _valCliPre = '20';
  static String _valCliEsp = '10';

  static int _stateVote = 1;    // 0 - No puede votar, 1 - Votar, 2 - Revocar
  static String _status = '0';    // '0' - Normal, '1' - Pendiente, '2' - Aprobada, '3' - Rechazada
  static bool _isVerified = false;
  static bool _isDarkmode = false;
  static bool _isExterior = false;
  static String? _dispositivoId;
  static String? _administradorId;
  static String? _tokenDispositivoId;


  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isVerified {
    return _prefs.getBool('isVerified') ?? _isVerified;
  }

  static set isVerified(bool value) {
    _isVerified = value;
    _prefs.setBool('isVerified', value);
  }

  static bool get isExterior {
    return _prefs.getBool('isExterior') ?? _isExterior;
  }

  static set isExterior(bool value) {
    _isExterior = value;
    _prefs.setBool('isExterior', value);
  }

  static int get stateVote {
    return _prefs.getInt('stateVote') ?? _stateVote;
  }

  static set stateVote(int value) {
    _stateVote = value;
    _prefs.setInt('stateVote', value);
  }

  static String get status {
    return _prefs.getString('status') ?? _status;
  }

  static set status(String value) {
    _status = value;
    _prefs.setString('status', value);
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  static String get genero {
    return _prefs.getString('genero') ?? _genero;
  }

  static set genero(String value) {
    _genero = value;
    _prefs.setString('genero', value);
  }

  static String get edad {
    return _prefs.getString('edad') ?? _edad;
  }

  static set edad(String value) {
    _edad = value;
    _prefs.setString('edad', value);
  }

  static String get etnia {
    return _prefs.getString('etnia') ?? _etnia;
  }

  static set etnia(String value) {
    _etnia = value;
    _prefs.setString('etnia', value);
  }

  static String get religion {
    return _prefs.getString('religion') ?? _religion;
  }

  static set religion(String value) {
    _religion = value;
    _prefs.setString('religion', value);
  }

  static String get numCel {
    return _prefs.getString('numCel') ?? _numCel;
  }

  static set numCel(String value) {
    _numCel = value;
    _prefs.setString('numCel', value);
  }

  static String get dispositivoId {
    return _prefs.getString('dispositivoId') ?? _dispositivoId??"";
  }

  static set dispositivoId(String value) {
    _dispositivoId = value;
    _prefs.setString('dispositivoId', value);
  }

  static String get administradorId {
    return _prefs.getString('administradorId') ?? _administradorId??"";
  }

  static set administradorId(String value) {
    _administradorId = value;
    _prefs.setString('administradorId', value);
  }

  static String get tokenDispositivoId {
    return _prefs.getString('tokenDispositivoId') ?? _tokenDispositivoId??"";
  }

  static set tokenDispositivoId(String value) {
    _tokenDispositivoId = value;
    _prefs.setString('tokenDispositivoId', value);
  }

  static String get id {
    return _prefs.getString('id') ?? _id;
  }

  static set id(String value) {
    _id = value;
    _prefs.setString('id', value);
  }

  static String get countryDial {
    return _prefs.getString('countryDial') ?? _countryDial;
  }

  static set countryDial(String value) {
    _countryDial = value;
    _prefs.setString('countryDial', value);
  }

  static String get rol {
    return _prefs.getString('rol') ?? _rol;
  }

  static set rol(String value) {
    _rol = value;
    _prefs.setString('rol', value);
  }

  static String get pais {
    return _prefs.getString('pais') ?? _pais;
  }

  static set pais(String value) {
    _pais = value;
    _prefs.setString('pais', value);
  }

  static String get paisId {
    return _prefs.getString('paisId') ?? _paisId;
  }

  static set paisId(String value) {
    _paisId = value;
    _prefs.setString('paisId', value);
  }

  static String get provincia {
    return _prefs.getString('provincia') ?? _provincia;
  }

  static set provincia(String value) {
    _provincia = value;
    _prefs.setString('provincia', value);
  }

  static String get provinciaId {
    return _prefs.getString('provinciaId') ?? _provinciaId;
  }

  static set provinciaId(String value) {
    _provinciaId = value;
    _prefs.setString('provinciaId', value);
  }

  static String get ciudad {
    return _prefs.getString('ciudad') ?? _ciudad;
  }

  static set ciudad(String value) {
    _ciudad = value;
    _prefs.setString('ciudad', value);
  }

  static String get ciudadId {
    return _prefs.getString('ciudadId') ?? _ciudadId;
  }

  static set ciudadId(String value) {
    _ciudadId = value;
    _prefs.setString('ciudadId', value);
  }

  static String get local {
    return _prefs.getString('local') ?? _local;
  }

  static set local(String value) {
    _local = value;
    _prefs.setString('local', value);
  }

  static String get localId {
    return _prefs.getString('localId') ?? _localId;
  }

  static set localId(String value) {
    _localId = value;
    _prefs.setString('localId', value);
  }

  static String get procesoId {
    return _prefs.getString('procesoId') ?? _procesoId;
  }

  static set procesoId(String value) {
    _procesoId = value;
    _prefs.setString('procesoId', value);
  }

  static String get candidatoId {
    return _prefs.getString('candidatoId') ?? _candidatoId;
  }

  static set candidatoId(String value) {
    _candidatoId = value;
    _prefs.setString('candidatoId', value);
  }

  static String get ambito {
    return _prefs.getString('ambito') ?? _ambito;
  }

  static set ambito(String value) {
    _ambito = value;
    _prefs.setString('ambito', value);
  }

  static String get token {
    return _prefs.getString('token') ?? _token;
  }

  static set token(String value) {
    _token = value;
    _prefs.setString('token', value);
  }

  static double get lat {
    return _prefs.getDouble('lat') ?? _lat;
  }

  static set lat(double value) {
    _lat = value;
    _prefs.setDouble('lat', value);
  }

  static double get lng {
    return _prefs.getDouble('lng') ?? _lng;
  }

  static set lng(double value) {
    _lng = value;
    _prefs.setDouble('lng', value);
  }

  static String get version {
    return _prefs.getString('version') ?? _version;
  }

  static set version(String value) {
    _version = value;
    _prefs.setString('version', value);
  }

  static String get sistema {
    return _prefs.getString('sistema') ?? _sistema;
  }

  static set sistema(String value) {
    _sistema = value;
    _prefs.setString('sistema', value);
  }

  static String get img {
    return _prefs.getString('img') ?? _img;
  }

  static set img(String value) {
    _img = value;
    _prefs.setString('img', value);
  }

  static String get nombreProceso {
    return _prefs.getString('nombreProceso') ?? _nombreProceso;
  }

  static set nombreProceso(String value) {
    _nombreProceso = value;
    _prefs.setString('nombreProceso', value);
  }

  static String get buscar {
    return _prefs.getString('buscar') ?? _buscar;
  }

  static set buscar(String value) {
    _buscar = value;
    _prefs.setString('buscar', value);
  }

  static set emailContacto(String value) {
    _emailContacto = value;
    _prefs.setString('emailContacto', value);
  }

  static String get emailContacto {
    return _prefs.getString('emailContacto') ?? _emailContacto;
  }

  static set emailContacto1(String value) {
    _emailContacto1 = value;
    _prefs.setString('emailContacto1', value);
  }

  static String get emailContacto1 {
    return _prefs.getString('emailContacto1') ?? _emailContacto1;
  }

  static set numeroContacto(String value) {
    _numeroContacto = value;
    _prefs.setString('numeroContacto', value);
  }

  static String get numeroContacto {
    return _prefs.getString('numeroContacto') ?? _numeroContacto;
  }

  static set numeroContacto1(String value) {
    _numeroContacto1 = value;
    _prefs.setString('numeroContacto1', value);
  }

  static String get numeroContacto1 {
    return _prefs.getString('numeroContacto1') ?? _numeroContacto1;
  }

  static set numeroContacto2(String value) {
    _numeroContacto2 = value;
    _prefs.setString('numeroContacto2', value);
  }

  static String get numeroContacto2 {
    return _prefs.getString('numeroContacto2') ?? _numeroContacto2;
  }

  static String get fechaRegistro {
    return _prefs.getString('fechaRegistro') ?? _fechaRegistro;
  }

  static set fechaRegistro(String value) {
    _fechaRegistro = value;
    _prefs.setString('fechaRegistro', value);
  }

  static String get fechaCaducidad {
    return _prefs.getString('fechaCaducidad') ?? _fechaCaducidad;
  }

  static set fechaCaducidad(String value) {
    _fechaCaducidad = value;
    _prefs.setString('fechaCaducidad', value);
  }

  static String get ctaPagos {
    return _prefs.getString('ctaPagos') ?? _ctaPagos;
  }

  static set ctaPagos(String value) {
    _ctaPagos = value;
    _prefs.setString('ctaPagos', value);
  }

  static String get valProFis {
    return _prefs.getString('valProFis') ?? _valProFis;
  }

  static set valProFis(String value) {
    _valProFis = value;
    _prefs.setString('valProFis', value);
  }

  static String get valProVir {
    return _prefs.getString('valProVir') ?? _valProVir;
  }

  static set valProVir(String value) {
    _valProVir = value;
    _prefs.setString('valProVir', value);
  }

  static String get valUsrWom {
    return _prefs.getString('valUsrWom') ?? _valUsrWom;
  }

  static set valUsrWom(String value) {
    _valUsrWom = value;
    _prefs.setString('valUsrWom', value);
  }

  static String get valUsrMan {
    return _prefs.getString('valUsrMan') ?? _valUsrMan;
  }

  static set valUsrMan(String value) {
    _valUsrMan = value;
    _prefs.setString('valUsrMan', value);
  }

  static String get valUsrGay {
    return _prefs.getString('valUsrGay') ?? _valUsrGay;
  }

  static set valUsrGay(String value) {
    _valUsrGay = value;
    _prefs.setString('valUsrGay', value);
  }

  static String get valUsrTrs {
    return _prefs.getString('valUsrTrs') ?? _valUsrTrs;
  }

  static set valUsrTrs(String value) {
    _valUsrTrs = value;
    _prefs.setString('valUsrTrs', value);
  }

  static String get valCliPre {
    return _prefs.getString('valCliPre') ?? _valCliPre;
  }

  static set valCliPre(String value) {
    _valCliPre = value;
    _prefs.setString('valCliPre', value);
  }

  static String get valCliEsp {
    return _prefs.getString('valCliEsp') ?? _valCliEsp;
  }

  static set valCliEsp(String value) {
    _valCliEsp = value;
    _prefs.setString('valCliEsp', value);
  }

  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }
}