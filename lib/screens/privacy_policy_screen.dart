import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String routeName = 'politic';

  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Políticas de privacidad'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '1. Introducción',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      text: 'La presente Política de Privacidad ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '(Política)',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text:
                            ' provee información sobre el tratamiento de datos personales de responsabilidad de seXquare.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '2. Tratamiento de Datos Personales',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    'Su privacidad es muy importante para nosotros. En seXquare, tenemos algunos principios fundamentales:',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    'Somos cuidadosos con la información personal que le pedimos que nos proporcione y con la información personal que recopilamos a través de nuestros servicios. La almacenamos sólo durante el tiempo que sea necesario mantenerla. Nuestro objetivo es lograr una total transparencia sobre cómo recopilamos, utilizamos y compartimos la información obtenida.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    'A continuación encontrará nuestra política de privacidad, que incorpora y aclara estos principios.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '2.1 Qué cubre esta Política',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    'Esta política de privacidad se aplica a la información que recopilamos cuando utiliza',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    '• Nuestro sitio web sexquare.com\n• Nuestra App móvil seXquare para Android e iOS',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    'A lo largo de esta Política de Privacidad nos referiremos a nuestro sitio web, aplicación móvil y otros productos y servicios colectivamente como "Servicios".',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '2.2. Información que recogemos',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                    text:
                    'Sólo recogemos información si tenemos una razón para hacerlo, por ejemplo, para prestar nuestros servicios, para comunicarnos con usted o para mejorar nuestros servicios. Recogemos información de dos maneras: cuando nos la proporciona explícitamnete o automáticamente a través del funcionamiento de nuestros Servicios.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '2.2.1. Información que nos proporciona',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Número de móvil: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Lo usamos exclusivamnete para crear su cuenta y asegurarnos de que sea única,',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Género: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Para identificar los Servicios que pocdemos proporcionarle.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Edad: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Para acceder a Servicios especiales,',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Etnia: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Para saber que culturas usan nuestros Servicios,',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Religión: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Para proporcionar información estadística segmentada,',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    color: Color(0xff191919),
                    letterSpacing: -0.28,
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '2.2.2. Información recopilada automáticamente',
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Coordenadas: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Las usamos para poder mostrarle al usuario los locales registrados en la zona.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Vistas: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Nos ayuda a determinar las interacción usuario-cliente.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
                padding:
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '• Likes: ',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Para ofrecer nuestros Servicos según preferencias del cliente.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.justify,
                )),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
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
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'WhatsApp: ',
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
                const EdgeInsets.only(top: 10.0, left: 25.0, right: 15.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: 'Correo electrónico: ',
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
              height: 30.0,
            ),
            Container(
              padding:
              const EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
              child: const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
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
