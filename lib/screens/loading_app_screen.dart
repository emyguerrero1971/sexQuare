import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:sexquare/blocs/blocs.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/providers/providers.dart';

class LoadingAPPScreen extends StatefulWidget {
  static const String routeName = 'loadingAPP';

  const LoadingAPPScreen({Key? key}) : super(key: key);

  @override
  State<LoadingAPPScreen> createState() => _LoadingAPPScreenState();
}

class _LoadingAPPScreenState extends State<LoadingAPPScreen> {
  @override
  void initState() {
    super.initState();

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CandidatosProvider(),
          lazy: false,
        ),
      ],
      child: Scaffold(
        body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10.0),
                Text('Iniciando en dispositivo ${Preferences.dispositivoId} espere...'),
                const SizedBox(height: 8),
                Text('Reportes al WhatsApp: ${Preferences.numeroContacto}'),
                const SizedBox(height: 8),
                Text('Versión: ${Preferences.version}'),
              ]));
        },
      )),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      // conectar al socket server

      if (mounted) {
        Navigator.pushReplacementNamed(context, 'home',
            arguments: Preferences.procesoId);
      }
    } else {
      // conectar al socket server
      // generar token
      if (mounted) {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WelcomeScreen(),
                transitionDuration: const Duration(milliseconds: 0)));
      }
    }
  }
}
