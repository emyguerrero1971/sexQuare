import 'dart:convert';
import 'package:sexquare/models/models.dart';

class Instalacion {
  Instalacion({
    required this.id,
    this.imgInstalacion,
    required this.boolBar,
    this.imgBar,
    required this.boolBanioPublico,
    this.imgBanioPublico,
    required this.boolBeautySalom,
    this.imgBeautySalom,
    required this.boolBuzonQS,
    this.imgBuzonQS,
    required this.boolCajeroAutomatico,
    this.imgCajeroAutomatico,
    required this.boolCine,
    this.imgCine,
    required this.boolCircuitoCerrado,
    this.imgCircuitoCerrado,
    required this.boolCostura,
    this.imgCostura,
    required this.boolConcursos,
    this.imgConcursos,
    required this.boolDiskJokey,
    this.imgDiskJokey,
    required this.boolEfectos,
    this.imgEfectos,
    required this.boolGimnacio,
    this.imgGimnacio,
    required this.boolGuardia,
    this.imgGuardia,
    required this.boolHidromasaje,
    this.imgHidromasaje,
    required this.boolLaundry,
    this.imgLaundry,
    required this.boolLuces,
    this.imgLuces,
    required this.boolMiniHotel,
    this.imgMiniHotel,
    required this.boolParqueo,
    this.imgParqueo,
    required this.boolPiscina,
    this.imgPiscina,
    required this.boolPoledance,
    this.imgPoledance,
    required this.boolReservado,
    this.imgReservado,
    required this.boolRestaurant,
    this.imgRestaurant,
    required this.boolSalaFumadores,
    this.imgSalaFumadores,
    required this.boolSalaVip,
    this.imgSalaVip,
    required this.boolSauna,
    this.imgSauna,
    required this.boolShows,
    this.imgShows,
    required this.boolTaxi,
    this.imgTaxi,
    required this.boolTienda,
    this.imgTienda,
    required this.boolTurco,
    this.imgTurco,
    required this.boolVendingSnacks,
    this.imgVendingSnacks,
    required this.boolVendingBebidas,
    this.imgVendingBebidas,
    required this.boolWifi,
    this.imgWifi,
    required this.boolEstado,
    required this.usuario,
  });

  String id;
  String? imgInstalacion;
  bool boolBar;
  String? imgBar;
  bool boolBanioPublico;
  String? imgBanioPublico;
  bool boolBeautySalom;
  String? imgBeautySalom;
  bool boolBuzonQS;
  String? imgBuzonQS;
  bool boolCajeroAutomatico;
  String? imgCajeroAutomatico;
  bool boolCine;
  String? imgCine;
  bool boolCircuitoCerrado;
  String? imgCircuitoCerrado;
  bool boolCostura;
  String? imgCostura;
  bool boolConcursos;
  String? imgConcursos;
  bool boolDiskJokey;
  String? imgDiskJokey;
  bool boolEfectos;
  String? imgEfectos;
  bool boolGimnacio;
  String? imgGimnacio;
  bool boolGuardia;
  String? imgGuardia;
  bool boolHidromasaje;
  String? imgHidromasaje;
  bool boolLaundry;
  String? imgLaundry;
  bool boolLuces;
  String? imgLuces;
  bool boolMiniHotel;
  String? imgMiniHotel;
  bool boolParqueo;
  String? imgParqueo;
  bool boolPiscina;
  String? imgPiscina;
  bool boolPoledance;
  String? imgPoledance;
  bool boolReservado;
  String? imgReservado;
  bool boolRestaurant;
  String? imgRestaurant;
  bool boolSalaFumadores;
  String? imgSalaFumadores;
  bool boolSalaVip;
  String? imgSalaVip;
  bool boolSauna;
  String? imgSauna;
  bool boolShows;
  String? imgShows;
  bool boolTaxi;
  String? imgTaxi;
  bool boolTienda;
  String? imgTienda;
  bool boolTurco;
  String? imgTurco;
  bool boolVendingSnacks;
  String? imgVendingSnacks;
  bool boolVendingBebidas;
  String? imgVendingBebidas;
  bool boolWifi;
  String? imgWifi;
  bool boolEstado;
  Usuario usuario;

  factory Instalacion.fromJson(Map<String, dynamic> json) => Instalacion(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    imgInstalacion: json.containsKey('imgInstalacion') ? json['imgInstalacion'] :null,
    boolBar: json.containsKey('boolBar') ? json['boolBar'] :false,
    imgBar: json.containsKey('imgBar') ? json['imgBar'] :null,
    boolBanioPublico: json.containsKey('boolBanioPublico') ? json['boolBanioPublico'] :false,
    imgBanioPublico: json.containsKey('imgBanioPublico') ? json['imgBanioPublico'] :null,
    boolBeautySalom: json.containsKey('boolBeautySalom') ? json['boolBeautySalom'] :false,
    imgBeautySalom: json.containsKey('imgBeautySalom') ? json['imgBeautySalom'] :null,
    boolBuzonQS: json.containsKey('boolBuzonQS') ? json['boolBuzonQS'] :false,
    imgBuzonQS: json.containsKey('imgBuzonQS') ? json['imgBuzonQS'] :null,
    boolCajeroAutomatico: json.containsKey('boolCajeroAutomatico') ? json['boolCajeroAutomatico'] :false,
    imgCajeroAutomatico: json.containsKey('imgCajeroAutomatico') ? json['imgCajeroAutomatico'] :null,
    boolCine: json.containsKey('boolCine') ? json['boolCine'] :false,
    imgCine: json.containsKey('imgCine') ? json['imgCine'] :null,
    boolCircuitoCerrado: json.containsKey('boolCircuitoCerrado') ? json['boolCircuitoCerrado'] :false,
    imgCircuitoCerrado: json.containsKey('imgCircuitoCerrado') ? json['imgCircuitoCerrado'] :null,
    boolCostura: json.containsKey('boolCostura') ? json['boolCostura'] :false,
    imgCostura: json.containsKey('imgCostura') ? json['imgCostura'] :null,
    boolConcursos: json.containsKey('boolConcursos') ? json['boolConcursos'] :false,
    imgConcursos: json.containsKey('imgConcursos') ? json['imgConcursos'] :null,
    boolDiskJokey: json.containsKey('boolDiskJokey') ? json['boolDiskJokey'] :false,
    imgDiskJokey: json.containsKey('imgDiskJokey') ? json['imgDiskJokey'] :null,
    boolEfectos: json.containsKey('boolEfectos') ? json['boolEfectos'] :false,
    imgEfectos: json.containsKey('imgEfectos') ? json['imgEfectos'] :null,
    boolGimnacio: json.containsKey('boolGimnacio') ? json['boolGimnacio'] :false,
    imgGimnacio: json.containsKey('imgGimnacio') ? json['imgGimnacio'] :null,
    boolGuardia: json.containsKey('boolGuardia') ? json['boolGuardia'] :false,
    imgGuardia: json.containsKey('imgGuardia') ? json['imgGuardia'] :null,
    boolHidromasaje: json.containsKey('boolHidromasaje') ? json['boolHidromasaje'] :false,
    imgHidromasaje: json.containsKey('imgHidromasaje') ? json['imgHidromasaje'] :null,
    boolLaundry: json.containsKey('boolLaundry') ? json['boolLaundry'] :false,
    imgLaundry: json.containsKey('imgLaundry') ? json['imgLaundry'] :null,
    boolLuces: json.containsKey('boolLuces') ? json['boolLuces'] :false,
    imgLuces: json.containsKey('imgLuces') ? json['imgLuces'] :null,
    boolMiniHotel: json.containsKey('boolMiniHotel') ? json['boolMiniHotel'] :false,
    imgMiniHotel: json.containsKey('imgMiniHotel') ? json['imgMiniHotel'] :null,
    boolParqueo: json.containsKey('boolParqueo') ? json['boolParqueo'] :false,
    imgParqueo: json.containsKey('imgParqueo') ? json['imgParqueo'] :null,
    boolPiscina: json.containsKey('boolPiscina') ? json['boolPiscina'] :false,
    imgPiscina: json.containsKey('imgPiscina') ? json['imgPiscina'] :null,
    boolPoledance: json.containsKey('boolPoledance') ? json['boolPoledance'] :false,
    imgPoledance: json.containsKey('imgPoledance') ? json['imgPoledance'] :null,
    boolReservado: json.containsKey('boolReservado') ? json['boolReservado'] :false,
    imgReservado: json.containsKey('imgReservado') ? json['imgReservado'] :null,
    boolRestaurant: json.containsKey('boolRestaurant') ? json['boolRestaurant'] :false,
    imgRestaurant: json.containsKey('imgRestaurant') ? json['imgRestaurant'] :null,
    boolSalaFumadores: json.containsKey('boolSalaFumadores') ? json['boolSalaFumadores'] :false,
    imgSalaFumadores: json.containsKey('imgSalaFumadores') ? json['imgSalaFumadores'] :null,
    boolSalaVip: json.containsKey('boolSalaVip') ? json['boolSalaVip'] :false,
    imgSalaVip: json.containsKey('imgSalaVip') ? json['imgSalaVip'] :null,
    boolSauna: json.containsKey('boolSauna') ? json['boolSauna'] :false,
    imgSauna: json.containsKey('imgSauna') ? json['imgSauna'] :null,
    boolShows: json.containsKey('boolShows') ? json['boolShows'] :false,
    imgShows: json.containsKey('imgShows') ? json['imgShows'] :null,
    boolTaxi: json.containsKey('boolTaxi') ? json['boolTaxi'] :false,
    imgTaxi: json.containsKey('imgTaxi') ? json['imgTaxi'] :null,
    boolTienda: json.containsKey('boolTienda') ? json['boolTienda'] :false,
    imgTienda: json.containsKey('imgTienda') ? json['imgTienda'] :null,
    boolTurco: json.containsKey('boolTurco') ? json['boolTurco'] :false,
    imgTurco: json.containsKey('imgTurco') ? json['imgTurco'] :null,
    boolVendingSnacks: json.containsKey('boolVendingSnacks') ? json['boolVendingSnacks'] :false,
    imgVendingSnacks: json.containsKey('imgVendingSnacks') ? json['imgVendingSnacks'] :null,
    boolVendingBebidas: json.containsKey('boolVendingBebidas') ? json['boolVendingBebidas'] :false,
    imgVendingBebidas: json.containsKey('imgVendingBebidas') ? json['imgVendingBebidas'] :null,
    boolWifi: json.containsKey('boolWifi') ? json['boolWifi'] :false,
    imgWifi: json.containsKey('imgWifi') ? json['imgWifi'] :null,
    boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
    usuario: Usuario.fromJson(
        json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
  );


  factory Instalacion.fromMap(Map<String, dynamic> json) => Instalacion(
    id: json.containsKey('_id') ? json['_id'] : 'no-id',
    imgInstalacion: json.containsKey('imgInstalacion') ? json['imgInstalacion'] :null,
    boolBar: json.containsKey('boolBar') ? json['boolBar'] :false,
    imgBar: json.containsKey('imgBar') ? json['imgBar'] :null,
    boolBanioPublico: json.containsKey('boolBanioPublico') ? json['boolBanioPublico'] :false,
    imgBanioPublico: json.containsKey('imgBanioPublico') ? json['imgBanioPublico'] :null,
    boolBeautySalom: json.containsKey('boolBeautySalom') ? json['boolBeautySalom'] :false,
    imgBeautySalom: json.containsKey('imgBeautySalom') ? json['imgBeautySalom'] :null,
    boolBuzonQS: json.containsKey('boolBuzonQS') ? json['boolBuzonQS'] :false,
    imgBuzonQS: json.containsKey('imgBuzonQS') ? json['imgBuzonQS'] :null,
    boolCajeroAutomatico: json.containsKey('boolCajeroAutomatico') ? json['boolCajeroAutomatico'] :false,
    imgCajeroAutomatico: json.containsKey('imgCajeroAutomatico') ? json['imgCajeroAutomatico'] :null,
    boolCine: json.containsKey('boolCine') ? json['boolCine'] :false,
    imgCine: json.containsKey('imgCine') ? json['imgCine'] :null,
    boolCircuitoCerrado: json.containsKey('boolCircuitoCerrado') ? json['boolCircuitoCerrado'] :false,
    imgCircuitoCerrado: json.containsKey('imgCircuitoCerrado') ? json['imgCircuitoCerrado'] :null,
    boolCostura: json.containsKey('boolCostura') ? json['boolCostura'] :false,
    imgCostura: json.containsKey('imgCostura') ? json['imgCostura'] :null,
    boolConcursos: json.containsKey('boolConcursos') ? json['boolConcursos'] :false,
    imgConcursos: json.containsKey('imgConcursos') ? json['imgConcursos'] :null,
    boolDiskJokey: json.containsKey('boolDiskJokey') ? json['boolDiskJokey'] :false,
    imgDiskJokey: json.containsKey('imgDiskJokey') ? json['imgDiskJokey'] :null,
    boolEfectos: json.containsKey('boolEfectos') ? json['boolEfectos'] :false,
    imgEfectos: json.containsKey('imgEfectos') ? json['imgEfectos'] :null,
    boolGimnacio: json.containsKey('boolGimnacio') ? json['boolGimnacio'] :false,
    imgGimnacio: json.containsKey('imgGimnacio') ? json['imgGimnacio'] :null,
    boolGuardia: json.containsKey('boolGuardia') ? json['boolGuardia'] :false,
    imgGuardia: json.containsKey('imgGuardia') ? json['imgGuardia'] :null,
    boolHidromasaje: json.containsKey('boolHidromasaje') ? json['boolHidromasaje'] :false,
    imgHidromasaje: json.containsKey('imgHidromasaje') ? json['imgHidromasaje'] :null,
    boolLaundry: json.containsKey('boolLaundry') ? json['boolLaundry'] :false,
    imgLaundry: json.containsKey('imgLaundry') ? json['imgLaundry'] :null,
    boolLuces: json.containsKey('boolLuces') ? json['boolLuces'] :false,
    imgLuces: json.containsKey('imgLuces') ? json['imgLuces'] :null,
    boolMiniHotel: json.containsKey('boolMiniHotel') ? json['boolMiniHotel'] :false,
    imgMiniHotel: json.containsKey('imgMiniHotel') ? json['imgMiniHotel'] :null,
    boolParqueo: json.containsKey('boolParqueo') ? json['boolParqueo'] :false,
    imgParqueo: json.containsKey('imgParqueo') ? json['imgParqueo'] :null,
    boolPiscina: json.containsKey('boolPiscina') ? json['boolPiscina'] :false,
    imgPiscina: json.containsKey('imgPiscina') ? json['imgPiscina'] :null,
    boolPoledance: json.containsKey('boolPoledance') ? json['boolPoledance'] :false,
    imgPoledance: json.containsKey('imgPoledance') ? json['imgPoledance'] :null,
    boolReservado: json.containsKey('boolReservado') ? json['boolReservado'] :false,
    imgReservado: json.containsKey('imgReservado') ? json['imgReservado'] :null,
    boolRestaurant: json.containsKey('boolRestaurant') ? json['boolRestaurant'] :false,
    imgRestaurant: json.containsKey('imgRestaurant') ? json['imgRestaurant'] :null,
    boolSalaFumadores: json.containsKey('boolSalaFumadores') ? json['boolSalaFumadores'] :false,
    imgSalaFumadores: json.containsKey('imgSalaFumadores') ? json['imgSalaFumadores'] :null,
    boolSalaVip: json.containsKey('boolSalaVip') ? json['boolSalaVip'] :false,
    imgSalaVip: json.containsKey('imgSalaVip') ? json['imgSalaVip'] :null,
    boolSauna: json.containsKey('boolSauna') ? json['boolSauna'] :false,
    imgSauna: json.containsKey('imgSauna') ? json['imgSauna'] :null,
    boolShows: json.containsKey('boolShows') ? json['boolShows'] :false,
    imgShows: json.containsKey('imgShows') ? json['imgShows'] :null,
    boolTaxi: json.containsKey('boolTaxi') ? json['boolTaxi'] :false,
    imgTaxi: json.containsKey('imgTaxi') ? json['imgTaxi'] :null,
    boolTienda: json.containsKey('boolTienda') ? json['boolTienda'] :false,
    imgTienda: json.containsKey('imgTienda') ? json['imgTienda'] :null,
    boolTurco: json.containsKey('boolTurco') ? json['boolTurco'] :false,
    imgTurco: json.containsKey('imgTurco') ? json['imgTurco'] :null,
    boolVendingSnacks: json.containsKey('boolVendingSnacks') ? json['boolVendingSnacks'] :false,
    imgVendingSnacks: json.containsKey('imgVendingSnacks') ? json['imgVendingSnacks'] :null,
    boolVendingBebidas: json.containsKey('boolVendingBebidas') ? json['boolVendingBebidas'] :false,
    imgVendingBebidas: json.containsKey('imgVendingBebidas') ? json['imgVendingBebidas'] :null,
    boolWifi: json.containsKey('boolWifi') ? json['boolWifi'] :false,
    imgWifi: json.containsKey('imgWifi') ? json['imgWifi'] :null,
    boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
    usuario: Usuario.fromJson(
        json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'imgInstalacion': imgInstalacion,
    'boolBar': boolBar,
    'imgBar': imgBar,
    'boolBanioPublico': boolBanioPublico,
    'imgBanioPublico': imgBanioPublico,
    'boolBeautySalom': boolBeautySalom,
    'imgBeautySalom': imgBeautySalom,
    'boolBuzonQS': boolBuzonQS,
    'imgBuzonQS': imgBuzonQS,
    'boolCajeroAutomatico': boolCajeroAutomatico,
    'imgCajeroAutomatico': imgCajeroAutomatico,
    'boolCine': boolCine,
    'imgCine': imgCine,
    'boolCircuitoCerrado': boolCircuitoCerrado,
    'imgCircuitoCerrado': imgCircuitoCerrado,
    'boolCostura': boolCostura,
    'imgCostura': imgCostura,
    'boolConcursos': boolConcursos,
    'imgConcursos': imgConcursos,
    'boolDiskJokey': boolDiskJokey,
    'imgDiskJokey': imgDiskJokey,
    'boolEfectos': boolEfectos,
    'imgEfectos': imgEfectos,
    'boolGimnacio': boolGimnacio,
    'imgGimnacio': imgGimnacio,
    'boolGuardia': boolGuardia,
    'imgGuardia': imgGuardia,
    'boolHidromasaje': boolHidromasaje,
    'imgHidromasaje': imgHidromasaje,
    'boolLaundry': boolLaundry,
    'imgLaundry': imgLaundry,
    'boolLuces': boolLuces,
    'imgLuces': imgLuces,
    'boolMiniHotel': boolMiniHotel,
    'imgMiniHotel': imgMiniHotel,
    'boolParqueo': boolParqueo,
    'imgParqueo': imgParqueo,
    'boolPiscina': boolPiscina,
    'imgPiscina': imgPiscina,
    'boolPoledance': boolPoledance,
    'imgPoledance': imgPoledance,
    'boolReservado': boolReservado,
    'imgReservado': imgReservado,
    'boolRestaurant': boolRestaurant,
    'imgRestaurant': imgRestaurant,
    'boolSalaFumadores': boolSalaFumadores,
    'imgSalaFumadores': imgSalaFumadores,
    'boolSalaVip': boolSalaVip,
    'imgSalaVip': imgSalaVip,
    'boolSauna': boolSauna,
    'imgSauna': imgSauna,
    'boolShows': boolShows,
    'imgShows': imgShows,
    'boolTaxi': boolTaxi,
    'imgTaxi': imgTaxi,
    'boolTienda': boolTienda,
    'imgTienda': imgTienda,
    'boolTurco': boolTurco,
    'imgTurco': imgTurco,
    'boolVendingSnacks': boolVendingSnacks,
    'imgVendingSnacks': imgVendingSnacks,
    'boolVendingBebidas': boolVendingBebidas,
    'imgVendingBebidas': imgVendingBebidas,
    'boolWifi': boolWifi,
    'imgWifi': imgWifi,
    'boolEstado': boolEstado,
    'usuario': usuario,
  };

  String toJson() => json.encode(toMap());

  Instalacion copy() => Instalacion(
    id: id,
    imgInstalacion: imgInstalacion,
    boolBar: boolBar,
    imgBar: imgBar,
    boolBanioPublico: boolBanioPublico,
    imgBanioPublico: imgBanioPublico,
    boolBeautySalom: boolBeautySalom,
    imgBeautySalom: imgBeautySalom,
    boolBuzonQS: boolBuzonQS,
    imgBuzonQS: imgBuzonQS,
    boolCajeroAutomatico: boolCajeroAutomatico,
    imgCajeroAutomatico: imgCajeroAutomatico,
    boolCine: boolCine,
    imgCine: imgCine,
    boolCircuitoCerrado: boolCircuitoCerrado,
    imgCircuitoCerrado: imgCircuitoCerrado,
    boolCostura: boolCostura,
    imgCostura: imgCostura,
    boolConcursos: boolConcursos,
    imgConcursos: imgConcursos,
    boolDiskJokey: boolDiskJokey,
    imgDiskJokey: imgDiskJokey,
    boolEfectos: boolEfectos,
    imgEfectos: imgEfectos,
    boolGimnacio: boolGimnacio,
    imgGimnacio: imgGimnacio,
    boolGuardia: boolGuardia,
    imgGuardia: imgGuardia,
    boolHidromasaje: boolHidromasaje,
    imgHidromasaje: imgHidromasaje,
    boolLaundry: boolLaundry,
    imgLaundry: imgLaundry,
    boolLuces: boolLuces,
    imgLuces: imgLuces,
    boolMiniHotel: boolMiniHotel,
    imgMiniHotel: imgMiniHotel,
    boolParqueo: boolParqueo,
    imgParqueo: imgParqueo,
    boolPiscina: boolPiscina,
    imgPiscina: imgPiscina,
    boolPoledance: boolPoledance,
    imgPoledance: imgPoledance,
    boolReservado: boolReservado,
    imgReservado: imgReservado,
    boolRestaurant: boolRestaurant,
    imgRestaurant: imgRestaurant,
    boolSalaFumadores: boolSalaFumadores,
    imgSalaFumadores: imgSalaFumadores,
    boolSalaVip: boolSalaVip,
    imgSalaVip: imgSalaVip,
    boolSauna: boolSauna,
    imgSauna: imgSauna,
    boolShows: boolShows,
    imgShows: imgShows,
    boolTaxi: boolTaxi,
    imgTaxi: imgTaxi,
    boolTienda: boolTienda,
    imgTienda: imgTienda,
    boolTurco: boolTurco,
    imgTurco: imgTurco,
    boolVendingSnacks: boolVendingSnacks,
    imgVendingSnacks: imgVendingSnacks,
    boolVendingBebidas: boolVendingBebidas,
    imgVendingBebidas: imgVendingBebidas,
    boolWifi: boolWifi,
    imgWifi: imgWifi,
    boolEstado: boolEstado,
    usuario: usuario,
  );
}
