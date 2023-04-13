import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class LocalScreen extends StatelessWidget {
  static const String routeName = 'local';
  const LocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localesService = Provider.of<LocalesService>(context);
    
    if (localesService.isLoading) return const LoadingScreen(entidad: 'Locales');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Locales - ',
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
          itemCount: localesService.locales.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () async {
                localesService.copyRegistroLocal =
                    localesService.locales[index].copy();

                Navigator.pushNamed(context, 'detalleLocal',
                    arguments: ScreenArguments('imgLocal', 'nulo',
                        localesService.locales[index].imgLocal));
              },
              child: const Text('Hola'),
              )
          ),
    );
  }
}