import 'package:sexquare/global/environment.dart';
import 'package:sexquare/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LugarPorCoordenadasService with ChangeNotifier {
  Usuario? usuario;

  bool _procesando = false;

  bool get procesando => _procesando;

  set procesando(bool valor) {
    _procesando = valor;
    notifyListeners();
  }

  Future<LugarPorCoordenadasResponse?> obtenerCoordenadasPais(
      double longitud, double latitud) async {
    procesando = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
          '${Environment.apiUrl}/paises/coordenadas?longitud=$longitud&latitud=$latitud');

      final resp =
          await http.get(uri, headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final lugarPorCoordenadasResponse =
            lugarPorCoordenadasResponseFromJson(resp.body);
        return lugarPorCoordenadasResponse;
      } else {
        return null;
      }
    } catch (e) {
      procesando = false;
      notifyListeners();
      // print("Error $e");
      return null;
    }
  }

  Future<LugarPorCoordenadasResponse?> obtenerCoordenadasProvincia(
      String paisId, double longitud, double latitud) async {
    procesando = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
          '${Environment.apiUrl}/provincias/coordenadas?paisId=$paisId&longitud=$longitud&latitud=$latitud');

      final resp =
          await http.get(uri, headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final lugarPorCoordenadasResponse =
            lugarPorCoordenadasResponseFromJson(resp.body);

        return lugarPorCoordenadasResponse;
      } else {
        return null;
      }
    } catch (e) {
      procesando = false;
      notifyListeners();
      // print("Error $e");
      return null;
    }
  }

  Future<LugarPorCoordenadasResponse?> obtenerCoordenadasCiudad(
      String provinciaId, double longitud, double latitud) async {
    procesando = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
          '${Environment.apiUrl}/ciudades/coordenadas?provinciaId=$provinciaId&longitud=$longitud&latitud=$latitud');

      final resp =
          await http.get(uri, headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final lugarPorCoordenadasResponse =
            lugarPorCoordenadasResponseFromJson(resp.body);

        return lugarPorCoordenadasResponse;
      } else {
        return null;
      }
    } catch (e) {
      procesando = false;
      notifyListeners();
      // print("Error $e");
      return null;
    }
  }

  Future<LugarPorCoordenadasResponse?> obtenerCoordenadasParroquia(
      String ciudadId, double longitud, double latitud) async {
    procesando = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
          '${Environment.apiUrl}/parroquias/coordenadas?ciudadId=$ciudadId&longitud=$longitud&latitud=$latitud');

      final resp =
          await http.get(uri, headers: {'Content-Type': 'application/json'});

      procesando = false;
      notifyListeners();

      if (resp.statusCode == 200) {
        final lugarPorCoordenadasResponse =
            lugarPorCoordenadasResponseFromJson(resp.body);

        return lugarPorCoordenadasResponse;
      } else {
        return null;
      }
    } catch (e) {
      procesando = false;
      notifyListeners();
      // print("Error $e");
      return null;
    }
  }

  Future<bool> isLocated(bool control) async {
    final uri = Uri.parse('${Environment.apiUrl}/usuarios/_user_anonimus');

    final resp =
        await http.get(uri, headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;

      return true;
    } else {
      return control;
    }
  }
}
