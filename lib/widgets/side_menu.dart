import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Map<String, double> positionLocal = {
    'lat': Preferences.lat,
    'lng': Preferences.lng
  };

  String statusRol = '';
  int statusValor = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _DrawerHeader(),
              const _InfoGeneral(),
              // const Divider(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 17.0),
              //   child: TextFormField(
              //     enabled: false,
              //     initialValue: '${Preferences.rol}  -  ${Preferences.status}',
              //     decoration: InputDecoration(
              //       labelText: 'Preferences.rol && Preferences.status',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //   ),
              // ),
              const _InfoStatus(),
              if (Preferences.rol == 'NOR_ROL' && Preferences.status == '0')
                const _InfoNormal(),
              if (Preferences.rol == 'ESP_ROL' && Preferences.status == '0')
                const _InfoEspecial(),
              if (Preferences.rol == 'WOM_ROL' ||
                  Preferences.rol == 'MAN_ROL' ||
                  Preferences.rol == 'GAY_ROL' ||
                  Preferences.rol == 'TRS_ROL')
                const _InfoUsers(),
              if (Preferences.rol == 'FIS_ROL' || Preferences.rol == 'VIR_ROL')
                const _InfoOwners(),
              if (Preferences.rol == 'ADM_ROL') const _InfoAdmin(),
              const Divider(),
              SwitchListTile.adaptive(
                activeColor: AppTheme.primaryColorApp,
                value: Preferences.isDarkmode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: ElevatedButton(
                    onPressed: () async {
                      String nuevoRol = await actualizarRol();
                      setState(() {
                        Preferences.rol = nuevoRol;
                      });
                    },
                    child: const Text('Actualizar Rol')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  actualizarRol() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final uriRol = Uri.parse(
        '${Environment.socketUrl}/api/usuarios/obtenerrol?usuarioId=${Preferences.id}');

    final resp = await http.get(uriRol,
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      final stringResponse = stringResponseFromJson(resp.body);
      Preferences.status = stringResponse.texto1!;
      return stringResponse.texto;
    } else {
      Preferences.status = '0';
      return 'NOR_ROL';
    }
  }
}

Future<String> obtenerRol() async {
  const storage = FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');
  String rol = 'NOR_ROL';
  DateTime dt1 = DateTime.now();
  DateTime dt2 = DateTime.parse(Preferences.fechaCaducidad);
  if (dt1.compareTo(dt2) > 0) {
    if (Preferences.rol != 'ADM_ROL') {
      Preferences.status = '0';
    } else {
      rol = 'ADM_ROL';
    }
  } else {
    final uriRol = Uri.parse(
        '${Environment.socketUrl}/api/usuarios/obtenerrol?usuarioId=${Preferences.id}');

    final resp = await http.get(uriRol,
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      final stringResponse = stringResponseFromJson(resp.body);
      String status = stringResponse.texto1!;
      Preferences.status = status;
      rol = stringResponse.texto;
    } else {
      Preferences.status = '0';
    }
  }
  return rol;
}

class _DrawerHeader extends StatefulWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<_DrawerHeader> createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<_DrawerHeader> {
  @override
  Widget build(BuildContext context) {
    void obtenerStatus() async {
      Preferences.rol = await obtenerRol();
    }

    Preferences.rol = 'VIR_ROL';
    obtenerStatus();
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pngs/sexquare.png'),
              fit: BoxFit.fitHeight)),
      child: Container(),
    );
  }
}

class _InfoGeneral extends StatefulWidget {
  const _InfoGeneral();

  @override
  State<_InfoGeneral> createState() => _InfoGeneralState();
}

class _InfoGeneralState extends State<_InfoGeneral> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Preferences.rol == 'ADM_ROL') const Divider(),
        if (Preferences.rol == 'ADM_ROL')
          const Center(
            child: Text(
              'Menú Administrador',
              style: TextStyle(
                  color: AppTheme.primaryColorApp,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        if (Preferences.rol == 'ADM_ROL') const Divider(),
        // if (Preferences.rol == 'ADM_ROL')
        ListTile(
          title: const Text('Cambios de Rol'),
          leading: const Icon(
            Icons.settings_applications,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'cambio');
          },
        ),
        if (Preferences.token != '') const Divider(),
        if (Preferences.token != '') const SizedBox(height: 15.0),
        if (Preferences.token != '')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: TextFormField(
              enabled: false,
              initialValue: Preferences.version,
              onChanged: (value) {
                setState(() {
                  Preferences.version = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Versión',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        if (Preferences.token != '') const Divider(),
        if (Preferences.token != '')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: TextFormField(
              enabled: false,
              initialValue: Preferences.nombre,
              onChanged: (value) {
                setState(() {
                  Preferences.nombre = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'nickName',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        if (Preferences.token != '') const Divider(),
        if (Preferences.token != '')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: DropdownButtonFormField<String>(
              value: Preferences.genero,
              items: const [
                DropdownMenuItem(value: 'M', child: Text('Mujer')),
                DropdownMenuItem(value: 'H', child: Text('Hombre')),
                DropdownMenuItem(value: 'G', child: Text('Gay')),
                DropdownMenuItem(value: 'L', child: Text('Lesbiana')),
                DropdownMenuItem(value: 'B', child: Text('Bisexual')),
                DropdownMenuItem(value: 'T', child: Text('TranSexual')),
                DropdownMenuItem(value: 'O', child: Text('Otro')),
              ],
              decoration: const InputDecoration(
                labelText: 'Género',
              ),
              onChanged: (value) {
                setState(() {
                  _actualizarUsuario('G', value!);
                });
                // Si no se definiera el valor de Value por defecto asi como en la primera linea,
                //se deberia usar la siguiente instruccion
                // formValues['role'] = value ?? 'Admin';
              },
            ),
          ),
        if (Preferences.token != '') const Divider(),
        if (Preferences.token != '')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: DropdownButtonFormField<String>(
              value: Preferences.edad,
              items: const [
                DropdownMenuItem(value: '1', child: Text('18 - 23')),
                DropdownMenuItem(value: '2', child: Text('24 - 30')),
                DropdownMenuItem(value: '3', child: Text('31 - 35')),
                DropdownMenuItem(value: '4', child: Text('36 - 40')),
                DropdownMenuItem(value: '5', child: Text('41 en adelante')),
              ],
              decoration: const InputDecoration(
                labelText: 'Edad',
              ),
              onChanged: (value) {
                setState(() {
                  _actualizarUsuario('E', value!);
                });
              },
            ),
          ),
        if (Preferences.token != '') const Divider(),
        if (Preferences.token != '')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: DropdownButtonFormField<String>(
              value: Preferences.etnia,
              items: const [
                DropdownMenuItem(value: 'B', child: Text('Blanca')),
                DropdownMenuItem(value: 'N', child: Text('Negra')),
                DropdownMenuItem(value: 'L', child: Text('Latina')),
                DropdownMenuItem(value: 'C', child: Text('Caribe')),
                DropdownMenuItem(value: 'A', child: Text('Asiática')),
                DropdownMenuItem(value: 'P', child: Text('Persa')),
                DropdownMenuItem(value: 'H', child: Text('Hindú')),
                DropdownMenuItem(value: 'O', child: Text('Otro')),
              ],
              decoration: const InputDecoration(
                labelText: 'Raza',
              ),
              onChanged: (value) {
                setState(() {
                  _actualizarUsuario('Z', value!);
                });
              },
            ),
          ),
        if (Preferences.token != '') const Divider(),
        if (Preferences.token != '')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: DropdownButtonFormField<String>(
              value: Preferences.religion,
              items: const [
                DropdownMenuItem(value: 'C', child: Text('Cristiana')),
                DropdownMenuItem(value: 'I', child: Text('Islam')),
                DropdownMenuItem(value: 'H', child: Text('Hindú')),
                DropdownMenuItem(value: 'B', child: Text('Budista')),
                DropdownMenuItem(value: 'J', child: Text('Judía')),
                DropdownMenuItem(value: 'F', child: Text('Africana')),
                DropdownMenuItem(value: 'A', child: Text('Ateo')),
                DropdownMenuItem(value: 'O', child: Text('Otra')),
              ],
              decoration: const InputDecoration(
                labelText: 'Religión',
              ),
              onChanged: (value) {
                setState(() {
                  _actualizarUsuario('R', value!);
                });
              },
            ),
          ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue:
                '${Preferences.numeroContacto}\n${Preferences.numeroContacto1}\n${Preferences.numeroContacto2}\n${Preferences.emailContacto1}\n${Preferences.emailContacto}',
            decoration: InputDecoration(
              labelText: 'Contáctanos',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            maxLines: 5,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: Preferences.ctaPagos,
            decoration: InputDecoration(
              labelText: 'Cuenta para recibir Pagos',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            maxLines: 3,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: Preferences.fechaCaducidad,
            decoration: InputDecoration(
              labelText: 'Fecha de Caducidad',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: Preferences.numCel,
            decoration: InputDecoration(
              labelText: 'Móvil',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: Preferences.dispositivoId,
            decoration: InputDecoration(
              labelText: 'Id Dispositivo',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: Preferences.id,
            decoration: InputDecoration(
              labelText: 'Id Usuario',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: getDynamicRol(Preferences.rol),
            decoration: InputDecoration(
              labelText: 'Rol',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      ],
    );
  }

  void _actualizarUsuario(String propiedad, String valor) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    Map<String, String> data = {};

    switch (propiedad) {
      case 'G':
        data = {'genero': valor};
        break;
      case 'E':
        data = {'edad': valor};
        break;
      case 'Z':
        data = {'etnia': valor};
        break;
      case 'R':
        data = {'religion': valor};
        break;
    }

    final uri =
        Uri.parse('${Environment.socketUrl}/api/usuarios/${Preferences.id}');

    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      switch (propiedad) {
        case 'G':
          Preferences.genero = valor;
          break;
        case 'E':
          Preferences.edad = valor;
          break;
        case 'Z':
          Preferences.etnia = valor;
          break;
        case 'R':
          Preferences.religion = valor;
          break;
      }
    }
  }
}

class _InfoAdmin extends StatefulWidget {
  const _InfoAdmin();

  @override
  State<_InfoAdmin> createState() => _InfoAdminState();
}

class _InfoAdminState extends State<_InfoAdmin> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.pais,
          decoration: InputDecoration(
            labelText: 'Country',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.provincia,
          decoration: InputDecoration(
            labelText: 'State',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.ciudad,
          decoration: InputDecoration(
            labelText: 'City',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.procesoId,
          decoration: InputDecoration(
            labelText: 'Código proceso',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.isExterior.toString(),
          decoration: InputDecoration(
            labelText: 'Ubicado en el exterior',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.administradorId,
          decoration: InputDecoration(
            labelText: 'AdmintradorId',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.token,
          decoration: InputDecoration(
            labelText: 'Token Usuario',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          maxLines: 7,
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: TextFormField(
          enabled: false,
          initialValue: Preferences.tokenDispositivoId,
          decoration: InputDecoration(
            labelText: 'Token Dispositivo',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          maxLines: 7,
        ),
      ),
      const Divider(),
      SwitchListTile.adaptive(
        value: Preferences.isVerified,
        title: const Text('Verificado'),
        onChanged: (value) {
          Preferences.isVerified = value;
        },
      ),
    ]);
  }
}

class _InfoStatus extends StatefulWidget {
  const _InfoStatus();

  @override
  State<_InfoStatus> createState() => _InfoStatusState();
}

class _InfoStatusState extends State<_InfoStatus> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (int.parse(Preferences.status) > 0) const Divider(),
      if (int.parse(Preferences.status) > 0)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: getDynamicStatus(Preferences.status),
            decoration: InputDecoration(
              labelText: 'Estado',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      if (Preferences.status == '1') const Divider(),
      if (Preferences.status == '1')
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: true,
            controller: textController,
            decoration: InputDecoration(
              labelText: 'Nro. Referencia',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      if (Preferences.status == '1') const Divider(),
      if (Preferences.status == '1')
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    if (textController.text.isNotEmpty) {
                      confirmarDeposito(textController.text);
                      exitDialogSolicitud(context);
                    } else {
                      message(context, 'Ingrese un Nro. Referencia valido!');
                    }
                  },
                  child: const Text('Confirmar Depósito')),
              ElevatedButton(
                  onPressed: () async {
                    cancelarDeposito();
                    exitDialogSolicitud(context);
                  },
                  child: const Text('Cancelar')),
            ],
          ),
        ),
      if (Preferences.status == '3') const Divider(),
      if (Preferences.status == '3')
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: TextFormField(
            enabled: false,
            initialValue: 'Referencia o valor incorrecto, contáctanos!',
            decoration: InputDecoration(
              labelText: 'Motivo Rechazo',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            maxLines: 2,
          ),
        ),
      if (Preferences.status == '3') const Divider(),
      if (Preferences.status == '3')
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await cancelarDeposito();
              },
              child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Reiniciar Proceso')))),
        ),
    ]);
  }

  confirmarDeposito(String referencia) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final data = {'referencia': referencia, 'usuario': Preferences.id};
    final uri =
        Uri.parse('${Environment.socketUrl}/api/cambios/${Preferences.id}');

    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      final tokenDispositivoAdmin = await obtenerTokenAdmin();

      final String token = 'key=${Environment.keyServer}';

      final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

      final data = {
        'data': {'product': '${Preferences.id}|$referencia|ADM|'},
        'to': tokenDispositivoAdmin
      };

      final resp = await http.post(uri, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });

      if (resp.statusCode == 200) {
        final data = {'status': '2'};
        final uri = Uri.parse(
            '${Environment.socketUrl}/api/usuarios/${Preferences.id}');

        final resp = await http.put(uri,
            body: jsonEncode(data),
            headers: {'Content-Type': 'application/json', 'token': token});

        if (resp.statusCode == 200) {
          Preferences.status = '2';
        }
      }
    }
  }
}

class _InfoNormal extends StatefulWidget {
  const _InfoNormal();

  @override
  State<_InfoNormal> createState() => _InfoNormalState();
}

class _InfoNormalState extends State<_InfoNormal> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(),
      Column(
        children: [
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (Preferences.numCel == '9999999999') {
                        solicitarRegistro(context,
                            'Para acceder a este servicio debes Registrarte. Deseas continuar?');
                      } else {
                        _confirmarSolicitud(
                            context,
                            'FIS_ROL',
                            int.parse(Preferences.valProFis),
                            'Costo del servicio \$ ${Preferences.valProFis}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
                      }
                    },
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                            child: Text('Registrarme como Propietario'))),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (Preferences.numCel == '9999999999') {
                        solicitarRegistro(context,
                            'Para acceder a este servicio debes Registrarte. Deseas continuar?');
                      } else {
                        _confirmarSolicitud(
                            context,
                            'WOM_ROL',
                            int.parse(Preferences.valUsrWom),
                            'Costo del servicio \$ ${Preferences.valUsrWom}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
                      }
                    },
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                            child: Text('Registrarme como seXquare-Mujer'))),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (Preferences.numCel == '9999999999') {
                          solicitarRegistro(context,
                              'Para acceder a este servicio debes Registrarte. Deseas continuar?');
                        } else {
                          _confirmarSolicitud(
                              context,
                              'ESP_ROL',
                              int.parse(Preferences.valCliEsp),
                              'Costo del servicio \$ ${Preferences.valCliEsp}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
                        }
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Text('Quiero ser Cliente ESPECIAL')))),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (Preferences.numCel == '9999999999') {
                          solicitarRegistro(context,
                              'Para acceder a este servicio debes Registrarte. Deseas continuar?');
                        } else {
                          _confirmarSolicitud(
                              context,
                              'PRE_ROL',
                              int.parse(Preferences.valCliPre),
                              'Costo del servicio \$ ${Preferences.valCliPre}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
                        }
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Text('Quiero ser CLIENTE PREMIUM')))),
                ),
                const Divider(),
              ],
            ),
          ),
          SwitchListTile.adaptive(
            value: isVisible,
            title: const Text('Cambiar de Categoría'),
            secondary: const Icon(Icons.add_circle_outline),
            // controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool value) {
              setState(() => isVisible = value);
            },
          ),
        ],
      ),
    ]);
  }

  solicitarRegistro(context, String texto) {
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
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ),
                  Divider()
                ],
              ),
              content: Text(texto),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    exitDialogRegistro(context);
                    Navigator.pushNamed(context, 'register');
                  },
                  autofocus: true,
                  child: const Text('Registro'),
                ),
                TextButton(
                  onPressed: () => exitDialogRegistro(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
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
              style: TextStyle(color: Colors.blue, fontSize: 16.0),
            ),
            Divider()
          ],
        ),
        content: Text(texto),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                exitDialogRegistro(context);
                Navigator.pushNamed(context, 'register');
              },
              child: const Text('Registro')),
          CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => exitDialogRegistro(context),
              child: const Text('Cancelar')),
        ],
      ),
    );
  }

  void exitDialogRegistro(context) {
    Navigator.pop(context);
  }
}

cambiarStatus(context, String rol, int valor) async {
  const storage = FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');

  var dt = DateTime.now();
  String mes =
      (dt.month.toString().length < 2) ? '0${dt.month}' : '${dt.month}';
  String dia = (dt.day.toString().length < 2) ? '0${dt.day}' : '${dt.day}';

  final data = {
    'rol': rol,
    'valor': valor,
    'administrador': Preferences.administradorId,
    'usuario': Preferences.id,
    'fecha': '${dt.year}-$mes-$dia',
  };

  final uri = Uri.parse('${Environment.socketUrl}/api/cambios');

  final resp = await http.post(uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json', 'token': token!});

  if (resp.statusCode == 201) {
    final data = {'status': 1};
    final uri =
        Uri.parse('${Environment.socketUrl}/api/usuarios/${Preferences.id}');

    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token});

    if (resp.statusCode == 200) {
      Preferences.status = '1';
      final tokenDispositivoAdmin = await obtenerTokenAdmin();
      final String keyServer = 'key=${Environment.keyServer}';

      final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

      final data = {
        'data': {'producto': 'UserId-${Preferences.id},rol-$rol,valor-$valor'},
        'to': tokenDispositivoAdmin
      };

      await http.post(uri, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Authorization': keyServer
      });
    }
  }
}

_confirmarSolicitud(context, String rol, int valor, String texto) {
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
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                ),
                Divider()
              ],
            ),
            content: Text(texto),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  exitDialogSolicitud(context);
                  cambiarStatus(context, rol, valor);
                },
                autofocus: true,
                child: const Text('Solicitar'),
              ),
              TextButton(
                onPressed: () {
                  cancelarDeposito();
                  exitDialogSolicitud(context);
                },
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.blue),
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
            style: TextStyle(color: Colors.blue, fontSize: 16.0),
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
              exitDialogSolicitud(context);
              cambiarStatus(context, rol, valor);
            },
            child: const Text('Solicitar')),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              cancelarDeposito();
              exitDialogSolicitud(context);
            },
            child: const Text('Cancelar')),
      ],
    ),
  );
}

cancelarDeposito() async {
  const storage = FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');

  final data = {'status': '0'};
  final uri =
      Uri.parse('${Environment.socketUrl}/api/usuarios/${Preferences.id}');

  final resp = await http.put(uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json', 'token': token!});

  if (resp.statusCode == 200) {
    Preferences.status = '0';
  }
}

void exitDialogSolicitud(context) {
  Navigator.pop(context);
}

obtenerTokenAdmin() async {
  String tokenDispositivoAdmin = '';
  const storage = FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');

  final uriToken = Uri.parse(
      '${Environment.socketUrl}/api/administradores/${Preferences.administradorId}');

  final resp = await http.get(uriToken,
      headers: {'Content-Type': 'application/json', 'token': token!});

  if (resp.statusCode == 200) {
    final stringResponse = stringResponseFromJson(resp.body);
    tokenDispositivoAdmin = stringResponse.texto;
  }
  return tokenDispositivoAdmin;
}

message(context, String texto) {
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
                  style: TextStyle(color: Colors.blue),
                ),
                Divider()
              ],
            ),
            content: Text(texto),
            actions: [
              MaterialButton(
                onPressed: () => exitDialogMessage(context),
                elevation: 5.0,
                textColor: AppTheme.primaryColorApp,
                child: const Text('Salir'),
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
            style: TextStyle(color: Colors.blue),
          ),
          Divider()
        ],
      ),
      content: Text(texto),
      actions: [
        CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () => exitDialogMessage(context),
            child: const Text('Salir')),
      ],
    ),
  );
}

void exitDialogMessage(context) {
  Navigator.pop(context);
}

class _InfoEspecial extends StatelessWidget {
  const _InfoEspecial();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ElevatedButton(
            onPressed: () async {
              _confirmarSolicitud(
                  context,
                  'VIR_ROL',
                  int.parse(Preferences.valProVir),
                  'Costo del servicio \$ ${Preferences.valProVir}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
            },
            child: const SizedBox(
              width: double.infinity,
              child:
                  Center(child: Text('Registrarme como Propietario Virtual')),
            )),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ElevatedButton(
            onPressed: () async {
              _confirmarSolicitud(
                  context,
                  'MAN_ROL',
                  int.parse(Preferences.valUsrMan),
                  'Costo del servicio \$ ${Preferences.valUsrMan}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(child: Text('Registrarme como seXquare-Man')),
            )),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ElevatedButton(
            onPressed: () async {
              _confirmarSolicitud(
                  context,
                  'GAY_ROL',
                  int.parse(Preferences.valUsrGay),
                  'Costo del servicio \$ ${Preferences.valUsrGay}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(child: Text('Registrarme como seXquare-Gay')),
            )),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: ElevatedButton(
            onPressed: () async {
              _confirmarSolicitud(
                  context,
                  'TRS_ROL',
                  int.parse(Preferences.valUsrTrs),
                  'Costo del servicio \$ ${Preferences.valUsrTrs}, deposita en la Cuenta para recibir Pagos y envía el Nro. de Referencia del depósito para Verificar y Activar.');
            },
            child: const SizedBox(
              width: double.infinity,
              child: Center(child: Text('Registrarme como seXquare-Trans')),
            )),
      ),
    ]);
  }
}

class _InfoUsers extends StatelessWidget {
  const _InfoUsers();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: const Text('Perfil'),
          leading: const Icon(
            Icons.person,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'perfil');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Configurar Atributos'),
          leading: const Icon(
            Icons.settings_applications,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'setUser');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Configurar Servicios'),
          leading: const Icon(
            Icons.settings,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'setUser');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Fotos y Documentos'),
          leading: const Icon(
            Icons.image,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'userFoto');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Notificaciones'),
          leading: const Icon(
            Icons.notifications,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'setUser');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Tour Plaza'),
          leading: const Icon(
            Icons.travel_explore,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'setUser');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Reservar Plazas'),
          subtitle:
              const Text('ECUADOR - Zamora Chinchipe - Zamora - Las Palmas'),
          isThreeLine: true,
          leading: const Icon(
            Icons.calendar_month_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, 'setUser');
          },
        ),
      ],
    );
  }
}

class _InfoOwners extends StatelessWidget {
  const _InfoOwners();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: const Text('Administrar Reservas'),
          leading: const Icon(
            Icons.paste_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'admReserva');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Notificaciones'),
          leading: const Icon(
            Icons.notifications,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'admNotify');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Invitaciones'),
          leading: const Icon(
            Icons.contact_mail_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'admInvitacion');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Términos y Condiciones'),
          leading: const Icon(
            Icons.security,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'condicion');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Horarios de Atención'),
          leading: const Icon(
            Icons.calendar_month_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'horario');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Habitaciones'),
          leading: const Icon(
            Icons.local_hotel_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'habitacion');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Instalaciones'),
          leading: const Icon(
            Icons.auto_awesome_mosaic_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'instalacion');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Perfil Local'),
          leading: const Icon(
            Icons.home_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'local');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Actualizar Ubicación'),
          leading: const Icon(
            Icons.location_on_outlined,
            color: AppTheme.primaryColorApp,
          ),
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.pushNamed(context, 'setUbicacion');
          },
        ),
      ],
    );
  }
}

String getDynamicStatus(String valor) {
  String status = 'Normal';
  switch (valor) {
    case '1':
      status = 'Enviada';
      break;
    case '2':
      status = 'Verificación';
      break;
    case '3':
      status = 'Rechazada';
      break;
  }
  return status;
}

String getDynamicRol(String valor) {
  String rol = '';
  switch (valor) {
    case 'ADM_ROL':
      rol = 'Administrador';
      break;
    case 'FIS_ROL':
      rol = 'Propietario';
      break;
    case 'VIR_ROL':
      rol = 'Propietario Virtual';
      break;
    case 'WOM_ROL':
      rol = 'seXquare-Woman';
      break;
    case 'MAN_ROL':
      rol = 'seXquare-Man';
      break;
    case 'TRS_ROL':
      rol = 'seXquare-Trans';
      break;
    case 'GAY_ROL':
      rol = 'seXquare-Gay';
      break;
    case 'ESP_ROL':
      rol = 'SpeCiaL';
      break;
    case 'PRE_ROL':
      rol = 'PREMIUM';
      break;
    default:
      rol = 'Normal';
  }
  return rol;
}
