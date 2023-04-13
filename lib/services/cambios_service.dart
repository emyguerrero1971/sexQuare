import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';


class CambiosService with ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  Future<List<Cambio>> getCambios() async {
    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/cambios/flutter?administradorId=${Preferences.administradorId}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});
      final cambiosResponse = cambiosResponseFromJson(resp.body);

      notifyListeners();
      if (cambiosResponse.cambios.isNotEmpty) {
        return cambiosResponse.cambios;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}