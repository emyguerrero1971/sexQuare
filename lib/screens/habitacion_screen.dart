import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class HabitacionScreen extends StatelessWidget {
  static const String routeName = 'habitacion';
  const HabitacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitacionesService = Provider.of<HabitacionesService>(context);

    if (habitacionesService.isLoading) return const LoadingScreen(entidad: 'Habitaciones');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Habitaciones - ',
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
          itemCount: habitacionesService.habitaciones.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () async {
                habitacionesService.copyRegistroHabitacion = habitacionesService.habitaciones[index].copy();
                
                Navigator.pushNamed(context, 'detalleHabitacion',
                    arguments: ScreenArguments(
                        'imgHabitacion', 
                        'img',
                        habitacionesService.habitaciones[index].imgHabitacion
                ));
              },
              child: HabitacionWidget(
                habitacion: habitacionesService.habitaciones[index],
              ))),
    );
  }
}
