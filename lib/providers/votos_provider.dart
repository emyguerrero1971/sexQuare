import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class VotosProvider extends ChangeNotifier {
  String candidatoId = '';

  VotosProvider() {
    getCandidatoVotado();
  }

  getCandidatoVotado() async {
    const storage = FlutterSecureStorage();

    try {
      final String? token = await storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/votos/buscar?procesoId=${Preferences.procesoId}&usuarioId=${Preferences.id}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});
      final votosResponse = resp.body;

      candidatoId = votosResponse;

      notifyListeners();
    } catch (error) {
      return error;
    }
  }
}
