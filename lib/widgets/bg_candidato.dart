import 'package:flutter/material.dart';

class BgCandidato extends StatelessWidget {
  BgCandidato({super.key});

  final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [
            0.3,
            0.95
          ],
          colors: [
            Color.fromRGBO(212, 121, 106, 0.5),
            Color(0xffffe3e8),
          ]));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 240.0,
          decoration: boxDecoration,
          child: Stack(
            children:  [
              Positioned(top: 80, left: -140, child: _BlueCircular1()),
              Positioned(top: 120, left: -170, child: _BlueCircular2()),
            ],
          ),
        ),
      ],
    );
  }
}

class _BlueCircular1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000.0,
      height: 1000.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [
              0.1,
              0.3
            ],
            colors: [
              Color(0xffffe3e8),
              Color.fromRGBO(212, 121, 106, 0.2),
              // Color(0xff08427F),
            ]),
      ),
    );
  }
}

class _BlueCircular2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900.0,
      height: 900.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [
              0.2,
              0.4
            ],
            colors: [
              Color(0xffffe3e8),
              Color.fromRGBO(212, 121, 106, 0.3),
              // Color(0xff08427F),
            ]),
      ),
    );
  }
}