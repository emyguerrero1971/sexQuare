import 'package:flutter/material.dart';

class HorarioImageWidget extends StatelessWidget {
  const HorarioImageWidget({
    super.key, 
    this.propiedad
  });

  final String? propiedad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 200,
        child: const Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: FadeInImage(
              placeholder: AssetImage('assets/pngs/no-image.png'),
              image: NetworkImage('https://res.cloudinary.com/dnnwiqvxe/image/upload/v1681269647/horario_baoz5f.png'),
              fit: BoxFit.cover,
            ),
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
}
