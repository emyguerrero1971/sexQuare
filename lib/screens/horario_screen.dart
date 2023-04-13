import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class HorarioScreen extends StatelessWidget {
  static const String routeName = 'horario';
  const HorarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final horariosService = Provider.of<HorariosService>(context);

    if (horariosService.isLoading) {
      return const LoadingScreen(entidad: 'Horarios');
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Horarios - ',
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
          itemCount: horariosService.horarios.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                horariosService.copyRegistroHorario =
                    horariosService.horarios[index].copy();
                Navigator.pushNamed(context, 'detalleHorario');
              },
              child: HorarioWidget(
                horario: horariosService.horarios[index],
              ))),
    );
  }
}
