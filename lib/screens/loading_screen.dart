import 'package:flutter/material.dart';

import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, required this.entidad});

  final String entidad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$entidad - ',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                Preferences.nombre,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        body: const Center(
            child: CircularProgressIndicator(color: AppTheme.primaryColorApp)));
  }
}
