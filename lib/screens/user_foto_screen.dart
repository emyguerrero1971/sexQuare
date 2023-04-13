import 'package:flutter/material.dart';
import 'package:sexquare/widgets/widgets.dart';

class UserFotoScreen extends StatelessWidget {
  static const String routeName = 'userFoto';

  const UserFotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos y Documentos'),
      ),
      // body: ListView.separated(
        body: ListView(
          children: const [
            FotoCard(),
          ],
          
        )
        // itemCount: 5,
        // separatorBuilder: (_, _) => const Divider(),
    );
  }
}