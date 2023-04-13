import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/arguments/arguments_screen.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class LocalWidget extends StatelessWidget {
  const LocalWidget({super.key, required this.local});

  final Local local;

  @override
  Widget build(BuildContext context) {
    final localesService = Provider.of<LocalesService>(context);
    localesService.copyRegistroLocal = localesService.locales[0].copy();
    const duration = Duration(milliseconds: 300);
    
    return Column(
      children: [
        Center(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: duration,
                    reverseTransitionDuration: duration,
                    pageBuilder: (context, animation, _) {
                      return FadeTransition(
                        opacity: animation,
                        child: const ImgFullScreen(),
                      );
                    },
                  ),
                );
              },
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: CircleAvatar(
                            radius: 100.0,
                            backgroundColor:
                                const Color.fromRGBO(179, 10, 49, 0.30),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  child: CircleAvatar(
                                      backgroundColor: AppTheme.primaryColorApp,
                                      radius: 95.0,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          child: SizedBox(
                                            width: 300,
                                            height: 300,
                                            child: getImage(Preferences.img),
                                          )))),
                            )),
                      )),
                ),
                Positioned(
                  top: 85,
                  right: 5,
                  child: IconButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, 'detalleLocal',
                          arguments: ScreenArguments(
                              'imgLocal', 'img', Preferences.img));
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.black45,
                    iconSize: 24,
                  ),
                ),
              ])),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 10.0, bottom: 6.0),
          child: Text(
            'Acerca del Local',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        _Propiedades(local: local)
      ],
    );
  }
}

class _Propiedades extends StatelessWidget {
  const _Propiedades({required this.local});

  final Local local;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> objeto = [
      {
        'nombre': 'Nombre del local',
        'propiedad': 'textDescripcion',
        'tipo': 'text',
        'valor': local.textDescripcion,
        'img': 'nulo',
      },
      {
        'nombre': 'Dirección',
        'propiedad': 'textDireccion',
        'tipo': 'text',
        'valor': local.textDireccion,
        'img': 'nulo',
      },
      {
        'nombre': 'Nro. habitaciones',
        'propiedad': 'entHabitaciones',
        'tipo': 'ent',
        'valor': local.entHabitaciones.toString(),
        'img': 'nulo',
      },
      {
        'nombre': 'Email de contacto',
        'propiedad': 'textEmail',
        'tipo': 'text',
        'valor': local.textEmail,
        'img': 'nulo',
      },
      {
        'nombre': 'Email alterno',
        'propiedad': 'textEmail2',
        'tipo': 'text',
        'valor': local.textEmail2,
        'img': 'nulo',
      },
      {
        'nombre': 'Celular de contacto',
        'propiedad': 'textCelular',
        'tipo': 'text',
        'valor': local.textCelular,
        'img': 'nulo',
      },
      {
        'nombre': 'Celular secundario',
        'propiedad': 'textCelular2',
        'tipo': 'text',
        'valor': local.textCelular2,
        'img': 'nulo',
      },
      {
        'nombre': 'Celular alterno',
        'propiedad': 'textCelular3',
        'tipo': 'text',
        'valor': local.textCelular3,
        'img': 'nulo',
      },
      {
        'nombre': 'Ubicación - Latitud',
        'propiedad': 'dblLatitud',
        'tipo': 'dbl',
        'valor': local.dblLatitud.toString(),
        'img': 'nulo',
      },
      {
        'nombre': 'Ubicación - Longitud',
        'propiedad': 'dblLongitud',
        'tipo': 'dbl',
        'valor': local.dblLongitud.toString(),
        'img': 'nulo',
      }
    ];

    return Column(
      children: [
        for (int x = 0; x < objeto.length; x++) ...[
          ListTile(
              tileColor:
                  (x % 2 == 0) ? const Color.fromRGBO(179, 10, 49, 0.30) : null,
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
                      child: Text(
                        "${objeto[x]['valor']}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              onTap: () => Navigator.pushNamed(context, 'detalleLocal',
                  arguments: ScreenArguments(objeto[x]['propiedad'],
                      objeto[x]['tipo'], objeto[x]['valor']))),
        ],
      ],
    );
  }
}

class ImgFullScreen extends StatelessWidget {
  const ImgFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Preferences.nombre,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: getImage(Preferences.img)),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getImage(String? picture) {
  if (picture == null) {
    return const Image(
        image: AssetImage('assets/pngs/no-image.png'), fit: BoxFit.cover);
  }

  if (picture.startsWith('http')) {
    return FadeInImage(
      placeholder: const AssetImage('assets/pngs/no-image.png'),
      image: NetworkImage(picture),
      fit: BoxFit.cover,
    );
  }

  return Image.file(File(picture), fit: BoxFit.cover, height: 500);
}
