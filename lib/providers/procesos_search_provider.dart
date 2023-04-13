import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sexquare/models/models.dart';
import 'package:sexquare/helpers/debouncer.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class ProcesosSearchProvider extends ChangeNotifier {
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<List<ProcesoSearch>> _suggestionStreamController =
      StreamController.broadcast();

  Stream<List<ProcesoSearch>> get suggestionStream =>
      _suggestionStreamController.stream;

  // ProcesosSearchProvider() {
  //   print('ProcesosSearchProvider inicilizado');
  //   // Aqui se deberian llamar metodos o clases que necesitan iniciarse cuando se Instancie el provider 
  // }

  Future<List<ProcesoSearch>> searchProcesos(String query) async {
    const storage = FlutterSecureStorage();

    try {
      final String? token = await storage.read(key: 'token');

      if (token != null) {
        final uri = Uri.parse(
            '${Environment.apiUrl}/procesos/flutter?texto=$query&paisId=${Preferences.paisId}');

        final resp = await http.get(uri,
            headers: {'Content-Type': 'application/json', 'token': token});

        final procesosSearchResponse =
            ProcesosSearchResponse.fromJson(resp.body);
        //print(resp.body);

        return procesosSearchResponse.procesos;
      }
    } catch (e) {
      return [];
    }
    return [];
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final procesosSearch = await searchProcesos(value);
      _suggestionStreamController.add(procesosSearch);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
