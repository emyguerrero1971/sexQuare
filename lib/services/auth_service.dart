import 'dart:convert';
import 'device_service.dart';
import 'package:http/http.dart' as http;

import 'package:nanoid/nanoid.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  final _storage = const FlutterSecureStorage();

  bool _autenticando = false;

  bool get autenticando => _autenticando;

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  // Getter del token de forma estatica
  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token;
  }

  // Borrar token
  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future<bool> grabarDispositivo(String dispositivoId) async {
    autenticando = true;
    var nanoId = nanoid(10);
    Preferences.nombre = 'User_$nanoId';
    //print("grabarDispositivo *** ${dispositivoId}");

    final data = {
      'numcel': dispositivoId,
      'dispositivoId': dispositivoId,
      'nombre': Preferences.nombre,
      'email': '$dispositivoId@gmail.com',
      'password': dispositivoId,
      'fechaRegistro': Preferences.fechaRegistro,
      'fechaCaducidad': Preferences.fechaCaducidad,
      'administradorId': Preferences.administradorId,
      'tokenDispositivoId': Preferences.tokenDispositivoId,
      'paisId': Preferences.paisId,
      'provinciaId': Preferences.provinciaId,
      'ciudadId': Preferences.ciudadId,
      'localId': Preferences.localId,
    };

    final uri = Uri.parse('${Environment.apiUrl}/usuarios');

    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);
      Preferences.token = loginResponse.token;
      Preferences.id = loginResponse.usuario.uid;

      autenticando = false;
      return true;
    } else {
      autenticando = false;
      return false;
    }
  }

  Future<void> registrarDispositivo() async {
    DeviceService deviceService = DeviceService();
    var dispositivoId = await deviceService.getUniqueIdentifier();
    // print("registrarDispositivo *** $dispositivoId");

    if (dispositivoId != null) {
      bool? existeDispositivo_ = await existeDispositivo(dispositivoId);

      if (existeDispositivo_) {
        await restoreUserByDispositivoId(dispositivoId);
        await buscarCuenta();
      } else {
        await buscarCuenta();
        await grabarDispositivo(dispositivoId);
      }
      Preferences.dispositivoId = dispositivoId;
    }
  }

  Future<void> buscarCuenta() async {
    final uriCuenta = Uri.parse(
        '${Environment.socketUrl}/api/cuentas/flutter?paisId=${Preferences.paisId}');

    final resp = await http
        .get(uriCuenta, headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final cuentaResponse = cuentasResponseFromJson(resp.body);
      Preferences.administradorId = cuentaResponse.cuentas[0].administrador;
      Preferences.ctaPagos =
          '${cuentaResponse.cuentas[0].titular}, ${cuentaResponse.cuentas[0].banco}, Cta_${(cuentaResponse.cuentas[0].tipo == 'A') ? "Ahorro" : "Corriente"} Nro. ${cuentaResponse.cuentas[0].numero}';
    }
  }

  Future<bool> restoreUserByDispositivoId(String dispositivoId) async {
    final data = {
      'dispositivoId': dispositivoId,
    };

    final uri = Uri.parse('${Environment.apiUrl}/usuarios/restaurar');

    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);

      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      Preferences.token = loginResponse.token;
      Preferences.id = loginResponse.usuario.uid;
      Preferences.img = loginResponse.usuario.img;
      Preferences.rol = loginResponse.usuario.rol;
      Preferences.edad = loginResponse.usuario.edad;
      Preferences.etnia = loginResponse.usuario.etnia;
      Preferences.paisId = loginResponse.usuario.paisId;
      Preferences.numCel = loginResponse.usuario.numcel;
      Preferences.nombre = loginResponse.usuario.nombre;
      Preferences.genero = loginResponse.usuario.genero;
      Preferences.status = loginResponse.usuario.status;
      Preferences.localId = loginResponse.usuario.localId!;
      Preferences.religion = loginResponse.usuario.religion;
      Preferences.ciudadId = loginResponse.usuario.ciudadId;
      Preferences.provinciaId = loginResponse.usuario.provinciaId;
      Preferences.fechaRegistro = loginResponse.usuario.fechaRegistro;
      Preferences.fechaCaducidad = loginResponse.usuario.fechaCaducidad;

      return true;
    } else {
      return false;
    }
  }

  Future<bool> existeDispositivo(String? deviceId) async {
    deviceId = deviceId ?? "SN";

    if (deviceId.contains('+')) {
      deviceId = deviceId.replaceAll('+', "%2B");
    }
    // Verificar si el numero de celular ya existe en a BD
    final uri = Uri.parse(
        '${Environment.socketUrl}/api/usuarios/existedispositivoidflutter?dispositivoId=$deviceId');

    final resp =
        await http.get(uri, headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final existeResponse = booleanResponseFromJson(resp.body);
      return existeResponse.existe;
    } else {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    final String? token = await _storage.read(key: 'token');

    final uri = Uri.parse('${Environment.apiUrl}/auth/actualizarToken');

    try {
      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});

      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);
        usuario = loginResponse.usuario;

        await _guardarToken(loginResponse.token);
        Preferences.token = loginResponse.token;

        return true;
      } else {
        logout();
        return false;
      }
    } catch (e) {
      // print("Error: *********** $e");
      return false;
    }
  }

  Future _guardarToken(String token) async {
    // Write value
    return await _storage.write(key: 'token', value: token);

    // Read value
    // String value = await storage.read(key: key);
    // Read all values
    // Map<String, String> allValues = await storage.readAll();
    // Delete value
    // await storage.delete(key: key);
    // Delete all
    // await storage.deleteAll();
    // Write value
    // await storage.write(key: key, value: value);
  }

  Future logout() async {
    // Delete value
    await _storage.delete(key: 'token');
  }

  Future<bool> updateUser() async {
    final uri = Uri.parse('${Environment.apiUrl}/usuarios');
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    await http.put(uri,
        body: jsonEncode(usuarioToJson(usuario!)),
        headers: {'Content-Type': 'application/json', 'token': token!});

    return true;
  }
}
