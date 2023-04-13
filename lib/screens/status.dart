import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/services/services.dart';

class StatusScreen extends StatelessWidget {
  static const String routeName = 'status';

  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${socketService.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.emit('emitir-mensaje',
              {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}