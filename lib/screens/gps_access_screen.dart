import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sexquare/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  static const String routeName = 'gps';

  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
              ? const _EnabledGpsMessage()
              : const _AccessButtom();
          },
        )
      ),
    );
  }
}

class _AccessButtom extends StatelessWidget {
  const _AccessButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No se puede acceder al GPS'),
        MaterialButton(
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          onPressed: () {
            // final gpsBloc = context.read<GpsBloc>();
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          child: const Text(
            'Solicitar Acceso',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Habilitar GPS',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w300));
  }
}
