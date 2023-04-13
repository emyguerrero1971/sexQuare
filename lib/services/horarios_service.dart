import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class HorariosService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  final List<Horario> horarios = [];
  bool isLoading = true;
  late Horario copyRegistroHorario;

  bool isSaving = false;

  HorariosService() {
    loadHorarios();
  }

  Future<List<Horario>> loadHorarios() async {
    isLoading = true;
    notifyListeners();

    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/horarios/flutter?usuarioId=${Preferences.id}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});
      final horariosResponse = horariosResponseFromJson(resp.body);

      if (horariosResponse.horarios.isNotEmpty) {
        horarios.addAll(horariosResponse.horarios);
      }
      isLoading = false;
      notifyListeners();

      return horarios;
    } catch (e) {
      // print('Error: *** $e ***');
      isLoading = false;
      notifyListeners();
      return [];
    }
  }

  Future<String> saveHorario(Horario horario) async {
    isSaving = true;
    notifyListeners();

    final String? token = await _storage.read(key: 'token');

    final url = Uri.parse('${Environment.apiUrl}/horarios/${horario.id}');

    await http.put(url,
        body: horario.toJson(),
        headers: {'Content-Type': 'application/json', 'token': token!});

    final index = horarios.indexWhere((element) => element.id == horario.id);
    horarios[index] = horario;

    SnackbarGlobal.show('Actualización realizada con éxito!!');

    isSaving = false;
    notifyListeners();

    return horario.id;
  }
}
