import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class LocalesService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  final List<Local> locales = [];
  bool isLoading = true;
  late Local copyRegistroLocal;

  File? newImageFile;
  bool isSaving = false;

  LocalesService() {
    loadLocales();
  }

  Future<List<Local>> loadLocales() async {
    isLoading = true;
    notifyListeners();

    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/locales/flutter?usuarioId=${Preferences.id}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});
      final localesResponse = localesResponseFromJson(resp.body);

      if (localesResponse.locales.isNotEmpty) {
        locales.addAll(localesResponse.locales);
      }
      isLoading = false;
      notifyListeners();

      return locales;
    } catch (e) {
      // print('Error: *** $e ***');
      isLoading = false;
      notifyListeners();
      return [];
    }
  }

  Future<String?> uploadImage(img) async {
    if (newImageFile == null) return null;

    isSaving = true;
    notifyListeners();

    bool destroy = true;
    // Elimina la imagen anterior
    switch (img) {
      case 'https://res.cloudinary.com/dnnwiqvxe/image/upload/v1680458308/no-image_qzxpce.png':
      case 'https://res.cloudinary.com/dnnwiqvxe/image/upload/v1681151768/nightclub_qbrrky.png':
        destroy = false;
    }

    if (destroy) {
      final urlDestroy =
          Uri.parse('${Environment.apiUrl}/uploads/locales?img=$img');

      await http.delete(urlDestroy);
    }

    // Agrega una nueva imagen q reemplazara a la imagen anterior
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dnnwiqvxe/image/upload?upload_preset=sexquare');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newImageFile!.path);
    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      // print('Error: ${resp.body}');
      return null;
    } else {
      if (resp.statusCode == 200) {
        SnackbarGlobal.show('Imagen actualizada con éxito!!');
      } else {
        SnackbarGlobal.show('Error inesperado!!');
      }
    }

    newImageFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }

  Future<String> saveLocal(Local local) async {
    isSaving = true;
    notifyListeners();

    final String? token = await _storage.read(key: 'token');

    final url = Uri.parse('${Environment.apiUrl}/locales/${local.id}');
    
    await http.put(url,
        body: local.toJson(),
        headers: {'Content-Type': 'application/json', 'token': token!});

    final index = locales.indexWhere((element) => element.id == local.id);
    locales[index] = local;

    SnackbarGlobal.show('Actualización realizada con éxito!!');

    isSaving = false;
    notifyListeners();

    return local.id;
  }

  void updateSelectedImage(String path, String propiedad) {
    switch (propiedad) {
      // case 'propiedadName':
      //   copyRegistroLocal.porpiedadName = path;
      //   break;
      default:
        copyRegistroLocal.imgLocal = path;
    }
    newImageFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
}
