import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/services/services.dart';

class HorarioWidget extends StatelessWidget {
  const HorarioWidget({super.key, required this.horario});

  final Horario horario;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        margin: const EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: 200.0,
        decoration: _horarioBorders(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _BackgroundImage(horario.imgHorario),
            Positioned(
              top: 82,
              right: 100,
              child: Text((horario.boolEstado) ? 'On' : 'Off',
                style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
            Positioned(
              top: 75,
              right: -5,
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, 'detalleHorario'),
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                color: Colors.white,
                iconSize: 32,
              ),
            ),
            _DiaHorario(
              horario.textDia, 
              horario.textPrimerIni, 
              horario.textPrimerFin,
              horario.textSegundoIni,
              horario.textSegundoFin)
          ],
        ),
      ),
    );
  }

  BoxDecoration _horarioBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}

class _DiaHorario extends StatelessWidget {
  final String dia;
  final String ent1;
  final String sal1;
  final String ent2;
  final String sal2;


  const _DiaHorario(this.dia, this.ent1, this.sal1, this.ent2, this.sal2);

  @override
  Widget build(BuildContext context) {
    final horariosService = Provider.of<HorariosService>(context);
    horariosService.copyRegistroHorario = horariosService.horarios[0].copy();

    return Container(
      width: double.infinity,
      height: 55,
      decoration:const  BoxDecoration(
          color: Color.fromRGBO(179, 10, 49, 0.20),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 5)
          ]),
      child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$dia:  ',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('$ent1 - $sal1       $ent2 - $sal2',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          )),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 200,
          color: Colors.black26,
          child: url == null
            ? const Image(
                image: AssetImage('assets/pngs/no-image.png'),
                fit: BoxFit.cover
              ) 
            : FadeInImage(
                placeholder: const AssetImage('assets/gifs/loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover),
            ),
      ),
    );
  }
}