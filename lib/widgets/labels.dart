import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String textCuenta;
  final String textEnlace;
  final String route;

  const Labels(
      {super.key,
      required this.route,
      required this.textCuenta,
      required this.textEnlace});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(textCuenta,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 10.0),
        GestureDetector(
          child: Text(
            textEnlace,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
        )
      ],
    );
  }
}

