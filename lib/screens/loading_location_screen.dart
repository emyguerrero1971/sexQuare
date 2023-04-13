import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/services/services.dart';

class LoadingLocationScreen extends StatefulWidget {
  static const String routeName = 'loadingLocation';

  const LoadingLocationScreen({Key? key}) : super(key: key);

  @override
  State<LoadingLocationScreen> createState() => _LoadingLocationScreen();
}

class _LoadingLocationScreen extends State<LoadingLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: checkUbicadoState(context),
      builder: (context, snapshot) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
              CircularProgressIndicator(),
              SizedBox(height: 10.0),
              Text('Procesando...')
            ]));
      },
    ));
  }

  Future checkUbicadoState(BuildContext context) async {
    final lugarPorCoordenadasService = Provider.of<LugarPorCoordenadasService>(context, listen: false);

    await lugarPorCoordenadasService.isLocated(false);

    if (mounted) {
      Navigator.pushReplacementNamed(context, 'location');
    }
  }
}