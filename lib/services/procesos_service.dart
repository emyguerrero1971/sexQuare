import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class ProcesosService with ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  Future<List<Proceso>> getProcesos() async {
    try {
      final String? token = await _storage.read(key: 'token');

      if (token != null) {
        final uri = Uri.parse(
            '${Environment.apiUrl}/procesos?paisId=${Preferences.paisId}');

        final resp = await http.get(uri,
            headers: {'Content-Type': 'application/json', 'token': token});

        final procesosResponse = procesosResponseFromJson(resp.body);

        return procesosResponse.procesos;
      }
    } catch (e) {
      // print("Error*** $e");
      return [];
    }
    return [];
  }
}
