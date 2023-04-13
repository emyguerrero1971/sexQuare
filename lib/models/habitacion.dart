import 'dart:convert';
import 'package:sexquare/models/models.dart';

class Habitacion {
  Habitacion({
    required this.id,
    this.imgHabitacion,
    required this.boolExhibidor,
    this.imgExhibidor,
    required this.boolAguaCaliente,
    this.imgAguaCaliente,
    required this.boolAguaEmbotellada,
    this.imgAguaEmbotellada,
    required this.boolAireAcondicionado,
    this.imgAireAcondicionado,
    required this.boolAlfombra,
    this.imgAlfombra,
    required this.boolAlmohada,
    this.imgAlmohada,
    required this.boolBanioPrivado,
    this.imgBanioPrivado,
    required this.boolCloset,
    this.imgCloset,
    required this.boolEspejo,
    this.imgEspejo,
    required this.boolIntercomunicador,
    this.imgIntercomunicador,
    required this.boolKitAseoPersonal,
    this.imgKitAseoPersonal,
    required this.boolKitLimpieza,
    this.imgKitLimpieza,
    required this.boolLenceriaCama,
    this.imgLenceriaCama,
    required this.boolLlave,
    this.imgLlave,
    required this.boolPlanchador,
    this.imgPlanchador,
    required this.boolProtectorColchon,
    this.imgProtectorColchon,
    required this.boolPuertaServicio,
    this.imgPuertaServicio,
    required this.boolRefrigerador,
    this.imgRefrigerador,
    required this.boolSalaStar,
    this.imgSalaStar,
    required this.boolSujetadorSabana,
    this.imgSujetadorSabana,
    required this.boolTvCable,
    this.imgTvCable,
    required this.boolTvProyector,
    this.imgTvProyector,
    required this.boolVentilador,
    this.imgVentilador,
    required this.boolVestidor,
    this.imgVestidor,
    required this.boolWifi,
    this.imgWifi,
    required this.selCalidadAlmohada,
    this.imgCalidadAlmohada,
    required this.textCantidadAlmohada,
    this.imgCantidadAlmohada,
    required this.selMaterialCama,
    this.imgMaterialCama,
    required this.selMedidaCama,
    this.imgMedidaCama,
    required this.selTipoBanio,
    this.imgTipoBanio,
    required this.selTipoColchon,
    this.imgTipoColchon,
    required this.boolEstado,
    required this.usuario,
  });

  String id;
  String? imgHabitacion;
  bool boolExhibidor;
  String? imgExhibidor;
  bool boolAguaCaliente;
  String? imgAguaCaliente;
  bool boolAguaEmbotellada;
  String? imgAguaEmbotellada;
  bool boolAireAcondicionado;
  String? imgAireAcondicionado;
  bool boolAlfombra;
  String? imgAlfombra;
  bool boolAlmohada;
  String? imgAlmohada;
  bool boolBanioPrivado;
  String? imgBanioPrivado;
  bool boolCloset;
  String? imgCloset;
  bool boolEspejo;
  String? imgEspejo;
  bool boolIntercomunicador;
  String? imgIntercomunicador;
  bool boolKitAseoPersonal;
  String? imgKitAseoPersonal;
  bool boolKitLimpieza;
  String? imgKitLimpieza;
  bool boolLenceriaCama;
  String? imgLenceriaCama;
  bool boolLlave;
  String? imgLlave;
  bool boolPlanchador;
  String? imgPlanchador;
  bool boolProtectorColchon;
  String? imgProtectorColchon;
  bool boolPuertaServicio;
  String? imgPuertaServicio;
  bool boolRefrigerador;
  String? imgRefrigerador;
  bool boolSalaStar;
  String? imgSalaStar;
  bool boolSujetadorSabana;
  String? imgSujetadorSabana;
  bool boolTvCable;
  String? imgTvCable;
  bool boolTvProyector;
  String? imgTvProyector;
  bool boolVentilador;
  String? imgVentilador;
  bool boolVestidor;
  String? imgVestidor;
  bool boolWifi;
  String? imgWifi;
  String selCalidadAlmohada;
  String? imgCalidadAlmohada;
  String textCantidadAlmohada;
  String? imgCantidadAlmohada;
  String selMaterialCama;
  String? imgMaterialCama;
  String selMedidaCama;
  String? imgMedidaCama;
  String selTipoBanio;
  String? imgTipoBanio;
  String selTipoColchon;
  String? imgTipoColchon;
  bool boolEstado;
  Usuario usuario;

  factory Habitacion.fromJson(Map<String, dynamic> json) => Habitacion(
        id: json.containsKey('_id') ? json['_id'] : 'no-id',
        imgHabitacion: json.containsKey('imgHabitacion')
            ? json['imgHabitacion']
            : null,
        boolExhibidor: json.containsKey('boolExhibidor')
            ? json['boolExhibidor']
            : false,
        imgExhibidor: json.containsKey('imgExhibidor')
            ? json['imgExhibidor']
            : null,
        boolAguaCaliente: json.containsKey('boolAguaCaliente')
            ? json['boolAguaCaliente']
            : false,
        imgAguaCaliente: json.containsKey('imgAguaCaliente')
            ? json['imgAguaCaliente']
            : null,
        boolAguaEmbotellada: json.containsKey('boolAguaEmbotellada')
            ? json['boolAguaEmbotellada']
            : false,
        imgAguaEmbotellada: json.containsKey('imgAguaEmbotellada')
            ? json['imgAguaEmbotellada']
            : null,
        boolAireAcondicionado: json.containsKey('boolAireAcondicionado')
            ? json['boolAireAcondicionado']
            : false,
        imgAireAcondicionado: json.containsKey('imgAireAcondicionado')
            ? json['imgAireAcondicionado']
            : null,
        boolAlfombra:
            json.containsKey('boolAlfombra') ? json['boolAlfombra'] : false,
        imgAlfombra: json.containsKey('imgAlfombra')
            ? json['imgAlfombra']
            : null,
        boolAlmohada:
            json.containsKey('boolAlmohada') ? json['boolAlmohada'] : false,
        imgAlmohada: json.containsKey('imgAlmohada')
            ? json['imgAlmohada']
            : null,
        boolBanioPrivado: json.containsKey('boolBanioPrivado')
            ? json['boolBanioPrivado']
            : false,
        imgBanioPrivado: json.containsKey('imgBanioPrivado')
            ? json['imgBanioPrivado']
            : null,
        boolCloset: json.containsKey('boolCloset') ? json['boolCloset'] : false,
        imgCloset:
            json.containsKey('imgCloset') ? json['imgCloset'] : null,
        boolEspejo: json.containsKey('boolEspejo') ? json['boolEspejo'] : false,
        imgEspejo:
            json.containsKey('imgEspejo') ? json['imgEspejo'] : null,
        boolIntercomunicador: json.containsKey('boolIntercomunicador')
            ? json['boolIntercomunicador']
            : false,
        imgIntercomunicador: json.containsKey('imgIntercomunicador')
            ? json['imgIntercomunicador']
            : null,
        boolKitAseoPersonal: json.containsKey('boolKitAseoPersonal')
            ? json['boolKitAseoPersonal']
            : false,
        imgKitAseoPersonal: json.containsKey('imgKitAseoPersonal')
            ? json['imgKitAseoPersonal']
            : null,
        boolKitLimpieza: json.containsKey('boolKitLimpieza')
            ? json['boolKitLimpieza']
            : false,
        imgKitLimpieza: json.containsKey('imgKitLimpieza')
            ? json['imgKitLimpieza']
            : null,
        boolLenceriaCama: json.containsKey('boolLenceriaCama')
            ? json['boolLenceriaCama']
            : false,
        imgLenceriaCama: json.containsKey('imgLenceriaCama')
            ? json['imgLenceriaCama']
            : null,
        boolLlave: json.containsKey('boolLlave') ? json['boolLlave'] : false,
        imgLlave:
            json.containsKey('imgLlave') ? json['imgLlave'] : null,
        boolPlanchador:
            json.containsKey('boolPlanchador') ? json['boolPlanchador'] : false,
        imgPlanchador: json.containsKey('imgPlanchador')
            ? json['imgPlanchador']
            : null,
        boolProtectorColchon: json.containsKey('boolProtectorColchon')
            ? json['boolProtectorColchon']
            : false,
        imgProtectorColchon: json.containsKey('imgProtectorColchon')
            ? json['imgProtectorColchon']
            : null,
        boolPuertaServicio: json.containsKey('boolPuertaServicio')
            ? json['boolPuertaServicio']
            : false,
        imgPuertaServicio: json.containsKey('imgPuertaServicio')
            ? json['imgPuertaServicio']
            : null,
        boolRefrigerador: json.containsKey('boolRefrigerador')
            ? json['boolRefrigerador']
            : false,
        imgRefrigerador: json.containsKey('imgRefrigerador')
            ? json['imgRefrigerador']
            : null,
        boolSalaStar:
            json.containsKey('boolSalaStar') ? json['boolSalaStar'] : false,
        imgSalaStar: json.containsKey('imgSalaStar')
            ? json['imgSalaStar']
            : null,
        boolSujetadorSabana: json.containsKey('boolSujetadorSabana')
            ? json['boolSujetadorSabana']
            : false,
        imgSujetadorSabana: json.containsKey('imgSujetadorSabana')
            ? json['imgSujetadorSabana']
            : null,
        boolTvCable:
            json.containsKey('boolTvCable') ? json['boolTvCable'] : false,
        imgTvCable: json.containsKey('imgTvCable')
            ? json['imgTvCable']
            : null,
        boolTvProyector: json.containsKey('boolTvProyector')
            ? json['boolTvProyector']
            : false,
        imgTvProyector: json.containsKey('imgTvProyector')
            ? json['imgTvProyector']
            : null,
        boolVentilador:
            json.containsKey('boolVentilador') ? json['boolVentilador'] : false,
        imgVentilador: json.containsKey('imgVentilador')
            ? json['imgVentilador']
            : null,
        boolVestidor:
            json.containsKey('boolVestidor') ? json['boolVestidor'] : false,
        imgVestidor: json.containsKey('imgVestidor')
            ? json['imgVestidor']
            : null,
        boolWifi: json.containsKey('boolWifi') ? json['boolWifi'] : false,
        imgWifi: json.containsKey('imgWifi') ? json['imgWifi'] : 'no-imgWifi',
        selCalidadAlmohada: json.containsKey('selCalidadAlmohada')
            ? json['selCalidadAlmohada']
            : 'no-selCalidadAlmohada',
        imgCalidadAlmohada: json.containsKey('imgCalidadAlmohada')
            ? json['imgCalidadAlmohada']
            : null,
        textCantidadAlmohada: json.containsKey('textCantidadAlmohada')
            ? json['textCantidadAlmohada']
            : 'no-textCantidadAlmohada',
        imgCantidadAlmohada: json.containsKey('imgCantidadAlmohada')
            ? json['imgCantidadAlmohada']
            : null,
        selMaterialCama: json.containsKey('selMaterialCama')
            ? json['selMaterialCama']
            : 'no-selMaterialCama',
        imgMaterialCama: json.containsKey('imgMaterialCama')
            ? json['imgMaterialCama']
            : null,
        selMedidaCama: json.containsKey('selMedidaCama')
            ? json['selMedidaCama']
            : 'no-selMedidaCama',
        imgMedidaCama: json.containsKey('imgMedidaCama')
            ? json['imgMedidaCama']
            : null,
        selTipoBanio: json.containsKey('selTipoBanio')
            ? json['selTipoBanio']
            : 'no-selTipoBanio',
        imgTipoBanio: json.containsKey('imgTipoBanio')
            ? json['imgTipoBanio']
            : null,
        selTipoColchon: json.containsKey('selTipoColchon')
            ? json['selTipoColchon']
            : 'no-selTipoColchon',
        imgTipoColchon: json.containsKey('imgTipoColchon')
            ? json['imgTipoColchon']
            : null,
        boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
        usuario: Usuario.fromJson(
            json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
      );

  factory Habitacion.fromMap(Map<String, dynamic> json) => Habitacion(
        id: json.containsKey('_id') ? json['_id'] : 'no-id',
        imgHabitacion: json.containsKey('imgHabitacion')
            ? json['imgHabitacion']
            : null,
        boolExhibidor: json.containsKey('boolExhibidor')
            ? json['boolExhibidor']
            : false,
        imgExhibidor: json.containsKey('imgExhibidor')
            ? json['imgExhibidor']
            : null,
        boolAguaCaliente: json.containsKey('boolAguaCaliente')
            ? json['boolAguaCaliente']
            : false,
        imgAguaCaliente: json.containsKey('imgAguaCaliente')
            ? json['imgAguaCaliente']
            : null,
        boolAguaEmbotellada: json.containsKey('boolAguaEmbotellada')
            ? json['boolAguaEmbotellada']
            : false,
        imgAguaEmbotellada: json.containsKey('imgAguaEmbotellada')
            ? json['imgAguaEmbotellada']
            : null,
        boolAireAcondicionado: json.containsKey('boolAireAcondicionado')
            ? json['boolAireAcondicionado']
            : false,
        imgAireAcondicionado: json.containsKey('imgAireAcondicionado')
            ? json['imgAireAcondicionado']
            : null,
        boolAlfombra:
            json.containsKey('boolAlfombra') ? json['boolAlfombra'] : false,
        imgAlfombra: json.containsKey('imgAlfombra')
            ? json['imgAlfombra']
            : null,
        boolAlmohada:
            json.containsKey('boolAlmohada') ? json['boolAlmohada'] : false,
        imgAlmohada: json.containsKey('imgAlmohada')
            ? json['imgAlmohada']
            : null,
        boolBanioPrivado: json.containsKey('boolBanioPrivado')
            ? json['boolBanioPrivado']
            : false,
        imgBanioPrivado: json.containsKey('imgBanioPrivado')
            ? json['imgBanioPrivado']
            : null,
        boolCloset: json.containsKey('boolCloset') ? json['boolCloset'] : false,
        imgCloset:
            json.containsKey('imgCloset') ? json['imgCloset'] : null,
        boolEspejo: json.containsKey('boolEspejo') ? json['boolEspejo'] : false,
        imgEspejo:
            json.containsKey('imgEspejo') ? json['imgEspejo'] : null,
        boolIntercomunicador: json.containsKey('boolIntercomunicador')
            ? json['boolIntercomunicador']
            : false,
        imgIntercomunicador: json.containsKey('imgIntercomunicador')
            ? json['imgIntercomunicador']
            : null,
        boolKitAseoPersonal: json.containsKey('boolKitAseoPersonal')
            ? json['boolKitAseoPersonal']
            : false,
        imgKitAseoPersonal: json.containsKey('imgKitAseoPersonal')
            ? json['imgKitAseoPersonal']
            : null,
        boolKitLimpieza: json.containsKey('boolKitLimpieza')
            ? json['boolKitLimpieza']
            : false,
        imgKitLimpieza: json.containsKey('imgKitLimpieza')
            ? json['imgKitLimpieza']
            : null,
        boolLenceriaCama: json.containsKey('boolLenceriaCama')
            ? json['boolLenceriaCama']
            : false,
        imgLenceriaCama: json.containsKey('imgLenceriaCama')
            ? json['imgLenceriaCama']
            : null,
        boolLlave: json.containsKey('boolLlave') ? json['boolLlave'] : false,
        imgLlave:
            json.containsKey('imgLlave') ? json['imgLlave'] : null,
        boolPlanchador:
            json.containsKey('boolPlanchador') ? json['boolPlanchador'] : false,
        imgPlanchador: json.containsKey('imgPlanchador')
            ? json['imgPlanchador']
            : null,
        boolProtectorColchon: json.containsKey('boolProtectorColchon')
            ? json['boolProtectorColchon']
            : false,
        imgProtectorColchon: json.containsKey('imgProtectorColchon')
            ? json['imgProtectorColchon']
            : null,
        boolPuertaServicio: json.containsKey('boolPuertaServicio')
            ? json['boolPuertaServicio']
            : false,
        imgPuertaServicio: json.containsKey('imgPuertaServicio')
            ? json['imgPuertaServicio']
            : null,
        boolRefrigerador: json.containsKey('boolRefrigerador')
            ? json['boolRefrigerador']
            : false,
        imgRefrigerador: json.containsKey('imgRefrigerador')
            ? json['imgRefrigerador']
            : null,
        boolSalaStar:
            json.containsKey('boolSalaStar') ? json['boolSalaStar'] : false,
        imgSalaStar: json.containsKey('imgSalaStar')
            ? json['imgSalaStar']
            : null,
        boolSujetadorSabana: json.containsKey('boolSujetadorSabana')
            ? json['boolSujetadorSabana']
            : false,
        imgSujetadorSabana: json.containsKey('imgSujetadorSabana')
            ? json['imgSujetadorSabana']
            : null,
        boolTvCable:
            json.containsKey('boolTvCable') ? json['boolTvCable'] : false,
        imgTvCable: json.containsKey('imgTvCable')
            ? json['imgTvCable']
            : null,
        boolTvProyector: json.containsKey('boolTvProyector')
            ? json['boolTvProyector']
            : false,
        imgTvProyector: json.containsKey('imgTvProyector')
            ? json['imgTvProyector']
            : null,
        boolVentilador:
            json.containsKey('boolVentilador') ? json['boolVentilador'] : false,
        imgVentilador: json.containsKey('imgVentilador')
            ? json['imgVentilador']
            : null,
        boolVestidor:
            json.containsKey('boolVestidor') ? json['boolVestidor'] : false,
        imgVestidor: json.containsKey('imgVestidor')
            ? json['imgVestidor']
            : null,
        boolWifi: json.containsKey('boolWifi') ? json['boolWifi'] : false,
        imgWifi: json.containsKey('imgWifi') ? json['imgWifi'] : 'no-imgWifi',
        selCalidadAlmohada: json.containsKey('selCalidadAlmohada')
            ? json['selCalidadAlmohada']
            : 'no-selCalidadAlmohada',
        imgCalidadAlmohada: json.containsKey('imgCalidadAlmohada')
            ? json['imgCalidadAlmohada']
            : null,
        textCantidadAlmohada: json.containsKey('textCantidadAlmohada')
            ? json['textCantidadAlmohada']
            : 'no-textCantidadAlmohada',
        imgCantidadAlmohada: json.containsKey('imgCantidadAlmohada')
            ? json['imgCantidadAlmohada']
            : null,
        selMaterialCama: json.containsKey('selMaterialCama')
            ? json['selMaterialCama']
            : 'no-selMaterialCama',
        imgMaterialCama: json.containsKey('imgMaterialCama')
            ? json['imgMaterialCama']
            : null,
        selMedidaCama: json.containsKey('selMedidaCama')
            ? json['selMedidaCama']
            : 'no-selMedidaCama',
        imgMedidaCama: json.containsKey('imgMedidaCama')
            ? json['imgMedidaCama']
            : null,
        selTipoBanio: json.containsKey('selTipoBanio')
            ? json['selTipoBanio']
            : 'no-selTipoBanio',
        imgTipoBanio: json.containsKey('imgTipoBanio')
            ? json['imgTipoBanio']
            : null,
        selTipoColchon: json.containsKey('selTipoColchon')
            ? json['selTipoColchon']
            : 'no-selTipoColchon',
        imgTipoColchon: json.containsKey('imgTipoColchon')
            ? json['imgTipoColchon']
            : null,
        boolEstado: json.containsKey('boolEstado') ? json['boolEstado'] : false,
        usuario: Usuario.fromJson(
            json.containsKey('usuario') ? json['usuario'] : 'no-usuario'),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'imgHabitacion': imgHabitacion,
        'boolExhibidor': boolExhibidor,
        'imgExhibidor': imgExhibidor,
        'boolAguaCaliente': boolAguaCaliente,
        'imgAguaCaliente': imgAguaCaliente,
        'boolAireAcondicionado': boolAireAcondicionado,
        'imgAireAcondicionado': imgAireAcondicionado,
        'boolAlfombra': boolAlfombra,
        'imgAlfombra': imgAlfombra,
        'boolAlmohada': boolAlmohada,
        'imgAlmohada': imgAlmohada,
        'boolCloset': boolCloset,
        'imgCloset': imgCloset,
        'boolIntercomunicador': boolIntercomunicador,
        'imgIntercomunicador': imgIntercomunicador,
        'boolKitAseoPersonal': boolKitAseoPersonal,
        'imgKitAseoPersonal': imgKitAseoPersonal,
        'boolKitLimpieza': boolKitLimpieza,
        'imgKitLimpieza': imgKitLimpieza,
        'boolLenceriaCama': boolLenceriaCama,
        'imgLenceriaCama': imgLenceriaCama,
        'boolLlave': boolLlave,
        'imgLlave': imgLlave,
        'boolPlanchador': boolPlanchador,
        'imgPlanchador': imgPlanchador,
        'boolProtectorColchon': boolProtectorColchon,
        'imgProtectorColchon': imgProtectorColchon,
        'boolPuertaServicio': boolPuertaServicio,
        'imgPuertaServicio': imgPuertaServicio,
        'boolRefrigerador': boolRefrigerador,
        'imgRefrigerador': imgRefrigerador,
        'boolSalaStar': boolSalaStar,
        'imgSalaStar': imgSalaStar,
        'boolSujetadorSabana': boolSujetadorSabana,
        'imgSujetadorSabana': imgSujetadorSabana,
        'boolTvCable': boolTvCable,
        'imgTvCable': imgTvCable,
        'boolTvProyector': boolTvProyector,
        'imgTvProyector': imgTvProyector,
        'boolVentilador': boolVentilador,
        'imgVentilador': imgVentilador,
        'boolVestidor': boolVestidor,
        'imgVestidor': imgVestidor,
        'boolWifi': boolWifi,
        'imgWifi': imgWifi,
        'selCalidadAlmohada': selCalidadAlmohada,
        'imgCalidadAlmohada': imgCalidadAlmohada,
        'textCantidadAlmohada': textCantidadAlmohada,
        'imgCantidadAlmohada': imgCantidadAlmohada,
        'selMaterialCama': selMaterialCama,
        'imgMaterialCama': imgMaterialCama,
        'selMedidaCama': selMedidaCama,
        'imgMedidaCama': imgMedidaCama,
        'selTipoBanio': selTipoBanio,
        'imgTipoBanio': imgTipoBanio,
        'selTipoColchon': selTipoColchon,
        'imgTipoColchon': imgTipoColchon,
        'boolAguaEmbotellada': boolAguaEmbotellada,
        'imgAguaEmbotellada': imgAguaEmbotellada,
        'boolBanioPrivado': boolBanioPrivado,
        'imgBanioPrivado': imgBanioPrivado,
        'boolEspejo': boolEspejo,
        'imgEspejo': imgEspejo,
        'boolEstado': boolEstado,
        'usuario': usuario
      };

  String toJson() => json.encode(toMap());

  Habitacion copy() => Habitacion(
        id: id,
        imgHabitacion: imgHabitacion,
        boolExhibidor: boolExhibidor,
        imgExhibidor: imgExhibidor,
        boolAguaCaliente: boolAguaCaliente,
        imgAguaCaliente: imgAguaCaliente,
        boolAireAcondicionado: boolAireAcondicionado,
        imgAireAcondicionado: imgAireAcondicionado,
        boolAlfombra: boolAlfombra,
        imgAlfombra: imgAlfombra,
        boolAlmohada: boolAlmohada,
        imgAlmohada: imgAlmohada,
        boolCloset: boolCloset,
        imgCloset: imgCloset,
        boolIntercomunicador: boolIntercomunicador,
        imgIntercomunicador: imgIntercomunicador,
        boolKitAseoPersonal: boolKitAseoPersonal,
        imgKitAseoPersonal: imgKitAseoPersonal,
        boolKitLimpieza: boolKitLimpieza,
        imgKitLimpieza: imgKitLimpieza,
        boolLenceriaCama: boolLenceriaCama,
        imgLenceriaCama: imgLenceriaCama,
        boolLlave: boolLlave,
        imgLlave: imgLlave,
        boolPlanchador: boolPlanchador,
        imgPlanchador: imgPlanchador,
        boolProtectorColchon: boolProtectorColchon,
        imgProtectorColchon: imgProtectorColchon,
        boolPuertaServicio: boolPuertaServicio,
        imgPuertaServicio: imgPuertaServicio,
        boolRefrigerador: boolRefrigerador,
        imgRefrigerador: imgRefrigerador,
        boolSalaStar: boolSalaStar,
        imgSalaStar: imgSalaStar,
        boolSujetadorSabana: boolSujetadorSabana,
        imgSujetadorSabana: imgSujetadorSabana,
        boolTvCable: boolTvCable,
        imgTvCable: imgTvCable,
        boolTvProyector: boolTvProyector,
        imgTvProyector: imgTvProyector,
        boolVentilador: boolVentilador,
        imgVentilador: imgVentilador,
        boolVestidor: boolVestidor,
        imgVestidor: imgVestidor,
        boolWifi: boolWifi,
        imgWifi: imgWifi,
        selCalidadAlmohada: selCalidadAlmohada,
        imgCalidadAlmohada: imgCalidadAlmohada,
        textCantidadAlmohada: textCantidadAlmohada,
        imgCantidadAlmohada: imgCantidadAlmohada,
        selMaterialCama: selMaterialCama,
        imgMaterialCama: imgMaterialCama,
        selMedidaCama: selMedidaCama,
        imgMedidaCama: imgMedidaCama,
        selTipoBanio: selTipoBanio,
        imgTipoBanio: imgTipoBanio,
        selTipoColchon: selTipoColchon,
        imgTipoColchon: imgTipoColchon,
        boolAguaEmbotellada: boolAguaEmbotellada,
        imgAguaEmbotellada: imgAguaEmbotellada,
        boolBanioPrivado: boolBanioPrivado,
        imgBanioPrivado: imgBanioPrivado,
        boolEspejo: boolEspejo,
        imgEspejo: imgEspejo,
        boolEstado: boolEstado,
        usuario: usuario,
      );
}
