import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io_cli;
import 'package:sexquare/global/environment.dart';

enum ServerStatus { onLine, offLine, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io_cli.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  
  io_cli.Socket get socket => _socket;
  Function get emit => _socket.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart Client
    // _socket = io_cli.io('http://143.198.154.210/', {   //Servidor de Digital ocean
    _socket = io_cli.io(Environment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
    });

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.onLine;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offLine;
      notifyListeners();
    });

  }
}
