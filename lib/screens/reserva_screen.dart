import 'package:flutter/material.dart';

class ReservaScreen extends StatelessWidget {
  static const String routeName = 'reserva';
  
  const ReservaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments ?? 'No-data';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas Propietario'),
      ),
      body: const Center(
        child: 
          Text('Aqui va tabla Reservas'),
      ),
    );
  }
}