import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/providers/providers.dart';

class LocalImageWidget extends StatelessWidget {
  const LocalImageWidget({
    super.key, 
    this.propiedad
  });

  final String? propiedad;

  @override
  Widget build(BuildContext context) {

    final localForm = Provider.of<LocalFormProvider>(context);

    String? getPicture() {
      switch (propiedad) {
        // case 'propiedadName':
        //   return localForm.local.propiedadName;
        default:
          return localForm.local.imgLocal;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 200,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: getImage(getPicture())
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.black,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 5))
  ]);

  Widget getImage(String? imagen) {
    if (imagen == null) {
      return const Image(
        image: AssetImage('assets/pngs/no-image.png'), 
        fit: BoxFit.cover);
    }

    if (imagen.startsWith('http')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/pngs/no-image.png'),
        image: NetworkImage(imagen),
        fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(imagen),
      fit: BoxFit.cover,
    );
  }
}
