import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
// import 'package:sexquare/global/environment.dart';
// import 'package:sexquare/share_preferences/preferences.dart';


class CandidatosProvider extends ChangeNotifier {
  List<Candidato> onDisplayHomeCandidatos = [];

  CandidatosProvider() {
    getCandidatos();
  }

  getCandidatos() async {

    // const storage = FlutterSecureStorage();

    // try {
    //   final String? token = await storage.read(key: 'token');

    //   final uri = Uri.parse(
    //       '${Environment.apiUrl}/candidatos/flutter?procesoId=${Preferences.procesoId}');

    //   final resp = await http.get(uri,
    //       headers: {'Content-Type': 'application/json', 'token': token!});
    //   final candidatosResponse = CandidatosResponse.fromJson(resp.body);

    //   onDisplayHomeCandidatos = candidatosResponse.candidatos;

    //   notifyListeners();
    // } catch (e) {
    //   return [];
    // }
  }

}
