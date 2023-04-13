import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String subTitle;

  const Logo({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50.0),
        width: 170.0,
        child: Column(
          children: [
            const Image(image: AssetImage('assets/pngs/logo.png')),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
