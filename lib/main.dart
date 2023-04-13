import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:sexquare/blocs/blocs.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/routes/routes.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  await Firebase.initializeApp();
  await PushNotificationService.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
        ChangeNotifierProvider(create: (_) => LugarPorCoordenadasService()),
        ChangeNotifierProvider(create: (_) => ServiciosService()),
        ChangeNotifierProvider(create: (_) => ProcesosService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProcesosSearchProvider()),
        ChangeNotifierProvider(create: (_) => CandidatosService()),
        ChangeNotifierProvider(create: (_) => CambiosService()),
        ChangeNotifierProvider(create: (_) => LocalesService()),
        ChangeNotifierProvider(create: (_) => HorariosService()),
        ChangeNotifierProvider(create: (_) => HabitacionesService()),
        ChangeNotifierProvider(create: (_) => InstalacionesService()),
        ChangeNotifierProvider(create: (_) => VotosService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GpsBloc()),
          BlocProvider(create: (context) => LocationBloc()),
        ],
        child: const SexQuare(),
      ),
    ),
  );
}

class SexQuare extends StatefulWidget {
  const SexQuare({super.key});

  @override
  State<SexQuare> createState() => _SexQuareState();
}

class _SexQuareState extends State<SexQuare> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // final GlobalKey<ScaffoldMessengerState> messengerKey =
      // GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotificationService.messaging
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        List<String> campos = message.data['producto'].split(',');

        switch (campos[0].split('-')[1]) {
          case 'ROL':
            // final snackBar = SnackBar(
            //     content: Text('Nueva Solicitud - ${campos[1].split('-')[1]}'));
            // messengerKey.currentState?.showSnackBar(snackBar);
            navigatorKey.currentState?.pushNamed('cambio');
            break;
          case 'SQR':
            // final snackBar = SnackBar(
            //     content: Text('Nueva Reserva - ${campos[1].split('-')[1]}'));
            // messengerKey.currentState?.showSnackBar(snackBar);
            navigatorKey.currentState?.pushNamed('reserva');
            break;
          case 'MSG':
            // final snackBar = SnackBar(
            //     content: Text('Nuevo Mensaje - ${campos[1].split('-')[1]}'));
            // messengerKey.currentState?.showSnackBar(snackBar);
            navigatorKey.currentState?.pushNamed('message');
            break;
        }
      }
    });

    // Context!
    PushNotificationService.messagesStream.listen((message) {
      List<String> campos = message.split(',');

      switch (campos[0].split('-')[1]) {
        case 'ROL':
          // final snackBar = SnackBar(
          //     content: Text('Nueva Solicitud - ${campos[1].split('-')[1]}'));
          // messengerKey.currentState?.showSnackBar(snackBar);
          navigatorKey.currentState?.pushNamed('cambio', arguments: message);
          break;
        case 'SQR':
          // final snackBar = SnackBar(
          //     content: Text('Nueva Reserva - ${campos[1].split('-')[1]}'));
          // messengerKey.currentState?.showSnackBar(snackBar);
          navigatorKey.currentState?.pushNamed('reserva', arguments: message);
          break;
        case 'MSG':
          // final snackBar = SnackBar(
          //     content: Text('Nuevo Mensaje - ${campos[1].split('-')[1]}'));
          SnackbarGlobal.show('Nuevo Mensaje - ${campos[1].split('-')[1]}');
          navigatorKey.currentState?.pushNamed('message', arguments: message);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'seXquare',
      home: const HomeScreen(),
      initialRoute: 'loadingGPS',
      navigatorKey: navigatorKey, //Navegar
      scaffoldMessengerKey: SnackbarGlobal.key, // Snakc
      routes: appRoutes,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
