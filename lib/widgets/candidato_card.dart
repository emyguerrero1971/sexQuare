import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class CandidatoCard extends StatelessWidget {
  final int ranking;
  final Candidato candidato;
  final CandidatosService candidatosService;

  const CandidatoCard(
      {super.key,
      required this.ranking,
      required this.candidato,
      required this.candidatosService});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1.0, bottom: 15.0),
      width: double.infinity,
      height: 240.0,
      decoration: _cardBorders(),
      child: Stack(children: [
        BgCandidato(),
        _DetalleCandidato(
            ranking: ranking,
            candidato: candidato,
            candidatosService: candidatosService)
      ]),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black54, offset: Offset(2.5, 0.0), blurRadius: 5.0)
        ]);
  }
}

class _DetalleCandidato extends StatefulWidget {
  final int ranking;
  final Candidato candidato;
  final CandidatosService candidatosService;

  const _DetalleCandidato(
      {Key? key,
      required this.ranking,
      required this.candidato,
      required this.candidatosService})
      : super(key: key);

  @override
  State<_DetalleCandidato> createState() => _DetalleCandidatoState();
}

class _DetalleCandidatoState extends State<_DetalleCandidato> {
  final textController = TextEditingController();
  final duration = const Duration(milliseconds: 300);
  bool submit = false;

  @override
  void initState() {
    super.initState();
    textController.text = Preferences.numCel;
  }

  Color getDynamicColor(String color) {
    String auxColor = widget.candidato.color.replaceAll('#', '0xff');
    Color color = Color(int.parse(auxColor));
    return color; //default color.
  }

  late List<Mensaje> mensajes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: Column(children: [
        SizedBox(
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: TextButton(
                      onPressed: () {
                        message(context, 'Envía mensajes... en construcción!!');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Mensajes',
                          style: TextStyle(
                              color: Color(0xff831007),
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                              fontSize: 14)))),
              Center(
                  child: TextButton(
                      onPressed: () {
                        message(context,
                            'Fotos de presentación  ... en construcción!!');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Galería',
                          style: TextStyle(
                              color: Color(0xff831007),
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                              fontSize: 14)))),
              Center(
                  child: TextButton(
                      onPressed: () {
                        message(context,
                            'Muestra nivel de aceptación  ... en construcción!!');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Ranking',
                          style: TextStyle(
                              color: Color(0xff831007),
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                              fontSize: 14)))),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: duration,
                              reverseTransitionDuration: duration,
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: ImageFullScreen(
                                      widget.candidato.img,
                                      widget.candidato.id,
                                      widget.candidato.nombre),
                                );
                              },
                            ),
                          );
                        },
                        child: Hero(
                          tag: widget.candidato.catastro,
                          child: CircleAvatar(
                            maxRadius: 60,
                            backgroundColor:
                                const Color.fromRGBO(212, 121, 106, 0.3),
                            backgroundImage: NetworkImage(widget.candidato.img),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.40),
                          child: Text(
                            widget.candidato.nombre,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.40),
                          child: Text(
                            widget.candidato.nacionalidad,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 14.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.40),
                          child: Text(
                            widget.candidato.lugarNacimiento,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.black45,
                                fontStyle: FontStyle.italic,
                                fontSize: 14.0,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.40),
                          child: Text(
                            widget.candidato.saludo,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontStyle: FontStyle.italic,
                                fontSize: 14.0,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.40),
                          child: Text(getDynamicGenero(widget.candidato.genero),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width * 0.20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text('${widget.ranking + 1}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: getDynamicColor(
                                            widget.candidato.color)))),
                          ),
                          const SizedBox(
                            height: 18,
                            child: Text('PODIUM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 5.0,),
                            TextButton(
                                onPressed: () {
                                  verMas(context);
                                },
                                child: const Text('Conóceme!!',
                                    style: TextStyle(
                                        color: Color(0xff831007),
                                        fontWeight: FontWeight.w900,
                                        decoration: TextDecoration.underline,
                                        fontSize: 16))),
                          ],
                        ),
                        const SizedBox(width: 25.0),
                        GestureDetector(
                          onTap: () {
                            verMas(context);
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Para tí...',
                                  style: TextStyle(
                                      color: Color(0xff831007),
                                      fontWeight: FontWeight.w900,
                                      decoration: TextDecoration.underline,
                                      fontSize: 16),
                                ),
                                TextSpan(
                                  text: '😈', // emoji characters
                                  style: TextStyle(
                                      fontFamily: 'EmojiOne', fontSize: 24),
                                ), // non-emoji characters
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 100.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(179, 10, 49, 0.55),
                      ),
                      onPressed: () => votar(context, widget.candidatosService),
                      child: const Text(
                        'TOP',
                        style: TextStyle(color: Colors.black45),
                      )),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 100.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(179, 10, 49, 0.30),
                      ),
                      onPressed: () => votar(context, widget.candidatosService),
                      child: const Text(
                        'MID',
                        style: TextStyle(color: Colors.black45),
                      )),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 100.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(179, 10, 49, 0.20),
                      ),
                      onPressed: () => votar(context, widget.candidatosService),
                      child: const Text(
                        'LOW',
                        style: TextStyle(color: Colors.black45),
                      )),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget buildMensajes(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
          onPressed: () {
            message(context, 'En construccion');
          },
          child: const Text('Mensajes',
              style: TextStyle(
                  height: 0.5,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  fontSize: 14))),
    );
  }

  votar(context, CandidatosService candidatosService) {
    if (Preferences.numCel != '9999999999') {
      if (!Platform.isIOS) {
        //Codigo para Android
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children:const [
                    Text('Verifica tu voto', 
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                    ),
                    Divider()
                  ],
                ),
                content: Text("Votar por: ${widget.candidato.nombre}"),
                actions: [
                  ElevatedButton(
                    onPressed: submit
                        ? null
                        : () {
                            submit = !submit;
                            setState(() {});
                            exitDialog(context);
                            final socketService = Provider.of<SocketService>(
                                context,
                                listen: false);
                            registrarVoto(
                                widget.candidato.id, candidatosService);
                            socketService.socket.emit('emitir-mensaje',
                                {'proceso': Preferences.procesoId});
                            socketService.socket.emit(
                                'votar-candidato-sexquare',
                                {'proceso': Preferences.procesoId});
                          },
                    autofocus: true,
                    // textColor: AppTheme.primaryColorApp,
                    child: const Text('Votar'),
                  ),
                  TextButton(
                    onPressed: () => exitDialogVotar(context),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              );
            }).then((value) => setState(() {
              //sleep(const Duration(seconds: 1));
              //Preferences.refresh = true;
              /*if (mounted) {
                Preferences.refresh = true;
                Navigator.pushNamed(context, 'home',
                    arguments: procesoId);
              }*/
            }));
      }

      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Column(
            children: const [
              Text(
                'Referenciado por',
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
              ),
              Divider()
            ],
          ),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  final socketService =
                      Provider.of<SocketService>(context, listen: false);
                  socketService.socket
                      .emit('votar-candidato-sexquare', {'flag': true});

                  registrarVoto(widget.candidato.id, candidatosService);
                },
                child: const Text('Votar')),
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => exitDialogVotar(context),
                child: const Text('Cancelar')),
          ],
        ),
      );
    } else {
      if (mounted) {
        Preferences.candidatoId = widget.candidato.id;
        //Preferences.numCel = textController.text;
        //Navigator.pushReplacementNamed(context, 'loadingRegister');
      }
    }
  }

  void exitDialogVotar(context) {
    Navigator.pop(context);
  }

  registrarVoto(String candidatoId, CandidatosService candidatosService) async {
    candidatosService.guardarVoto(candidatoId);
    
    //final authService = Provider.of<AuthService>(context);
    //print(authService);
  }

  void revocar(nombre) {
    message(context,
        'Se puede revocar luego de 30 días de la fecha de votación...');
  }

  verMas(context) async {
    final catastro = await obtenerCatastroCandidato(widget.candidato.catastro);

    if (!Platform.isIOS) {
      //Codigo para Android
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Column(
                children: [
                  Text(
                    catastro[0].nombre,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  const Divider()
                ],
              ),
              content: SingleChildScrollView(
                child: showCatastro(catastro),
              ),
              actions: [
                MaterialButton(
                  onPressed: () => exitDialog(context),
                  elevation: 5.0,
                  textColor: AppTheme.primaryColorApp,
                  child: const Text('Salir'),
                )
              ],
            );
          });
    }

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Column(
          children: [
            Text(
              widget.candidato.nombre,
              style: const TextStyle(color: Colors.blue),
            ),
            const Divider()
          ],
        ),
        content: SingleChildScrollView(
          child: showCatastro(catastro),
        ),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () => exitDialog(context),
              child: const Text('Salir')),
        ],
      ),
    );
  }

  Column showCatastro(List<Catastro> catastro) {
    String estadoCivil = '';
    String getEstadoCivil(String paramEstadoCivil) {
      switch (paramEstadoCivil) {
        case 'S':
          estadoCivil = 'Soltero';
          break;
        case 'C':
          estadoCivil = 'Casado';
          break;
        case 'D':
          estadoCivil = 'Divorciado';
          break;
        case 'V':
          estadoCivil = 'Viudo';
          break;
        default:
          estadoCivil = 'Otro';
      }
      return estadoCivil;
    }

    String signo = '';
    String getSigno(String paramSigno) {
      switch (paramSigno) {
        case 'A':
          signo = 'Acuario';
          break;
        case 'P':
          signo = 'Piscis';
          break;
        case 'R':
          signo = 'Aries';
          break;
        case 'T':
          signo = 'Tauro';
          break;
        case 'G':
          signo = 'Géminis';
          break;
        case 'C':
          signo = 'Cáncer';
          break;
        case 'L':
          signo = 'Leo';
          break;
        case 'V':
          signo = 'Virgo';
          break;
        case 'B':
          signo = 'Libra';
          break;
        case 'E':
          signo = 'Escorpión';
          break;
        case 'S':
          signo = 'Sagitario';
          break;
        case 'I':
          signo = 'Caprocornio';
          break;
      }
      return signo;
    }

    String edad = '';
    String getEdad(String paramEdad) {
      switch (paramEdad) {
        case '1':
          edad = 'Novata';
          break;
        case '2':
          edad = 'Intermedia';
          break;
        case '3':
          edad = 'Experta';
          break;
        case '4':
          edad = 'Master';
          break;
        default:
          edad = 'Adivina';
      }
      return edad;
    }

    String genero = '';
    String getGenero(String paramGenero) {
      switch (paramGenero) {
        case 'M':
          genero = 'Mujer';
          break;
        case 'H':
          genero = 'Hombre';
          break;
        case 'G':
          genero = 'Gay';
          break;
        case 'L':
          genero = 'Lesbiana';
          break;
        case 'T':
          genero = 'Transexual';
          break;
        case 'B':
          genero = 'Bisexual';
          break;
        default:
          genero = 'Otro';
      }
      return genero;
    }

    String etnia = '';
    String getEtnia(String paramEtnia) {
      switch (paramEtnia) {
        case 'B':
          etnia = 'Blanca';
          break;
        case 'N':
          etnia = 'Negra';
          break;
        case 'L':
          etnia = 'Latina';
          break;
        case 'C':
          etnia = 'Caribe';
          break;
        case 'A':
          etnia = 'Asiática';
          break;
        case 'P':
          etnia = 'Persa';
          break;
        case 'H':
          etnia = 'Hindú';
          break;
        default:
          etnia = 'Otro';
      }
      return etnia;
    }

    String ojos = '';
    String getOjos(String paramOjos) {
      switch (paramOjos) {
        case 'M':
          ojos = 'Marrón';
          break;
        case 'V':
          ojos = 'Verde';
          break;
        case 'A':
          ojos = 'Azul';
          break;
        case 'G':
          ojos = 'Gris';
          break;
        case 'N':
          ojos = 'Negro';
          break;
        case 'R':
          ojos = 'Rojo';
          break;
        case 'B':
          ojos = 'Ambar';
          break;
        case 'L':
          ojos = 'Violeta';
          break;
        default:
          ojos = 'Otro';
      }
      return ojos;
    }

    String nariz = '';
    String getNariz(String paramNariz) {
      switch (paramNariz) {
        case 'C':
          nariz = 'Carnosa';
          break;
        case 'G':
          nariz = 'Griega';
          break;
        case 'P':
          nariz = 'Respingada';
          break;
        case 'A':
          nariz = 'Aguileña';
          break;
        case 'R':
          nariz = 'Romana';
          break;
        case 'D':
          nariz = 'Duquesa';
          break;
        default:
          nariz = 'Otra';
      }
      return nariz;
    }

    String labios = '';
    String getLabios(String paramLabios) {
      switch (paramLabios) {
        case 'N':
          labios = 'Normales';
          break;
        case 'G':
          labios = 'Gruesos';
          break;
        case 'F':
          labios = 'Finos';
          break;
        case 'S':
          labios = 'Superior Grueso';
          break;
        case 'I':
          labios = 'Inferior Grueso';
          break;
        case 'M':
          labios = 'De muñeca';
          break;
        case 'A':
          labios = 'Arco de Cupido';
          break;
        default:
          labios = 'Otros';
      }
      return labios;
    }

    String cabello = '';
    String getCabello(String paramCabello) {
      switch (paramCabello) {
        case 'N':
          cabello = 'Negro';
          break;
        case 'C':
          cabello = 'Castaño';
          break;
        case 'R':
          cabello = 'Rubio';
          break;
        case 'P':
          cabello = 'Pelirojo';
          break;
        case 'G':
          cabello = 'Gris';
          break;
        case 'B':
          cabello = 'Blanco';
          break;
        default:
          cabello = 'Otro';
      }
      return cabello;
    }

    String piel = '';
    String getPiel(String paramPiel) {
      switch (paramPiel) {
        case 'R':
          piel = 'Rosa';
          break;
        case 'B':
          piel = 'Blanca';
          break;
        case 'G':
          piel = 'Beige';
          break;
        case 'M':
          piel = 'Marron';
          break;
        case 'N':
          piel = 'Negra';
          break;
        default:
          piel = 'Otro';
      }
      return piel;
    }

    String contextura = '';
    String getContextura(String paramContextura) {
      switch (paramContextura) {
        case '':
          contextura = 'Normal';
          break;
        case 'D':
          contextura = 'Delgada';
          break;
        case 'G':
          contextura = 'Gruesa';
          break;
        default:
          contextura = 'Otro';
      }
      return contextura;
    }

    String caracter = '';
    String getCaracter(String paramCaracter) {
      switch (paramCaracter) {
        case 'F':
          caracter = 'Flemático';
          break;
        case 'C':
          caracter = 'Colérico';
          break;
        case 'S':
          caracter = 'Sanguíneo';
          break;
        case 'A':
          caracter = 'Apático';
          break;
        case 'P':
          caracter = 'Apasionado';
          break;
        case 'T':
          caracter = 'Sentimental';
          break;
        case 'N':
          caracter = 'Nervioso';
          break;
        case 'M':
          caracter = 'Amorfo';
          break;
        case 'I':
          caracter = 'Inseguro';
          break;
        case 'O':
          caracter = 'Obsesivo';
          break;
        case 'B':
          caracter = 'Sencible';
          break;
        default:
          caracter = 'Otro';
      }
      return caracter;
    }

    String religion = '';
    String getReligion(String paramReligion) {
      switch (paramReligion) {
        case 'C':
          religion = 'Cristiana';
          break;
        case 'H':
          religion = 'Hindú';
          break;
        case 'B':
          religion = 'Budista';
          break;
        case 'I':
          religion = 'Islam';
          break;
        case 'J':
          religion = 'Judía';
          break;
        case 'F':
          religion = 'Africana';
          break;
        case 'A':
          religion = 'Ateo';
          break;
        default:
          religion = 'Otra';
      }
      return religion; //default color.
    }

    String estudios = '';
    String getEstudios(String paramEstudios) {
      switch (paramEstudios) {
        case 'P':
          estudios = 'Primaria';
          break;
        case 'B':
          estudios = 'Ciclo Básico';
          break;
        case 'S':
          estudios = 'Secundaria';
          break;
        case 'G':
          estudios = 'Tecnología';
          break;
        case 'T':
          estudios = 'Tercer Nivel';
          break;
        case 'C':
          estudios = 'Cuarto Nivel';
          break;
        default:
          estudios = 'Otro';
      }
      return estudios;
    }

    String flor = '';
    String getFlor(String paramFlor) {
      switch (paramFlor) {
        case 'T':
          flor = 'Tulipanes';
          break;
        case 'V':
          flor = 'Violetas';
          break;
        case 'M':
          flor = 'Margaritas';
          break;
        case 'O':
          flor = 'Orquídeas';
          break;
        case 'R':
          flor = 'Rosas';
          break;
        case 'J':
          flor = 'Jazmines';
          break;
        case 'G':
          flor = 'Girasoles';
          break;
        case 'A':
          flor = 'Alstroemerias';
          break;
        case 'D':
          flor = 'Gladiolos';
          break;
        case 'E':
          flor = 'Claveles';
          break;
        case 'L':
          flor = 'Lirios';
          break;
        case 'C':
          flor = 'Calas';
          break;
        default:
          flor = 'Otra';
      }
      return flor;
    }

    String getIdiomas(String paramIdiomas) {
      String idiomas = '';
      List<String> idiomasList = paramIdiomas.split('|');

      for (String item in idiomasList) {
        switch (item) {
          case 'S':
            idiomas += 'Español, ';
            break;
          case 'E':
            idiomas += 'Inglés, ';
            break;
          case 'P':
            idiomas += 'Portugués, ';
            break;
          case 'F':
            idiomas += 'Francés, ';
            break;
          case 'I':
            idiomas += 'Italiano, ';
            break;
          case 'G':
            idiomas += 'Alemán, ';
            break;
          case 'R':
            idiomas += 'Ruso, ';
            break;
          case 'C':
            idiomas += 'Chino, ';
            break;
          case 'J':
            idiomas += 'Japonés, ';
            break;
          case 'H':
            idiomas += 'Hindú, ';
            break;
          case 'A':
            idiomas += 'Arabe, ';
            break;
          default:
            idiomas += 'Otros';
            break;
        }
      }
      return idiomas; //default color.
    }

    String gift = '';
    String getGift(String paramGift) {
      switch (paramGift) {
        case 'J':
          gift = 'Joya';
          break;
        case 'E':
          gift = 'Entrsda Evento';
          break;
        case 'P':
          gift = 'Perfume';
          break;
        case 'V':
          gift = 'Viaje';
          break;
        case 'C':
          gift = 'Cena';
          break;
        case 'R':
          gift = 'Ramo de Flores';
          break;
        case 'N':
          gift = 'Lencería';
          break;
        case 'L':
          gift = 'Libro';
          break;
        case 'M':
          gift = 'Mascota';
          break;
        case 'T':
          gift = 'Chocolate';
          break;
        case 'H':
          gift = 'Peluche';
          break;
        case 'S':
          gift = 'Sernata';
          break;
        default:
          gift = 'Otro';
      }
      return gift;
    }

    Color getColorCatastro(String color) {
      String auxColor = widget.candidato.color.replaceAll('#', '0xff');
      Color color = Color(int.parse(auxColor));
      return color; //default color.
    }

    // final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fecha de Nacimiento: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].fechaNacimiento!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Estado Civil: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getEstadoCivil(catastro[0].estadoCivil!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Celular: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].celular!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Celular Alterno: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].celular2!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Email: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].email!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Signo Zodiacal: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getSigno(catastro[0].signo!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edad: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getEdad(catastro[0].edad!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Género: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getGenero(catastro[0].genero!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Raza: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getEtnia(catastro[0].etnia!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Color de Ojos: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getOjos(catastro[0].ojos!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tipo de Naríz: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getNariz(catastro[0].nariz!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Tipo de Labios: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getLabios(catastro[0].labios!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Color de Cabello: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getCabello(catastro[0].cabello!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Color de Piel: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getPiel(catastro[0].piel!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Contextura: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getContextura(catastro[0].contextura!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Carácter: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getCaracter(catastro[0].caracter!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Religión: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getReligion(catastro[0].religion!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Estudios: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getEstudios(catastro[0].estudios!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profesión: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].profesion!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Flor preferida: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getFlor(catastro[0].flor!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Regalo preferido: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text((catastro[0].gift! !='O') ? getGift(catastro[0].gift!) : catastro[0].otroGift!,
                style: const TextStyle(fontSize: 13.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Altura(m): ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].altura!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Peso(Kg): ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].peso!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Medidas: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].medidas!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Idiomas: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              getIdiomas(catastro[0].idiomas!),
              style: const TextStyle(fontSize: 13.0),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Facebook: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].facebook!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Instagram: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].instagram!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Youtube: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].youtube!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Twitter: ',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              catastro[0].twitter!,
              style: const TextStyle(fontSize: 13.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Color: ',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold)),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 10.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: getColorCatastro(catastro[0].color!),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  void exitDialog(context) {
    Navigator.pop(context);
  }

  message(context, String texto) {
    if (!Platform.isIOS) {
      //Codigo para Android
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Column(
                children: const [
                  Text(
                    'seXquare',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Divider()
                ],
              ),
              content: Text(texto),
              actions: [
                MaterialButton(
                  onPressed: () => exitDialog(context),
                  elevation: 5.0,
                  textColor: AppTheme.primaryColorApp,
                  child: const Text('Salir'),
                )
              ],
            );
          });
    }

    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Column(
          children: const [
            Text(
              'seXquare',
              style: TextStyle(color: Colors.blue),
            ),
            Divider()
          ],
        ),
        content: Text(texto),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () => exitDialog(context),
              child: const Text('Salir')),
        ],
      ),
    );
  }

  void exitDialogNoDisponible(context) {
    Navigator.pop(context);
  }

  Future<List<Catastro>> obtenerCatastroCandidato(String catastroId) async {
    const storage = FlutterSecureStorage();

    try {
      final String? token = await storage.read(key: 'token');

      final uri = Uri.parse(
          '${Environment.apiUrl}/catastros/flutter?catastroId=$catastroId');

      final resp = await http.get(uri,
          headers: {'Content-Type': 'application/json', 'token': token!});

      final catastroResponse = catastrosResponseFromJson(resp.body);

      return catastroResponse.catastros;
    } catch (e) {
      return [];
    }
  }

  String getDynamicGenero(String valor) {
    String genero = 'MUJER';
    switch (valor) {
      case 'M':
        genero = 'MUJER';
        break;
      case 'H':
        genero = 'HOMBRE';
        break;
      case 'G':
        genero = 'GAY';
        break;
      case 'L':
        genero = 'LESBIANA';
        break;
      case 'B':
        genero = 'BISEXUAL';
        break;
      case 'T':
        genero = 'TRANSEXUAL';
        break;
      default:
        genero = 'OTRO';
    }
    return genero;
  }
}

obtenerMensajesCandidato(String candidatoId) async {
  const storage = FlutterSecureStorage();

  try {
    final String? token = await storage.read(key: 'token');

    final uri =
        Uri.parse('${Environment.apiUrl}/mensajes?candidatoId=$candidatoId');

    final resp = await http.get(uri,
        headers: {'Content-Type': 'application/json', 'token': token!});

    final mensajeResponse = mensajesResponseFromJson(resp.body);

    return mensajeResponse.mensajes;
  } catch (e) {
    return [];
  }
}

class ImageFullScreen extends StatelessWidget {
  final String imageURL;
  final String candidatoId;
  final String nombre;

  const ImageFullScreen(this.imageURL, this.candidatoId, this.nombre,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Hero(
        tag: candidatoId,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CANDIDAT@ A ${Preferences.nombreProceso}',
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0F3B78)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/pngs/no-image.png'),
                    image: NetworkImage(imageURL),
                    fit: BoxFit.contain,
                    width: size.width,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MensajeFullScreen extends StatelessWidget {
  final String nombre;
  final String candidatoId;
  final List<Mensaje> mensajes;

  const MensajeFullScreen(
      {super.key,
      required this.nombre,
      required this.candidatoId,
      required this.mensajes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Mensajes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 20.0,
              ),
              for (int x = 0; x < mensajes.length; x++) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${x + 1}.- ${mensajes[x].descripcion}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      mensajes[x].descripcion,
                      style: const TextStyle(fontSize: 12.0),
                      textAlign: TextAlign.justify,
                    ),
                    const Divider(
                      height: 20.0,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
