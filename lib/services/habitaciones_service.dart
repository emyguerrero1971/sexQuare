import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class HabitacionesService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  final List<Habitacion> habitaciones = [];
  bool isLoading = true;
  late Habitacion copyRegistroHabitacion;

  File? newImageFile;
  bool isSaving = false;

  HabitacionesService() {
    loadHabitaciones();
  }

  Future<List<Habitacion>> loadHabitaciones() async {
    isLoading = true;
    notifyListeners();

    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/habitaciones/flutter?usuarioId=${Preferences.id}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});
      final habitacionesResponse = habitacionesResponseFromJson(resp.body);

      if (habitacionesResponse.habitaciones.isNotEmpty) {
        habitaciones.addAll(habitacionesResponse.habitaciones);
      }
      isLoading = false;
      notifyListeners();

      return habitaciones;
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
      case 'https://res.cloudinary.com/dnnwiqvxe/image/upload/v1680570309/habitacion_vdr5qg.png':
        destroy = false;
    }

    if (destroy) {
      final urlDestroy =
          Uri.parse('${Environment.apiUrl}/uploads/habitaciones?img=$img');

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

  Future<String> saveHabitacion(Habitacion habitacion) async {
    isSaving = true;
    notifyListeners();

    final String? token = await _storage.read(key: 'token');

    final url =
        Uri.parse('${Environment.apiUrl}/habitaciones/${habitacion.id}');

    await http.put(url,
        body: habitacion.toJson(),
        headers: {'Content-Type': 'application/json', 'token': token!});

    final index =
        habitaciones.indexWhere((element) => element.id == habitacion.id);
    habitaciones[index] = habitacion;

    SnackbarGlobal.show('Actualización realizada con éxito!!');
    
    isSaving = false;
    notifyListeners();

    return habitacion.id;
  }

  void updateSelectedImage(String path, String propiedad) {
    switch (propiedad) {
      case 'imgAguaCaliente':
        copyRegistroHabitacion.imgAguaCaliente = path;
        break;
      case 'imgAguaEmbotellada':
        copyRegistroHabitacion.imgAguaEmbotellada = path;
        break;
      case 'imgAireAcondicionado':
        copyRegistroHabitacion.imgAireAcondicionado = path;
        break;
      case 'imgAlfombra':
        copyRegistroHabitacion.imgAlfombra = path;
        break;
      case 'imgAlmohada':
        copyRegistroHabitacion.imgAlmohada = path;
        break;
      case 'imgBanioPrivado':
        copyRegistroHabitacion.imgBanioPrivado = path;
        break;
      case 'imgCloset':
        copyRegistroHabitacion.imgCloset = path;
        break;
      case 'imgEspejo':
        copyRegistroHabitacion.imgEspejo = path;
        break;
      case 'imgExhibidor':
        copyRegistroHabitacion.imgExhibidor = path;
        break;
      case 'imgIntercomunicador':
        copyRegistroHabitacion.imgIntercomunicador = path;
        break;
      case 'imgKitAseoPersonal':
        copyRegistroHabitacion.imgKitAseoPersonal = path;
        break;
      case 'imgKitLimpieza':
        copyRegistroHabitacion.imgKitLimpieza = path;
        break;
      case 'imgLenceriaCama':
        copyRegistroHabitacion.imgLenceriaCama = path;
        break;
      case 'imgLlave':
        copyRegistroHabitacion.imgLlave = path;
        break;
      case 'imgPlanchador':
        copyRegistroHabitacion.imgPlanchador = path;
        break;
      case 'imgProtectorColchon':
        copyRegistroHabitacion.imgProtectorColchon = path;
        break;
      case 'imgPuertaServicio':
        copyRegistroHabitacion.imgPuertaServicio = path;
        break;
      case 'imgRefrigerador':
        copyRegistroHabitacion.imgRefrigerador = path;
        break;
      case 'imgSalaStar':
        copyRegistroHabitacion.imgSalaStar = path;
        break;
      case 'imgSujetadorSabana':
        copyRegistroHabitacion.imgSujetadorSabana = path;
        break;
      case 'imgTvCable':
        copyRegistroHabitacion.imgTvCable = path;
        break;
      case 'imgTvProyector':
        copyRegistroHabitacion.imgTvProyector = path;
        break;
      case 'imgVentilador':
        copyRegistroHabitacion.imgVentilador = path;
        break;
      case 'imgVestidor':
        copyRegistroHabitacion.imgVestidor = path;
        break;
      case 'imgWifi':
        copyRegistroHabitacion.imgWifi = path;
        break;
      case 'imgCalidadAlmohada':
        copyRegistroHabitacion.imgCalidadAlmohada = path;
        break;
      case 'imgCantidadAlmohada':
        copyRegistroHabitacion.imgCantidadAlmohada = path;
        break;
      case 'imgMaterialCama':
        copyRegistroHabitacion.imgMaterialCama = path;
        break;
      case 'imgMedidaCama':
        copyRegistroHabitacion.imgMedidaCama = path;
        break;
      case 'imgTipoBanio':
        copyRegistroHabitacion.imgTipoBanio = path;
        break;
      case 'imgTipoColchon':
        copyRegistroHabitacion.imgTipoColchon = path;
        break;
      default:
        copyRegistroHabitacion.imgHabitacion = path;
    }
    newImageFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
}
