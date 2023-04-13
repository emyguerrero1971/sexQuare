import 'dart:convert';

import 'package:sexquare/global/environment.dart';
import 'package:sexquare/models/models.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class VotosService with ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  String candidatoId = 'no-data';


  Future<List<Voto>> getVotosCandidato(String candidatoId) async {
    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/votos?candidatoId=$candidatoId');
      //print(uri);

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});

      //print(resp.body);
      final votosResponse = votosResponseFromJson(resp.body);
      //print(votosResponse.votos[0].lng);
      //notifyListeners();

      return votosResponse.votos;

      //notifyListeners();
    } catch (error) {
      // print("Error** $error");
      return [];
    }
  }


  Future<String> getCandidatoVotado() async {
    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/votos/buscar?procesoId=${Preferences
              .procesoId}&usuarioId=${Preferences.id}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});

      final votosResponse = json.decode(resp.body);

      if (votosResponse['candidatoId'] != '') {
        candidatoId = votosResponse['candidatoId'];
      }

      notifyListeners();
      return candidatoId;
    } catch (error) {
      // print("Error** $error");
      return 'error';
    }
  }
}
