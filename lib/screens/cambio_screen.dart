import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class CambioScreen extends StatefulWidget {
  static const String routeName = 'cambio';

  const CambioScreen({super.key});

  @override
  State<CambioScreen> createState() => _CambioScreenState();
}

class _CambioScreenState extends State<CambioScreen> {
  List<Cambio> cambios = [];
  String loading = '1';

  @override
  Widget build(BuildContext context) {
    cargarCambios() async {
      cambios = await Provider.of<CambiosService>(context).getCambios();
      (cambios.isEmpty) ? loading = '0' : loading = '2';
    }

    cargarCambios();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cambios de Rol'),
        ),
        body: Column(
          children: [
            Container(
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: AppTheme.primaryColorApp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(1.0, 1.0),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const ListTile(
                title: Text(
                  'Nuevo ROL',
                  style: TextStyle(
                      color: AppTheme.primaryColorApp,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'Acción    ',
                  style: TextStyle(
                      color: AppTheme.primaryColorApp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: (loading != '1')
                  ? ListView.builder(
                      itemCount: cambios.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: (index % 2 == 0)
                              ? Colors.grey[50]
                              : Colors.grey[200],
                          child: Column(
                            children: [
                              ListTile(
                                dense: true,
                                title: Text(
                                    '${cambios[index].usuario.nombre}  -  ${cambios[index].rol}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(cambios[index].fecha,
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic)),
                                        Row(
                                          children: [
                                            const Text('   valor: '),
                                            Text(
                                              '${cambios[index].valor}.00',
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('referencia: '),
                                        Text(
                                          cambios[index].referencia,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                isThreeLine: true,
                                trailing: SizedBox(
                                  width: 80.0,
                                  child: Row(
                                    children: [
                                      // const Icon(Icons.arrow_forward_ios_rounded),
                                      GestureDetector(
                                        onTap: () {
                                          confirmarAccion(
                                              context,
                                              'A',
                                              'Confirma Aceptar esta solicitud?',
                                              cambios[index]);
                                          cambios.removeAt(index);
                                          setState(() {});
                                        },
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/pngs/aprobar.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          confirmarAccion(
                                              context,
                                              'R',
                                              'Confirma Rechazar esta solicitud?',
                                              cambios[index]);
                                          cambios.removeAt(index);
                                          setState(() {});
                                        },
                                        child: SizedBox(
                                          height: 35,
                                          width: 35,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/pngs/rechazar.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : (loading != '0')
                      ? Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                              CircularProgressIndicator(),
                              SizedBox(height: 10.0),
                              Text('Cargando espere...')
                            ]))
                      : const Center(
                          child: Text('No existen solicitudes pendientes!!')),
            )),
          ],
        ));
  }

  confirmarAccion(context, String accion, String texto, Cambio cambio) {
    if (!Platform.isIOS) {
      //Codigo para Android
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Column(
                children: const [
                  Text(
                    'seXquare',
                    style: TextStyle(
                        color: AppTheme.primaryColorApp, fontSize: 16.0),
                  ),
                  Divider()
                ],
              ),
              content: Text(texto),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (accion == 'A') {
                      aprobarNuevoRol(cambio);
                    } else {
                      rechazarSolicitud(cambio);
                    }
                  },
                  autofocus: true,
                  child: const Text('Confirmar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: AppTheme.primaryColorApp),
                  ),
                )
              ],
            );
          });
    }

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Column(
          children: const [
            Text(
              'seXquare',
              style: TextStyle(color: AppTheme.primaryColorApp, fontSize: 16.0),
            ),
            Divider()
          ],
        ),
        content: Text(texto),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                if (accion == 'A') {
                  aprobarNuevoRol(cambio);
                } else {
                  rechazarSolicitud(cambio);
                }
              },
              child: const Text('Confirmar')),
          CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
        ],
      ),
    );
  }

  void rechazarSolicitud(Cambio cambio) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final data = {'estado': true, 'referencia': 'ref_rechazada'};

    final uri = Uri.parse('${Environment.socketUrl}/api/cambios/${cambio.id}');

    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      final data = {'status': 0};
      final uri = Uri.parse(
          '${Environment.socketUrl}/api/usuarios/${cambio.usuario.uid}');

      final resp = await http.put(uri,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json', 'token': token});

      if (resp.statusCode == 200) {
        final String keyServer = 'key=${Environment.keyServer}';

        final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

        final data = {
          'data': {'producto': 'Valor depositado incorrecto!!'},
          'to': cambio.usuario.tokenDispositivoId
        };

        await http.post(uri, body: jsonEncode(data), headers: {
          'Content-Type': 'application/json',
          'Authorization': keyServer
        });
      }
    }
  }

  void aprobarNuevoRol(Cambio cambio) async {
    const storage = FlutterSecureStorage();

    Map<String, dynamic> body;
    bool control = false;
    String lastId = '';

    final String? token = await storage.read(key: 'token');

    final data = {'estado': true};

    final uri = Uri.parse('${Environment.socketUrl}/api/cambios/${cambio.id}');
    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      var dt = DateTime.now();
      String mes =
          (dt.month.toString().length < 2) ? '0${dt.month}' : '${dt.month}';
      String dia = (dt.day.toString().length < 2) ? '0${dt.day}' : '${dt.day}';
      int anio = dt.year;

      final data = {
        'status': 0,
        'rol': cambio.rol,
        'fechaCaduca': '${(anio + 1).toString()}-$mes-$dia',
      };

      final uri = Uri.parse(
          '${Environment.socketUrl}/api/usuarios/${cambio.usuario.uid}');

      final resp = await http.put(uri,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json', 'token': token});

      if (resp.statusCode == 200) {
        switch (cambio.rol) {
          case 'FIS_ROL':
          case 'VIR_ROL':
            final data = {
              'descripcion': 'Mi Local ${Preferences.nombre}',
              'pais': cambio.usuario.paisId,
              'provincia': cambio.usuario.provinciaId,
              'ciudad': cambio.usuario.ciudadId,
              'usuario': cambio.usuario.uid
            };
            final uri = Uri.parse('${Environment.socketUrl}/api/locales');

            final resp = await http.post(uri,
                body: jsonEncode(data),
                headers: {'Content-Type': 'application/json', 'token': token});

            if (resp.body.isNotEmpty) {
              body = json.decode(resp.body);
              lastId = body['_id'].toString();
            }

            if (resp.statusCode == 201) {
              control = false;

              final data = {
                'local': lastId,
                'usuario': cambio.usuario.uid
              };

              final uri = Uri.parse('${Environment.socketUrl}/api/instalaciones');

              final resp = await http.post(uri,
                  body: jsonEncode(data),
                  headers: {
                    'Content-Type': 'application/json',
                    'token': token
                  });
              if (resp.statusCode == 201) {
                 control = false;

                final data = {
                  'local': lastId,
                  'usuario': cambio.usuario.uid
                };

                final uri = Uri.parse('${Environment.socketUrl}/api/habitaciones');

                final resp = await http.post(uri,
                    body: jsonEncode(data),
                    headers: {
                      'Content-Type': 'application/json',
                      'token': token
                    });
                if (resp.statusCode == 201) {
                  control = false;

                  final data = {
                    'local': lastId,
                    'usuario': cambio.usuario.uid
                  };

                  final uri = Uri.parse('${Environment.socketUrl}/api/condiciones');

                  final resp = await http.post(uri,
                      body: jsonEncode(data),
                      headers: {
                        'Content-Type': 'application/json',
                        'token': token
                      });
                  if (resp.statusCode == 201) {
                    control = false;

                    final data = {
                      'local': lastId,
                      'usuario': cambio.usuario.uid
                    };

                    final uri = Uri.parse('${Environment.socketUrl}/api/horarios/local');

                    final resp = await http.post(uri,
                        body: jsonEncode(data),
                        headers: {
                          'Content-Type': 'application/json',
                          'token': token
                        });
                    if (resp.statusCode == 201) {
                      control = true;
                    }
                  }
                }
              }
            }
            break;
          case 'WOM_ROL':
          case 'AMN_ROL':
          case 'GAY_ROL':
          case 'TRS_ROL':
        }
        if (control) {
          print('Hola mundo');
          // final String keyServer = 'key=${Environment.keyServer}';

          // final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

          // final data = {
          //   'data': {'producto': 'Tu solicitud ha sido procesada conéxito!'},
          //   'to': cambio.usuario.tokenDispositivoId
          // };

          // await http.post(uri, body: jsonEncode(data), headers: {
          //   'Content-Type': 'application/json',
          //   'Authorization': keyServer
          // });
        }
      }
    }
  }
}
