import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class InstalacionScreen extends StatelessWidget {
  static const String routeName = 'instalacion';
  const InstalacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final instalacionesService = Provider.of<InstalacionesService>(context);

    if (instalacionesService.isLoading) return const LoadingScreen(entidad: 'Instalaciones');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Instalaciones - ',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              Preferences.nombre,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: instalacionesService.instalaciones.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () async {
                instalacionesService.copyRegistroInstalacion = instalacionesService.instalaciones[index].copy();
                
                Navigator.pushNamed(context, 'detalleInstalacion',
                    arguments: ScreenArguments(
                        'imgInstalacion', 
                        'img',
                        instalacionesService.instalaciones[index].imgInstalacion
                ));
              },
              child: InstalacionWidget(
                instalacion: instalacionesService.instalaciones[index],
              ))),
      // floatingActionButton: Align(
      //   alignment: const Alignment(1, -0.70),
      //   child: FloatingActionButton(
      //     backgroundColor: AppTheme.primaryColorApp,
      //     elevation: 0,
      //     onPressed: () {},
      //     child: const Icon(Icons.save),
      //   ),
      // ),
    );
  }
}
