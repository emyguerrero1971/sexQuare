import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

class InstalacionWidget extends StatelessWidget {
  const InstalacionWidget({super.key, required this.instalacion});

  final Instalacion instalacion;

  @override
  Widget build(BuildContext context) {
    final instalacionesService = Provider.of<InstalacionesService>(context);
    instalacionesService.copyRegistroInstalacion =
        instalacionesService.instalaciones[0].copy();
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
                _BackgroundImage(instalacion.imgInstalacion),
                Positioned(
                  top: 75,
                  right: -10,
                  child: IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'detalleInstalacion', arguments: ScreenArguments('imgInstalacion', 'nulo', instalacion.imgInstalacion)),
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
        _Propiedades(instalacion: instalacion)
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

  const _Propiedades({required this.instalacion});

  final Instalacion instalacion;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> objeto = [
      {
        'nombre': 'Barra Shop Bar',
        'propiedad': 'boolBar',
        'tipo': 'bool',
        'valor': (instalacion.boolBar) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgBar,
      },
      {
        'nombre': 'Baño Público',
        'propiedad': 'boolBanioPublico',
        'tipo': 'bool',
        'valor': (instalacion.boolBanioPublico) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgBanioPublico,
      },
      {
        'nombre': 'Beauty Salom',
        'propiedad': 'boolBeautySalom',
        'tipo': 'bool',
        'valor': (instalacion.boolBeautySalom) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgBeautySalom,
      },
      {
        'nombre': 'Buzón de quejas y sugerencias',
        'propiedad': 'boolBuzonQS',
        'tipo': 'bool',
        'valor': (instalacion.boolBuzonQS) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgBuzonQS,
      },
      {
        'nombre': 'Cajero automático',
        'propiedad': 'boolCajeroAutomatico',
        'tipo': 'bool',
        'valor': (instalacion.boolCajeroAutomatico) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgCajeroAutomatico,
      },
      {
        'nombre': 'Cine - Proyector',
        'propiedad': 'boolBanioPublico',
        'tipo': 'bool',
        'valor': (instalacion.boolCine) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgCine,
      },
      {
        'nombre': 'Circuito cerrado',
        'propiedad': 'boolCircuitoCerrado',
        'tipo': 'bool',
        'valor': (instalacion.boolCircuitoCerrado) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgCircuitoCerrado,
      },
      {
        'nombre': 'Cuarto de costura',
        'propiedad': 'boolCostura',
        'tipo': 'bool',
        'valor': (instalacion.boolCostura) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgCostura,
      },
      {
        'nombre': 'Concursos',
        'propiedad': 'boolConcursos',
        'tipo': 'bool',
        'valor': (instalacion.boolConcursos) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgConcursos,
      },
      {
        'nombre': 'DiskJokey',
        'propiedad': 'boolDiskJokey',
        'tipo': 'bool',
        'valor': (instalacion.boolDiskJokey) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgDiskJokey,
      },
      {
        'nombre': 'Efectos',
        'propiedad': 'boolEfectos',
        'tipo': 'bool',
        'valor': (instalacion.boolEfectos) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgEfectos,
      },
      {
        'nombre': 'Gimnacio',
        'propiedad': 'boolBanioPublico',
        'tipo': 'bool',
        'valor': (instalacion.boolBanioPublico) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgBanioPublico,
      },
      {
        'nombre': 'Guardia privada',
        'propiedad': 'boolGuardia',
        'tipo': 'bool',
        'valor': (instalacion.boolGuardia) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgGuardia,
      },
      {
        'nombre': 'Hidromasaje',
        'propiedad': 'boolHidromasaje',
        'tipo': 'bool',
        'valor': (instalacion.boolHidromasaje) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgHidromasaje,
      },
      {
        'nombre': 'Laundry',
        'propiedad': 'boolLaundry',
        'tipo': 'bool',
        'valor': (instalacion.boolLaundry) ? 'Disponible' : 'No Disponible',
        'img': instalacion.boolLaundry,
      },
      {
        'nombre': 'Luces',
        'propiedad': 'boolLuces',
        'tipo': 'bool',
        'valor': (instalacion.boolLuces) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgLuces,
      },
      {
        'nombre': 'Mini Hotel',
        'propiedad': 'boolMiniHotel',
        'tipo': 'bool',
        'valor': (instalacion.boolMiniHotel) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgMiniHotel,
      },
      {
        'nombre': 'Parqueo privado',
        'propiedad': 'boolParqueo',
        'tipo': 'bool',
        'valor': (instalacion.boolParqueo) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgParqueo,
      },
      {
        'nombre': 'Piscina',
        'propiedad': 'boolPiscina',
        'tipo': 'bool',
        'valor': (instalacion.boolPiscina) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgPiscina,
      },
      {
        'nombre': 'Poledance',
        'propiedad': 'boolPoledance',
        'tipo': 'bool',
        'valor': (instalacion.boolPoledance) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgPoledance,
      },
      {
        'nombre': 'Espacios Reservados',
        'propiedad': 'boolReservado',
        'tipo': 'bool',
        'valor': (instalacion.boolReservado) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgReservado,
      },
      {
        'nombre': 'Restaurant',
        'propiedad': 'boolRestaurant',
        'tipo': 'bool',
        'valor': (instalacion.boolRestaurant) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgRestaurant,
      },
      {
        'nombre': 'Sala para fumadores',
        'propiedad': 'boolSalaFumadores',
        'tipo': 'bool',
        'valor': (instalacion.boolSalaFumadores) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgSalaFumadores,
      },
      {
        'nombre': 'Sala Vip',
        'propiedad': 'boolSalaVip',
        'tipo': 'bool',
        'valor': (instalacion.boolSalaVip) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgSalaVip,
      },
      {
        'nombre': 'Sauna',
        'propiedad': 'boolSauna',
        'tipo': 'bool',
        'valor': (instalacion.boolSauna) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgSauna,
      },
      {
        'nombre': 'Shows',
        'propiedad': 'boolShows',
        'tipo': 'bool',
        'valor': (instalacion.boolShows) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgShows,
      },
      {
        'nombre': 'Servicio de Taxi',
        'propiedad': 'boolTaxi',
        'tipo': 'bool',
        'valor': (instalacion.boolTaxi) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgTaxi,
      },
      {
        'nombre': 'Tienda',
        'propiedad': 'boolTienda',
        'tipo': 'bool',
        'valor': (instalacion.boolTienda) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgTienda,
      },
      {
        'nombre': 'Turco',
        'propiedad': 'boolTurco',
        'tipo': 'bool',
        'valor': (instalacion.boolTurco) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgTurco,
      },
      {
        'nombre': 'Expendedora de Snacks',
        'propiedad': 'boolVendingSnacks',
        'tipo': 'bool',
        'valor': (instalacion.boolVendingSnacks) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgVendingSnacks,
      },
      {
        'nombre': 'Expendedora de bebidas',
        'propiedad': 'boolVendingBebidas',
        'tipo': 'bool',
        'valor': (instalacion.boolVendingBebidas) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgVendingBebidas,
      },
      {
        'nombre': 'Wifi',
        'propiedad': 'boolWifi',
        'tipo': 'bool',
        'valor': (instalacion.boolWifi) ? 'Disponible' : 'No Disponible',
        'img': instalacion.imgWifi,
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
            onTap: () => Navigator.pushNamed(context, 'detalleInstalacion',
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
      child:
          SizedBox(width: double.infinity, height: 200.0, child: getImage(url)),
    );
  }

  Widget getImage(String? imagen) {
    if (imagen == null) {
      return const Image(
          image: AssetImage('assets/pngs/no-image.png'), fit: BoxFit.cover);
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
