import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class CandidatosService with ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  Future guardarVoto(String candidatoId) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    String referenteId = Preferences.numCel;
    /*if (textController.text.isNotEmpty) {
      referenteId = textController.text;
    }*/

    final uriVotar =
        Uri.parse('${Environment.socketUrl}/api/candidatos/votar/$candidatoId');

    await http.put(uriVotar,
        headers: {'Content-Type': 'application/json', 'token': token!});

    final data = {
      "candidato": candidatoId,
      "usuario": Preferences.id,
      "proceso": Preferences.procesoId,
      "lat": Preferences.lat,
      "lon": Preferences.lng,
      "referente": referenteId,
    };

    final uriVoto = Uri.parse('${Environment.socketUrl}/api/votos');

    await http.post(uriVoto,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token});
    Preferences.candidatoId = candidatoId;
    Preferences.stateVote = 2;
    notifyListeners();
    //return "";
  }

  Future<List<Candidato>> getCandidatos(procesoId) async {
    //print("getCandidatos*** ${DateTime.now()}");
    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/candidatos/flutter?procesoId=$procesoId');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});

      final candidatosResponse = candidatosResponseFromJson(resp.body);

      if (Preferences.refresh) {
        notifyListeners();
        Preferences.refresh = false;
      }
      return candidatosResponse.candidatos;
    } catch (e) {
      return [];
    }
  }
}
