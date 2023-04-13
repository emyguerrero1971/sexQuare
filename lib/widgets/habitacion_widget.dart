import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

class HabitacionWidget extends StatelessWidget {
  const HabitacionWidget({super.key, required this.habitacion});

  final Habitacion habitacion;

  @override
  Widget build(BuildContext context) {
    final habitacionesService = Provider.of<HabitacionesService>(context);
    habitacionesService.copyRegistroHabitacion =
                    habitacionesService.habitaciones[0].copy();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            margin: const EdgeInsets.only(top: 15.0, bottom: 20.0),
            width: double.infinity,
            height: 200.0,
            decoration: _cardBorders(),
            child: Stack(
              children: [
                 _BackgroundImage(habitacion.imgHabitacion),
                Positioned(
                  top: 75,
                  right: -10,
                  child: IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'detalleHabitacion', arguments: ScreenArguments( 'imgHabitacion', 'nulo', habitacion.imgHabitacion)),
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
        _Propiedades(habitacion: habitacion)
      ],
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]);
}

class _Propiedades extends StatelessWidget {

  const _Propiedades({required this.habitacion});

  final Habitacion habitacion;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> objeto = [
      {
        'nombre': 'Agua Caliente',
        'propiedad': 'boolAguaCaliente',
        'tipo': 'bool',
        'valor': (habitacion.boolAguaCaliente) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgAguaCaliente,
      },
      {
        'nombre': 'Agua embotellada',
        'propiedad': 'boolAguaEmbotellada',
        'tipo': 'bool',
        'valor': (habitacion.boolAguaEmbotellada) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgAguaEmbotellada,
      },
      {
        'nombre': 'Aire acondicionado',
        'propiedad': 'boolAireAcondicionado',
        'tipo': 'bool',
        'valor': (habitacion.boolAireAcondicionado) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgAireAcondicionado,
      },
      {
        'nombre': 'Alfombra',
        'propiedad': 'boolAlfombra',
        'tipo': 'bool',
        'valor': (habitacion.boolAlfombra) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgAlfombra,
      },
      {
        'nombre': 'Almohada',
        'propiedad': 'boolAlmohada',
        'tipo': 'bool',
        'valor': (habitacion.boolAlmohada) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgAlmohada,
      },
      {
        'nombre': 'Baño privado',
        'propiedad': 'boolBanioPrivado',
        'tipo': 'bool',
        'valor': (habitacion.boolBanioPrivado) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgBanioPrivado,
      },
      {
        'nombre': 'Closet',
        'propiedad': 'boolCloset',
        'tipo': 'bool',
        'valor': (habitacion.boolCloset) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgCloset,
      },
      {
        'nombre': 'Espejo',
        'propiedad': 'boolEspejo',
        'tipo': 'bool',
        'valor': (habitacion.boolEspejo) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgEspejo,
      },
      {
        'nombre': 'Exhibidor',
        'propiedad': 'boolExhibidor',
        'tipo': 'bool',
        'valor': (habitacion.boolExhibidor) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgExhibidor,
      },
      {
        'nombre': 'Intercomunicador',
        'propiedad': 'boolIntercomunicador',
        'tipo': 'bool',
        'valor': (habitacion.boolIntercomunicador) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgIntercomunicador,
      },
      {
        'nombre': 'Kit Aseo Personal',
        'propiedad': 'boolKitAseoPersonal',
        'tipo': 'bool',
        'valor': (habitacion.boolKitAseoPersonal) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgKitAseoPersonal,
      },
      {
        'nombre': 'Kit Limpieza habitación',
        'propiedad': 'boolKitLimpieza',
        'tipo': 'bool',
        'valor': (habitacion.boolKitLimpieza) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgKitLimpieza,
      },
      {
        'nombre': 'Lencería de cama',
        'propiedad': 'boolLenceriaCama',
        'tipo': 'bool',
        'valor': (habitacion.boolLenceriaCama) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgLenceriaCama,
      },
      {
        'nombre': 'Habitación llave personal',
        'propiedad': 'boolLlave',
        'tipo': 'bool',
        'valor': (habitacion.boolLlave) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgLlave,
      },
      {
        'nombre': 'Planchador',
        'propiedad': 'boolPlanchador',
        'tipo': 'bool',
        'valor': (habitacion.boolPlanchador) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgPlanchador,
      },
      {
        'nombre': 'Protector de colchón',
        'propiedad': 'boolProtectorColchon',
        'tipo': 'bool',
        'valor': (habitacion.boolProtectorColchon) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgProtectorColchon,
      },
      {
        'nombre': 'Puerta de servicio',
        'propiedad': 'boolPuertaServicio',
        'tipo': 'bool',
        'valor': (habitacion.boolPuertaServicio) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgPuertaServicio,
      },
      {
        'nombre': 'Mini nevera',
        'propiedad': 'boolRefrigerador',
        'tipo': 'bool',
        'valor': (habitacion.boolRefrigerador) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgRefrigerador,
      },
      {
        'nombre': 'Sala de star',
        'propiedad': 'boolSalaStar',
        'tipo': 'bool',
        'valor': (habitacion.boolSalaStar) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgSalaStar,
      },
      {
        'nombre': 'Sujetador de sábana',
        'propiedad': 'boolSujetadorSabana',
        'tipo': 'bool',
        'valor': (habitacion.boolSujetadorSabana) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgSujetadorSabana,
      },
      {
        'nombre': 'TvCable',
        'propiedad': 'boolTvCable',
        'tipo': 'bool',
        'valor': (habitacion.boolTvCable) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgTvCable,
      },
      {
        'nombre': 'Tv - Proyector',
        'propiedad': 'boolTvProyector',
        'tipo': 'bool',
        'valor': (habitacion.boolTvProyector) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgTvProyector,
      },
      {
        'nombre': 'Ventilador',
        'propiedad': 'boolVentilador',
        'tipo': 'bool',
        'valor': (habitacion.boolVentilador) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgVentilador,
      },
      {
        'nombre': 'Vestidor',
        'propiedad': 'boolVestidor',
        'tipo': 'bool',
        'valor': (habitacion.boolVestidor) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgVestidor,
      },
      {
        'nombre': 'Wifi',
        'propiedad': 'boolWifi',
        'tipo': 'bool',
        'valor': (habitacion.boolWifi) ? 'Disponible' : 'No Disponible',
        'img': habitacion.imgWifi,
      },
      {
        'nombre': 'Calidad almohada(s)',
        'propiedad': 'selCalidadAlmohada',
        'tipo': 'sel',
        'valor': (habitacion.selCalidadAlmohada == 'M') 
                    ? 'Media' 
                    : (habitacion.selCalidadAlmohada == 'A') 
                    ? 'Alta'
                    : 'Superior',
        'img': habitacion.imgCalidadAlmohada,
      },
      {
        'nombre': 'Material cama',
        'propiedad': 'selMaterialCama',
        'tipo': 'sel',
        'valor': (habitacion.selMaterialCama == 'H') 
                    ? 'Hormigón' 
                    : (habitacion.selMaterialCama == 'M') 
                    ? 'Madera'
                    : 'Metal',
        'img': habitacion.imgMaterialCama,
      },
      {
        'nombre': 'Medidas cama',
        'propiedad': 'selMedidaCama',
        'tipo': 'sel',
        'valor': (habitacion.selMedidaCama == 'C') 
                    ? 'Plaza un cuarto' 
                    : (habitacion.selMedidaCama == 'M') 
                    ? 'Plaza y media'
                    : 'Doble plazal',
        'img': habitacion.imgMedidaCama,
      },
      {
        'nombre': 'Tipo de Baño',
        'propiedad': 'selTipoBanio',
        'tipo': 'sel',
        'valor': (habitacion.selTipoBanio == 'S') 
                    ? 'Simple' 
                    : 'Completo',
        'img': habitacion.imgTipoBanio,
      },
      {
        'nombre': 'Calidad colchón',
        'propiedad': 'selTipoColchon',
        'tipo': 'sel',
        'valor': (habitacion.selTipoColchon == 'M') 
                    ? 'Media' 
                    : (habitacion.selTipoColchon == 'A') 
                    ? 'Alta'
                    : 'Superior',
        'img': habitacion.imgTipoColchon,
      },
      {
        'nombre': 'Cantidad almohadas',
        'propiedad': 'textCantidadAlmohada',
        'tipo': 'text',
        'valor': habitacion.textCantidadAlmohada,
        'img': habitacion.imgCantidadAlmohada,
      }
    ];

    return Column(
      children: [
        for(int x = 0; x<objeto.length ; x++)...[
          ListTile(
            tileColor: (x % 2 == 0) ? const Color.fromRGBO(179, 10, 49, 0.30) : null,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(objeto[x]['nombre']!)),
              ],
            ),
            trailing: FractionallySizedBox(
              widthFactor: 0.7,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Expanded(
                      child: Text("${objeto[x]['valor']}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'detalleHabitacion',
                arguments:
                    ScreenArguments(objeto[x]['propiedad'], objeto[x]['tipo'], objeto[x]['valor']))),
        ],
      ],
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        height: 200.0,
        child: getImage(url)
      ),
    );
  }

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