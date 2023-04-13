import 'package:flutter/material.dart';
import 'package:sexquare/models/models.dart';

class InstalacionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Instalacion instalacion;

  InstalacionFormProvider(this.instalacion);

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
      case 'imgBar':
        instalacion.imgBar = value;
        break;
      case 'imgBanioPublico':
        instalacion.imgBanioPublico = value;
        break;
      case 'imgBeautySalom':
        instalacion.imgBeautySalom = value;
        break;
      case 'imgBuzonQS':
        instalacion.imgBuzonQS = value;
        break;
      case 'imgCajeroAutomatico':
        instalacion.imgCajeroAutomatico = value;
        break;
      case 'imgCine':
        instalacion.imgCine = value;
        break;
      case 'imgCircuitoCerrado':
        instalacion.imgCircuitoCerrado = value;
        break;
      case 'imgCostura':
        instalacion.imgCostura = value;
        break;
      case 'imgConcursos':
        instalacion.imgConcursos = value;
        break;
      case 'imgDiskJokey':
        instalacion.imgDiskJokey = value;
        break;
      case 'imgEfectos':
        instalacion.imgEfectos = value;
        break;
      case 'imgGimnacio':
        instalacion.imgGimnacio = value;
        break;
      case 'imgGuardia':
        instalacion.imgGuardia = value;
        break;
      case 'imgHidromasaje':
        instalacion.imgHidromasaje = value;
        break;
      case 'imgLaundry':
        instalacion.imgLaundry = value;
        break;
      case 'imgLuces':
        instalacion.imgLuces = value;
        break;
      case 'imgMiniHotel':
        instalacion.imgMiniHotel = value;
        break;
      case 'imgParqueo':
        instalacion.imgParqueo = value;
        break;
      case 'imgPiscina':
        instalacion.imgPiscina = value;
        break;
      case 'imgPoledance':
        instalacion.imgPoledance = value;
        break;
      case 'imgReservado':
        instalacion.imgReservado = value;
        break;
      case 'imgRestaurant':
        instalacion.imgRestaurant = value;
        break;
      case 'imgSalaFumadores':
        instalacion.imgSalaFumadores = value;
        break;
      case 'imgSalaVip':
        instalacion.imgSalaVip = value;
        break;
      case 'imgSauna':
        instalacion.imgSauna = value;
        break;
      case 'imgShows':
        instalacion.imgShows = value;
        break;
      case 'imgTaxi':
        instalacion.imgTaxi = value;
        break;
      case 'imgTienda':
        instalacion.imgTienda = value;
        break;
      case 'imgTurco':
        instalacion.imgTurco = value;
        break;
      case 'imgVendingSnacks':
        instalacion.imgVendingSnacks = value;
        break;
      case 'imgVendingBebidas':
        instalacion.imgVendingBebidas = value;
        break;
      case 'imgWifi':
        instalacion.imgWifi = value;
        break;
      default:
        instalacion.imgInstalacion = value;
    }
    notifyListeners();
  }

  updateSwitchPropiedad(bool value, String propiedad) {
    switch (propiedad) {
      case 'boolBar':
        instalacion.boolBar = value;
        break;
      case 'boolBanioPublico':
        instalacion.boolBanioPublico = value;
        break;
      case 'boolBeautySalom':
        instalacion.boolBeautySalom = value;
        break;
      case 'boolBuzonQS':
        instalacion.boolBuzonQS = value;
        break;
      case 'boolCajeroAutomatico':
        instalacion.boolCajeroAutomatico = value;
        break;
      case 'boolCine':
        instalacion.boolCine = value;
        break;
      case 'boolCircuitoCerrado':
        instalacion.boolCircuitoCerrado = value;
        break;
      case 'boolCostura':
        instalacion.boolCostura = value;
        break;
      case 'boolConcursos':
        instalacion.boolConcursos = value;
        break;
      case 'boolDiskJokey':
        instalacion.boolDiskJokey = value;
        break;
      case 'boolEfectos':
        instalacion.boolEfectos = value;
        break;
      case 'boolGimnacio':
        instalacion.boolGimnacio = value;
        break;
      case 'boolGuardia':
        instalacion.boolGuardia = value;
        break;
      case 'boolHidromasaje':
        instalacion.boolHidromasaje = value;
        break;
      case 'boolLaundry':
        instalacion.boolLaundry = value;
        break;
      case 'boolLuces':
        instalacion.boolLuces = value;
        break;
      case 'boolMiniHotel':
        instalacion.boolMiniHotel = value;
        break;
      case 'boolParqueo':
        instalacion.boolParqueo = value;
        break;
      case 'boolPiscina':
        instalacion.boolPiscina = value;
        break;
      case 'boolPoledance':
        instalacion.boolPoledance = value;
        break;
      case 'boolReservado':
        instalacion.boolReservado = value;
        break;
      case 'boolRestaurant':
        instalacion.boolRestaurant = value;
        break;
      case 'boolSalaFumadores':
        instalacion.boolSalaFumadores = value;
        break;
      case 'boolSalaVip':
        instalacion.boolSalaVip = value;
        break;
      case 'boolSauna':
        instalacion.boolSauna = value;
        break;
      case 'boolShows':
        instalacion.boolShows = value;
        break;
      case 'boolTaxi':
        instalacion.boolTaxi = value;
        break;
      case 'boolTienda':
        instalacion.boolTienda = value;
        break;
      case 'boolTurco':
        instalacion.boolTurco = value;
        break;
      case 'boolVendingSnacks':
        instalacion.boolVendingSnacks = value;
        break;
      case 'boolVendingBebidas':
        instalacion.boolVendingBebidas = value;
        break;
      case 'boolWifi':
        instalacion.boolWifi = value;
        break;
    }
    notifyListeners();
  }
}
