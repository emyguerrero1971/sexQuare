import 'package:flutter/material.dart';

class ServiceConditionScreen extends StatelessWidget {
  static const String routeName = 'conditions';

  const ServiceConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Condiciones de servicio'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 18,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'Condiciones:',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    '\t\t\t\t\t1.- Para obtener información actualizada, asegúrese de tener una conexión a internet, \t\t\t\t2.- Después de descargar e instalar nuestra App en su dispositivo, se le asignará por defecto el ROL de Cliente.\t\t\t\t3.- Al instalar nuestra App aceptas explícitamente nuestros términos y condiciones para participar en procesos de medición automática y de calificación explícita. \t\t\t\t4.- Las mediciones y calificaciones realizadas son solo de caracter informativo para mejorar nuestros Servicios. \t\t\t\t5.- En los apartados correspondientes, solo se presentan resultados de las calificaciones de los clientes. \t\t\t\t6.- Las calificaciones se muestran en formato TOP 5, Top 10, ..., TOP 100, y pueden variar de acuerdo a la participación de los clientes a lo largo del tiempo. \t\t\t\t7.- El Rol PRO es exclusivo para propietarios de locales y debe ser solicitado por medio de nuestros canales de contacto. \t\t\t\t8.- Igualmente el Rol SER es exclusivo para usuarios de nuestro directorio y ser solicitado a través de nuestros canales de contacto. \t\t\t\t9.- Si se detecta que un usuario está haciendo mal uso de la plataforma, ya sea mediante uso de técnicas de hackeo, técnicas de reconfiguración de routers u otras formas que la Administración considere malas prácticas, será bloqueado termporalemente por un lapso de 24 o 48 horas hasta realizar las verificaciones pertinentes, en caso de reincidencia, se aplicará bloqueo permanente.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'Información de contacto',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '\t\t\t\tWhatsApp: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: '+593 99 088 2956',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '\t\t\t\tCorreo electrónico: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'powerxquare@gmail.com',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 18,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'seXquare - Administración',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
