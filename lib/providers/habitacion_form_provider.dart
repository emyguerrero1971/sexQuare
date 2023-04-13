import 'package:flutter/material.dart';
import 'package:sexquare/models/models.dart';

class HabitacionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Habitacion habitacion;

  HabitacionFormProvider(this.habitacion);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool activity = false;

  existeActividad() {
    activity = true;
    notifyListeners();
  }

  updateImagePropiedad(String value, String propiedad) {
    switch (propiedad) {
      case 'imgAguaCaliente':
        habitacion.imgAguaCaliente = value;
        break;
      case 'imgAguaEmbotellada':
        habitacion.imgAguaEmbotellada = value;
        break;
      case 'imgAireAcondicionado':
        habitacion.imgAireAcondicionado = value;
        break;
      case 'imgAlfombra':
        habitacion.imgAlfombra = value;
        break;
      case 'imgAlmohada':
        habitacion.imgAlmohada = value;
        break;
      case 'imgBanioPrivado':
        habitacion.imgBanioPrivado = value;
        break;
      case 'imgCloset':
        habitacion.imgCloset = value;
        break;
      case 'imgEspejo':
        habitacion.imgEspejo = value;
        break;
      case 'imgExhibidor':
        habitacion.imgExhibidor = value;
        break;
      case 'imgIntercomunicador':
        habitacion.imgIntercomunicador = value;
        break;
      case 'imgKitAseoPersonal':
        habitacion.imgKitAseoPersonal = value;
        break;
      case 'imgKitLimpieza':
        habitacion.imgKitLimpieza = value;
        break;
      case 'imgLenceriaCama':
        habitacion.imgLenceriaCama = value;
        break;
      case 'imgLlave':
        habitacion.imgLlave = value;
        break;
      case 'imgPlanchador':
        habitacion.imgPlanchador = value;
        break;
      case 'imgProtectorColchon':
        habitacion.imgProtectorColchon = value;
        break;
      case 'imgPuertaServicio':
        habitacion.imgPuertaServicio = value;
        break;
      case 'imgRefrigerador':
        habitacion.imgRefrigerador = value;
        break;
      case 'imgSalaStar':
        habitacion.imgSalaStar = value;
        break;
      case 'imgSujetadorSabana':
        habitacion.imgSujetadorSabana = value;
        break;
      case 'imgTvCable':
        habitacion.imgTvCable = value;
        break;
      case 'imgTvProyector':
        habitacion.imgTvProyector = value;
        break;
      case 'imgVentilador':
        habitacion.imgVentilador = value;
        break;
      case 'imgVestidor':
        habitacion.imgVestidor = value;
        break;
      case 'imgWifi':
        habitacion.imgWifi = value;
        break;
      case 'imgCalidadAlmohada':
        habitacion.imgCalidadAlmohada = value;
        break;
      case 'imgCantidadAlmohada':
        habitacion.imgCantidadAlmohada = value;
        break;
      case 'imgMaterialCama':
        habitacion.imgMaterialCama = value;
        break;
      case 'imgMedidaCama':
        habitacion.imgMedidaCama = value;
        break;
      case 'imgTipoBanio':
        habitacion.imgTipoBanio = value;
        break;
      case 'imgTipoColchon':
        habitacion.imgTipoColchon = value;
        break;
      default:
        habitacion.imgHabitacion = value;
    }
    notifyListeners();
  }

  updateSwitchPropiedad(String value, String propiedad) {
    switch (propiedad) {
      case 'boolAguaCaliente':
        habitacion.boolAguaCaliente = value.toLowerCase() == 'true';
        break;
      case 'boolAguaEmbotellada':
        habitacion.boolAguaEmbotellada = value.toLowerCase() == 'true';
        break;
      case 'boolAireAcondicionado':
        habitacion.boolAireAcondicionado = value.toLowerCase() == 'true';
        break;
      case 'boolAlfombra':
        habitacion.boolAlfombra = value.toLowerCase() == 'true';
        break;
      case 'boolAlmohada':
        habitacion.boolAlmohada = value.toLowerCase() == 'true';
        break;
      case 'boolBanioPrivado':
        habitacion.boolBanioPrivado = value.toLowerCase() == 'true';
        break;
      case 'boolCloset':
        habitacion.boolCloset = value.toLowerCase() == 'true';
        break;
      case 'boolEspejo':
        habitacion.boolEspejo = value.toLowerCase() == 'true';
        break;
      case 'boolExhibidor':
        habitacion.boolExhibidor = value.toLowerCase() == 'true';
        break;
      case 'boolIntercomunicador':
        habitacion.boolIntercomunicador = value.toLowerCase() == 'true';
        break;
      case 'boolKitAseoPersonal':
        habitacion.boolKitAseoPersonal = value.toLowerCase() == 'true';
        break;
      case 'boolKitLimpieza':
        habitacion.boolKitLimpieza = value.toLowerCase() == 'true';
        break;
      case 'boolLenceriaCama':
        habitacion.boolLenceriaCama = value.toLowerCase() == 'true';
        break;
      case 'boolLlave':
        habitacion.boolLlave = value.toLowerCase() == 'true';
        break;
      case 'boolPlanchador':
        habitacion.boolPlanchador = value.toLowerCase() == 'true';
        break;
      case 'boolProtectorColchon':
        habitacion.boolProtectorColchon = value.toLowerCase() == 'true';
        break;
      case 'boolPuertaServicio':
        habitacion.boolPuertaServicio = value.toLowerCase() == 'true';
        break;
      case 'boolRefrigerador':
        habitacion.boolRefrigerador = value.toLowerCase() == 'true';
        break;
      case 'boolSalaStar':
        habitacion.boolSalaStar = value.toLowerCase() == 'true';
        break;
      case 'boolSujetadorSabana':
        habitacion.boolSujetadorSabana = value.toLowerCase() == 'true';
        break;
      case 'boolTvCable':
        habitacion.boolTvCable = value.toLowerCase() == 'true';
        break;
      case 'boolTvProyector':
        habitacion.boolTvProyector = value.toLowerCase() == 'true';
        break;
      case 'boolVentilador':
        habitacion.boolVentilador = value.toLowerCase() == 'true';
        break;
      case 'boolVestidor':
        habitacion.boolVestidor = value.toLowerCase() == 'true';
        break;
      case 'boolWifi':
        habitacion.boolWifi = value.toLowerCase() == 'true';
        break;
      case 'selCalidadAlmohada':
        habitacion.selCalidadAlmohada = value;
        break;
      case 'textCantidadAlmohada':
        habitacion.textCantidadAlmohada = value;
        break;
      case 'selMaterialCama':
        habitacion.selMaterialCama = value;
        break;
      case 'selMedidaCama':
        habitacion.selMedidaCama = value;
        break;
      case 'selTipoBanio':
        habitacion.selTipoBanio = value;
        break;
      case 'selTipoColchon':
        habitacion.selTipoColchon = value;
        break;
    }
    notifyListeners();
  }
}
