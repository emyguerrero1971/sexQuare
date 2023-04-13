import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/providers/providers.dart';

class InstalacionImageWidget extends StatelessWidget {
  const InstalacionImageWidget({
    super.key, 
    this.propiedad
  });

  final String? propiedad;

  @override
  Widget build(BuildContext context) {

    final instalacionForm = Provider.of<InstalacionFormProvider>(context);

    String? getPicture() {
      switch (propiedad) {
        case 'boolBar':
          return instalacionForm.instalacion.imgBar;
        case 'boolBanioPublico':
          return instalacionForm.instalacion.imgBanioPublico;
        case 'boolBeautySalom':
          return instalacionForm.instalacion.imgBeautySalom;
        case 'boolBuzonQS':
          return instalacionForm.instalacion.imgBuzonQS;
        case 'boolCajeroAutomatico':
          return instalacionForm.instalacion.imgCajeroAutomatico;
        case 'boolCine':
          return instalacionForm.instalacion.imgCine;
        case 'boolCircuitoCerrado':
          return instalacionForm.instalacion.imgCircuitoCerrado;
        case 'boolCostura':
          return instalacionForm.instalacion.imgCostura;
        case 'boolConcursos':
          return instalacionForm.instalacion.imgConcursos;
        case 'boolDiskJokey':
          return instalacionForm.instalacion.imgDiskJokey;
        case 'boolEfectos':
          return instalacionForm.instalacion.imgEfectos;
        case 'boolGimnacio':
          return instalacionForm.instalacion.imgGimnacio;
        case 'boolGuardia':
          return instalacionForm.instalacion.imgGuardia;
        case 'boolHidromasaje':
          return instalacionForm.instalacion.imgHidromasaje;
        case 'boolLaundry':
          return instalacionForm.instalacion.imgLaundry;
        case 'boolLuces':
          return instalacionForm.instalacion.imgLuces;
        case 'boolMiniHotel':
          return instalacionForm.instalacion.imgMiniHotel;
        case 'boolParqueo':
          return instalacionForm.instalacion.imgParqueo;
        case 'boolPiscina':
          return instalacionForm.instalacion.imgPiscina;
        case 'boolPoledance':
          return instalacionForm.instalacion.imgPoledance;
        case 'boolReservado':
          return instalacionForm.instalacion.imgReservado;
        case 'boolRestaurant':
          return instalacionForm.instalacion.imgRestaurant;
        case 'boolSalaFumadores':
          return instalacionForm.instalacion.imgSalaFumadores;
        case 'boolSalaVip':
          return instalacionForm.instalacion.imgSalaVip;
        case 'boolSauna':
          return instalacionForm.instalacion.imgSauna;
        case 'boolShows':
          return instalacionForm.instalacion.imgShows;
        case 'boolTaxi':
          return instalacionForm.instalacion.imgTaxi;
        case 'boolTienda':
          return instalacionForm.instalacion.imgTienda;
        case 'boolTurco':
          return instalacionForm.instalacion.imgTurco;
        case 'boolVendingSnacks':
          return instalacionForm.instalacion.imgVendingSnacks;
        case 'boolVendingBebidas':
          return instalacionForm.instalacion.imgVendingBebidas;
        case 'boolWifi':
          return instalacionForm.instalacion.imgWifi;
        default:
          return instalacionForm.instalacion.imgInstalacion;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 200,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: getImage(getPicture())
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.black,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 5))
  ]);

  Widget getImage(String? imagen) {
    if (imagen == null) {
      return const Image(
        image: AssetImage('assets/pngs/no-image.png'), 
        fit: BoxFit.cover);
    }

    if (imagen.startsWith('http')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/pngs/no-image.png'),
        image: NetworkImage(imagen),
        fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(imagen),
      fit: BoxFit.cover,
    );
  }
}
