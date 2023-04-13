import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = 'users';

  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('UsersScreen'),
      ),
    );
  }
}
