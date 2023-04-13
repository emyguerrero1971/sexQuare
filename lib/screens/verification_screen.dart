import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:sexquare/global/environment.dart';

// import 'package:sexquare/models/models.dart';
import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = 'verification';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final String user =
        ModalRoute.of(context)?.settings.arguments.toString() ?? '3Ak@9Yjk58';
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final authService = Provider.of<AuthService>(context);

    final Map<String, String> formValues = {'user': '', 'password': ''};

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

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/pngs/candado.png')))),
                  const SizedBox(height: 20.0),
                  CustomInputField(
                      initialValue: user,
                      labelText: 'Usuario',
                      hintText: 'user',
                      formProperty: 'user',
                      enabled: true,
                      formValues: formValues),
                  const SizedBox(height: 15.0),
                  CustomInputField(
                      initialValue: '',
                      labelText: 'Password',
                      hintText: 'password',
                      formProperty: 'password',
                      enabled: true,
                      autofocus: true,
                      obscureText: true,
                      formValues: formValues),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ButtonLogin(
                      buttonStyle: buttonStyle,
                      text: 'Verificar',
                      onPressed: authService.autenticando
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();
                              Preferences.numCel =
                                  '${Preferences.countryDial}_$user';
                              bool status = await actualizaNumCel(Preferences.numCel);
                              if (status) authService.autenticando = false;
                              if (mounted) {
                                Navigator.pushReplacementNamed(context, 'home',
                                    arguments: Preferences.procesoId);
                              }
                            },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool> actualizaNumCel(String numcel) async {
    final data = {
      'numcel': numcel,
    };

    final uri = Uri.parse('${Environment.apiUrl}/usuarios/actualizarUsuario/${Preferences.id}');

    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
