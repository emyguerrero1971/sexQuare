import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class InstalacionesService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final List<Instalacion> instalaciones = [];
  bool isLoading = true;
  late Instalacion copyRegistroInstalacion;

  File? newImageFile;
  bool isSaving = false;

  InstalacionesService() {
    loadInstalaciones();
  }

  Future<List<Instalacion>> loadInstalaciones() async {
    isLoading = true;
    notifyListeners();

    try {
      final String? token = await _storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/instalaciones/flutter?usuarioId=${Preferences.id}');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});
      final instalacionesResponse = instalacionesResponseFromJson(resp.body);

      if (instalacionesResponse.instalaciones.isNotEmpty) {
        instalaciones.addAll(instalacionesResponse.instalaciones);
      }
      isLoading = false;
      notifyListeners();

      return instalaciones;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      // print('Error: *** $e ***');
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
      case 'https://res.cloudinary.com/dnnwiqvxe/image/upload/v1681151798/instalacion_oa2ygh.png':
        destroy = false;
    }

    if (destroy) {
      final urlDestroy =
          Uri.parse('${Environment.apiUrl}/uploads/instalaciones?img=$img');

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

  Future<String> saveInstalacion(Instalacion instalacion) async {
    isSaving = true;
    notifyListeners();

    final String? token = await _storage.read(key: 'token');

    final url =
        Uri.parse('${Environment.apiUrl}/instalaciones/${instalacion.id}');

    await http.put(url,
        body: instalacion.toJson(),
        headers: {'Content-Type': 'application/json', 'token': token!});

    final index =
        instalaciones.indexWhere((element) => element.id == instalacion.id);
    instalaciones[index] = instalacion;

    SnackbarGlobal.show('Actualización realizada con éxito!!');

    isSaving = false;
    notifyListeners();

    return instalacion.id;
  }

  void updateSelectedImage(String path, String propiedad) {
    switch (propiedad) {
      case 'imgBar':
        copyRegistroInstalacion.imgBar = path;
        break;
      case 'imgBanioPublico':
        copyRegistroInstalacion.imgBanioPublico = path;
        break;
      case 'imgBeautySalom':
        copyRegistroInstalacion.imgBeautySalom = path;
        break;
      case 'imgBuzonQS':
        copyRegistroInstalacion.imgBuzonQS = path;
        break;
      case 'imgCajeroAutomatico':
        copyRegistroInstalacion.imgCajeroAutomatico = path;
        break;
      case 'imgCine':
        copyRegistroInstalacion.imgCine = path;
        break;
      case 'imgCircuitoCerrado':
        copyRegistroInstalacion.imgCircuitoCerrado = path;
        break;
      case 'imgCostura':
        copyRegistroInstalacion.imgCostura = path;
        break;
      case 'imgConcursos':
        copyRegistroInstalacion.imgConcursos = path;
        break;
      case 'imgDiskJokey':
        copyRegistroInstalacion.imgDiskJokey = path;
        break;
      case 'imgEfectos':
        copyRegistroInstalacion.imgEfectos = path;
        break;
      case 'imgGimnacio':
        copyRegistroInstalacion.imgGimnacio = path;
        break;
      case 'imgGuardia':
        copyRegistroInstalacion.imgGuardia = path;
        break;
      case 'imgHidromasaje':
        copyRegistroInstalacion.imgHidromasaje = path;
        break;
      case 'imgLaundry':
        copyRegistroInstalacion.imgLaundry = path;
        break;
      case 'imgLuces':
        copyRegistroInstalacion.imgLuces = path;
        break;
      case 'imgMiniHotel':
        copyRegistroInstalacion.imgMiniHotel = path;
        break;
      case 'imgParqueo':
        copyRegistroInstalacion.imgParqueo = path;
        break;
      case 'imgPiscina':
        copyRegistroInstalacion.imgPiscina = path;
        break;
      case 'imgPoledance':
        copyRegistroInstalacion.imgPoledance = path;
        break;
      case 'imgReservado':
        copyRegistroInstalacion.imgReservado = path;
        break;
      case 'imgRestaurant':
        copyRegistroInstalacion.imgRestaurant = path;
        break;
      case 'imgSalaFumadores':
        copyRegistroInstalacion.imgSalaFumadores = path;
        break;
      case 'imgSalaVip':
        copyRegistroInstalacion.imgSalaVip = path;
        break;
      case 'imgSauna':
        copyRegistroInstalacion.imgSauna = path;
        break;
      case 'imgShows':
        copyRegistroInstalacion.imgShows = path;
        break;
      case 'imgTaxi':
        copyRegistroInstalacion.imgTaxi = path;
        break;
      case 'imgTienda':
        copyRegistroInstalacion.imgTienda = path;
        break;
      case 'imgTurco':
        copyRegistroInstalacion.imgTurco = path;
        break;
      case 'imgVendingSnacks':
        copyRegistroInstalacion.imgVendingSnacks = path;
        break;
      case 'imgVendingBebidas':
        copyRegistroInstalacion.imgVendingBebidas = path;
        break;
      case 'imgWifi':
        copyRegistroInstalacion.imgWifi = path;
        break;
      default:
        copyRegistroInstalacion.imgInstalacion = path;
    }
    newImageFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
}
