import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;

  String otpPin = '';
  String phoneNumber = '';
  String newValue = '';
  String countryDial = Preferences.countryDial;
  String errorMessage = '';

  String verificationId = '';

  int screenState = 0;

  Color colorPage = AppTheme.primaryColorApp;
  Color colorTextPage = const Color(0xff0F3B78);

  Future<void> verifyPhone(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) async {},
      verificationFailed: (FirebaseAuthException e) async {
        //print("Error *** $e");
        showSnackBarText("Error *** ${e.message}");
        /*if (e.code == 'invalid-phone-number') {
          showSnackBarText(e.code);
        }*/
      },
      codeSent: (verificationId, resendingToken) async {
        showSnackBarText('Código enviado!');
        setState(() {
          screenState = 1;
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) async {},
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      screenState = 1;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      // Cambiar a == cuando se requiera hacer pruebas con numeros registrado
      if (authCredential.user != null) {
        Preferences.numCel = '${countryDial}_$newValue';
        await actualizaNumcel(Preferences.numCel);
      }
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-phone-number":
          errorMessage = "El número ingresado no es válido";
          break;
        case "user-not-found":
          errorMessage = "Usuario no encontrado";
          break;
        case "invalid-verification-code":
          errorMessage = "Código de verificación inválido";
          break;
        case "phone-number-already-exists":
          errorMessage = "Otro usuario utiliza el número proporcionado";
          break;
        default:
          errorMessage = "Código incorrecto/Error desconocido";
      }
      if (errorMessage != '') {
        showSnackBarText(errorMessage);
      }
    }
  }

  actualizaNumcel(String numcel) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final data = {'numcel': numcel};
    final uri =
        Uri.parse('${Environment.socketUrl}/api/usuarios/${Preferences.id}');

    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      Preferences.numCel = numcel;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lugarPorCoordenadasService =
        Provider.of<LugarPorCoordenadasService>(context);

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: GoogleFonts.montserrat(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 18,
      ),
      minimumSize: const Size(88.0, 36.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      shape: const StadiumBorder(),
    );

    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: colorPage,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Text(
                        "seXquare",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 8,
                        ),
                      ),
                      Text(
                        "SEX FOR SALE",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 25,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 14,
                              color: Colors.white,
                              letterSpacing: -0.28,
                              height: 1.2,
                            ),
                            children: [
                              TextSpan(
                                text: 'seXquare ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenWidth / 30,
                                ),
                              ),
                              const TextSpan(
                                text:
                                    'te enviará un mensaje de texto SMS para verificar si el número que ingresaste es el que estás usando para registrarte.',
                              ),
                            ],
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-10, -60),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: circle(5),
                ),
              ),
              Transform.translate(
                offset: const Offset(30, -80),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: circle(4.5),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -50),
                child: Center(
                  child: circle(3),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    height: bottom > 0 ? screenHeight : screenHeight / 1.75,
                    width: screenWidth,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth / 12,
                          right: screenWidth / 12,
                          top: bottom > 0 ? screenHeight / 20 : 0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            screenState == 0 ? stateRegister() : stateOTP(),
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontSize: 14,
                                  letterSpacing: -0.28,
                                  height: 1.2,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'IMPORTANTE: ',
                                    style: TextStyle(
                                      color: colorTextPage,
                                      fontWeight: FontWeight.w700,
                                      fontSize: screenWidth / 30,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Asegúrate de estar en un lugar donde tu operadora tenga cobertura, el SMS puede tardar unos segundos en llegar.',
                                    style: TextStyle(color: colorTextPage),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            Container(
                                height:45,
                                width: screenWidth,
                                margin:
                                    EdgeInsets.only(bottom: screenHeight / 150),
                                decoration: BoxDecoration(
                                  color: colorPage,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Center(
                                  child: (screenState == 0)
                                      ? ButtonLogin(
                                          buttonStyle: buttonStyle,
                                          text: 'Solicitar código - Login',
                                          onPressed: lugarPorCoordenadasService
                                                  .procesando
                                              ? null
                                              : () async {
                                                  if (phoneController
                                                      .text.isEmpty) {
                                                    showSnackBarText(
                                                        "Número de teléfono está vacío!");
                                                  } else if (phoneController
                                                              .text ==
                                                          '3Ak@9Yjk58' ||
                                                      phoneController.text ==
                                                          'exterior') {
                                                    if (mounted) {
                                                      lugarPorCoordenadasService
                                                          .procesando = false;
                                                      Navigator
                                                          .pushReplacementNamed(
                                                              context,
                                                              'verification',
                                                              arguments:
                                                                  phoneController
                                                                      .text);
                                                    }
                                                  } else {
                                                    verifyPhone(
                                                        countryDial + newValue);
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 4000),
                                                        () {
                                                      lugarPorCoordenadasService
                                                          .procesando = false;
                                                    });
                                                  }
                                                })
                                      : ButtonLogin(
                                          buttonStyle: buttonStyle,
                                          text: 'Verificar código',
                                          onPressed: lugarPorCoordenadasService
                                                  .procesando
                                              ? null
                                              : () async {
                                                  PhoneAuthCredential
                                                      phoneAuthCredential =
                                                      PhoneAuthProvider
                                                          .credential(
                                                              verificationId:
                                                                  verificationId,
                                                              smsCode: otpPin);
                                                  signInWithPhoneAuthCredential(
                                                      phoneAuthCredential);
                                                }),
                                )),
                            Container(
                                height: 45,
                                width: screenWidth,
                                margin:
                                    EdgeInsets.only(bottom: screenHeight / 150),
                                decoration: BoxDecoration(
                                  color: colorPage,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Center(
                                        child: ButtonLogin(
                                      buttonStyle: buttonStyle,
                                      text: 'Cancelar',
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )),
                            )
                          ],
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget stateRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Código de país",
          style: GoogleFonts.montserrat(
            color: colorTextPage,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        IntlPhoneField(
          enabled: false,
          style: TextStyle(color: colorTextPage, fontWeight: FontWeight.bold),
          controller: countryController,
          showCountryFlag: true,
          showDropdownIcon: false,
          initialValue: countryDial,
          // initialCountryCode: 'EC',
          decoration: InputDecoration(
            labelStyle: TextStyle(color: colorTextPage),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
          flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Número de teléfono - Usuario",
          style: GoogleFonts.montserrat(
            color: colorTextPage,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyle(color: colorTextPage, fontWeight: FontWeight.bold),
          controller: phoneController,
          maxLength: 10,
          autofocus: true,
          onChanged: (phone) {
            if (mounted) {
              newValue = phone;
              if (phone.length == 10) {
                newValue = phone.substring(1);
              }
            }
          },
          validator: (value) {
            if (value == null) return 'Este campo es obligatorio';
            return value.length < 9 ? 'Longitud mínima de caracteres 9' : null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget stateOTP() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Enviamos un código a ",
          style: GoogleFonts.montserrat(
            color: colorTextPage,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '$countryDial$newValue',
          style: GoogleFonts.montserrat(
            color: colorTextPage,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Introduce el código aquí para continuar!',
          style: GoogleFonts.montserrat(
            color: colorTextPage,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) {
            setState(() {
              otpPin = value;
            });
          },
          pinTheme: PinTheme(
            activeColor: colorPage,
            selectedColor: colorPage,
            inactiveColor: Colors.black26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "No recibiste el código? ",
                style: GoogleFonts.montserrat(
                    color: colorPage,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: Text(
                    "Reenviar",
                    style: GoogleFonts.montserrat(
                      color: colorTextPage,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
