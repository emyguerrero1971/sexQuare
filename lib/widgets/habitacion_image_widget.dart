import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/providers/providers.dart';

class HabitacionImageWidget extends StatelessWidget {
  const HabitacionImageWidget({
    super.key, 
    this.propiedad
  });

  final String? propiedad;

  @override
  Widget build(BuildContext context) {

    final habitacionForm = Provider.of<HabitacionFormProvider>(context);

    String? getPicture() {
      switch (propiedad) {
        case 'boolAguaCaliente':
          return habitacionForm.habitacion.imgAguaCaliente;
        case 'boolAguaEmbotellada':
          return habitacionForm.habitacion.imgAguaEmbotellada;
        case 'boolAireAcondicionado':
          return habitacionForm.habitacion.imgAireAcondicionado;
        case 'boolAlfombra':
          return habitacionForm.habitacion.imgAlfombra;
        case 'boolAlmohada':
          return habitacionForm.habitacion.imgAlmohada;
        case 'boolBanioPrivado':
          return habitacionForm.habitacion.imgBanioPrivado;
        case 'boolCloset':
          return habitacionForm.habitacion.imgCloset;
        case 'boolEspejo':
          return habitacionForm.habitacion.imgEspejo;
        case 'boolExhibidor':
          return habitacionForm.habitacion.imgExhibidor;
        case 'boolIntercomunicador':
          return habitacionForm.habitacion.imgIntercomunicador;
        case 'boolKitAseoPersonal':
          return habitacionForm.habitacion.imgKitAseoPersonal;
        case 'boolKitLimpieza':
          return habitacionForm.habitacion.imgKitLimpieza;
        case 'boolLenceriaCama':
          return habitacionForm.habitacion.imgLenceriaCama;
        case 'boolLlave':
          return habitacionForm.habitacion.imgLlave;
        case 'boolPlanchador':
          return habitacionForm.habitacion.imgPlanchador;
        case 'boolProtectorColchon':
          return habitacionForm.habitacion.imgProtectorColchon;
        case 'boolPuertaServicio':
          return habitacionForm.habitacion.imgPuertaServicio;
        case 'boolRefrigerador':
          return habitacionForm.habitacion.imgRefrigerador;
        case 'boolSalaStar':
          return habitacionForm.habitacion.imgSalaStar;
        case 'boolSujetadorSabana':
          return habitacionForm.habitacion.imgSujetadorSabana;
        case 'boolTvCable':
          return habitacionForm.habitacion.imgTvCable;
        case 'boolTvProyector':
          return habitacionForm.habitacion.imgTvProyector;
        case 'boolVentilador':
          return habitacionForm.habitacion.imgVentilador;
        case 'boolVestidor':
          return habitacionForm.habitacion.imgVestidor;
        case 'boolWifi':
          return habitacionForm.habitacion.imgWifi;
        case 'selCalidadAlmohada':
          return habitacionForm.habitacion.imgCalidadAlmohada;
        case 'selMaterialCama':
          return habitacionForm.habitacion.imgMaterialCama;
        case 'selMedidaCama':
          return habitacionForm.habitacion.imgMedidaCama;
        case 'selTipoBanio':
          return habitacionForm.habitacion.imgTipoBanio;
        case 'selTipoColchon':
          return habitacionForm.habitacion.imgTipoColchon;
        case 'textCantidadAlmohada':
          return habitacionForm.habitacion.imgCantidadAlmohada;
        default:
          return habitacionForm.habitacion.imgHabitacion;
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
