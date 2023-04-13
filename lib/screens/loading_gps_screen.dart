import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sexquare/blocs/blocs.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class LoadingGPSScreen extends StatelessWidget {
  static const String routeName = 'loadingGPS';

  const LoadingGPSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        if (state.isAllGranted) {
          return (Preferences.token != '')
              ? const LoadingAPPScreen()
              : const WelcomeScreen();
        } else {
          return const GpsAccessScreen();
        }
      },
    ));
  }
}