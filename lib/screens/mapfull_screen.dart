import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sexquare/global/environment.dart';

class MapFullScreen extends StatelessWidget {
  static const String routeName = 'mapfull';

  const MapFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ??
        {'lat': -4.066509, 'lng': -78.952647};
    final position = json.decode(jsonEncode(args));
   
    final myPosition = LatLng(position['lat'], position['lng']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Ubicación'),
      ),
      body: FlutterMap(
        options:
            MapOptions(center: myPosition, minZoom: 5, maxZoom: 30, zoom: 14),
        nonRotatedChildren: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
            additionalOptions: {
              'accessToken': Environment.mapBoxAccessToken,
              'id': 'mapbox/streets-v8'
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                  point: myPosition,
                  builder: (context) {
                    return const Icon(
                      Icons.my_location,
                      color: Colors.redAccent,
                      size: 40.0,
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
// -2.188275, -81.010076
