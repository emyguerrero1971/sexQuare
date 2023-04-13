import 'package:provider/provider.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
// import 'package:http/http.dart' as http;

// import 'package:sexquare/global/environment.dart';
import 'package:sexquare/blocs/blocs.dart';
import 'package:sexquare/models/models.dart';
import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/screens/screens.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/share_preferences/preferences.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = 'welcome';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late LocationBloc locationBloc;
  final _checker = AppVersionChecker();
  String version = '';
  String candidatoId = '';

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.getCurrentPosition();
    // locationBloc.startFollowingUser();
    checkVersion();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lugarPorCoordenadasService =
        Provider.of<LugarPorCoordenadasService>(context);

    final votoService = Provider.of<VotosService>(context, listen: false);
    cargarCandidatoVotado() async {
      candidatoId = await votoService.getCandidatoVotado();
    }

    final authService = Provider.of<AuthService>(context);
    final procesosService = Provider.of<ProcesosService>(context);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double bottom = MediaQuery.of(context).viewInsets.bottom;

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

    int indProceso = 0;
    int foundIndex = 0;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnowLocation == null) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 10.0),
                  Text('seXquare, buscando locales registrados...')
                ]));
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150.0),
                const SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 18.0,
                          color: AppTheme.primaryColorApp,
                          letterSpacing: -0.28,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Bienvenid@ a ',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 14,
                          color: Color(0xff1279f2),
                          letterSpacing: -0.28,
                          height: 1.5,
                        ),
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    width: 250.0,
                    height: 250.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/pngs/sexquare.png')))),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 14,
                          color: Color(0xff191919),
                          letterSpacing: -0.28,
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Lee nuestra ',
                            style: TextStyle(
                              color: Color(0xff0F3B78),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Política de Privacidad',
                            style: const TextStyle(
                              color: AppTheme.primaryColorApp,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PrivacyPolicyScreen()),
                                  ),
                          ),
                          const TextSpan(
                            text:
                                '.Toca "Aceptar y continuar" para indicar que estás de acuerdo con las ',
                            style: TextStyle(
                              color: Color(0xff0F3B78),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Condiciones del Servicio',
                            style: const TextStyle(
                              color: AppTheme.primaryColorApp,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ServiceConditionScreen()),
                                  ),
                          ),
                          const TextSpan(
                            text: '.',
                          ),
                        ],
                      ),
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    height: 55.0,
                    width: screenWidth,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth / 12,
                        right: screenWidth / 12,
                        top: bottom > 0 ? screenHeight / 12 : 0,
                      ),
                      child: ButtonLogin(
                          buttonStyle: buttonStyle,
                          text: 'Aceptar y continuar',
                          onPressed: lugarPorCoordenadasService.procesando
                              ? null
                              : () async {
                                  try {
                                    initPreferences();
                                    await buscarPais(
                                        lugarPorCoordenadasService, state);

                                    if (Preferences.countryDial != "0") {
                                      setPreferences();

                                      await buscarProvincia(
                                          lugarPorCoordenadasService);

                                      if (mounted) {
                                        MessageUtils().showSnackBar(
                                            context,
                                            "Prov/Dep/State: ${Preferences.provincia}",
                                            1);
                                      }

                                      await buscarCiudad(
                                          lugarPorCoordenadasService);

                                      if (mounted) {
                                        MessageUtils().showSnackBar(
                                            context,
                                            "Ciudad/Munic/Conty: ${Preferences.ciudad}",
                                            1);
                                      }
                                    } else {
                                      Preferences.stateVote = 0;
                                      lugarPorCoordenadasService.procesando =
                                          true;
                                    }

                                    await restaurarUsuario(authService).then(
                                        (value) => cargarProcesos(
                                            procesosService,
                                            indProceso,
                                            foundIndex,
                                            cargarCandidatoVotado));

                                    if (mounted) {
                                      Navigator.pushReplacementNamed(
                                          context, 'loadingAPP');
                                    }
                                  } catch (e) {
                                    // print(e);
                                    MessageUtils().showSnackBarText(
                                        context, "Error de inicialización: $e");
                                  }
                                }),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> restaurarUsuario(AuthService authService) async {
    await authService.registrarDispositivo();

    if (mounted) {
      MessageUtils().showSnackBar(context, "¡Bienvenido a seXquare!", 2);
    }
  }

  void checkVersion() async {
    _checker.checkUpdate().then((value) {
      version = value.currentVersion;
    });
  }

  void setPreferences() {
    Preferences.local = 'VIRTUAL SEXQUARE';
    Preferences.localId = '641d30e837bd0bc8897f294b';
    Preferences.ciudad = 'Sexquare';
    Preferences.ciudadId = '63f92fa6b44affec0cbfdd13';
    Preferences.provincia = 'Sexquare';
    Preferences.provinciaId = '63f92f8ab44affec0cbfdd10';
  }

  void initPreferences() {
    var dt = DateTime.now();
    String mes =
        (dt.month.toString().length < 2) ? '0${dt.month}' : '${dt.month}';
    String dia = (dt.day.toString().length < 2) ? '0${dt.day}' : '${dt.day}';
    Preferences.fechaRegistro = '${dt.year}-$mes-$dia';
    Preferences.fechaCaducidad = Preferences.fechaRegistro;
    Preferences.administradorId = '640fc76accff2f1d7f83acfc';
    Preferences.status = '0';
    Preferences.stateVote = 1;
    Preferences.version = version;
    Preferences.rol = 'NOR_ROL';
    Preferences.isExterior = false;
    Preferences.countryDial = '+999';
    Preferences.numeroContacto = '+593 99 088 2956';
    Preferences.emailContacto = 'powerxquare@gmail.com';
    Preferences.id = '';
    Preferences.numCel = '9999999999';
    Preferences.ctaPagos = '';
    Preferences.pais = 'SEXQUARE';
    Preferences.paisId = '63f92054b44affec0cbfdd00';
  }

  Future<void> cargarProcesos(ProcesosService procesosService, int indProceso,
      int foundIndex, Future<void> Function() cargarCandidatoVotado) async {
    List<Proceso> procesos = await procesosService.getProcesos();

    Preferences.ambito = '3';
    Preferences.procesoId = '63fa17c7781f319dd4296ad8';
    Preferences.nombreProceso = 'VIRTUAL SEXQUARE LOCAL';

    if (procesos.isNotEmpty) {
      foundIndex = procesos
          .indexWhere((proceso) => proceso.local == Preferences.localId);
      if (foundIndex != -1) {
        indProceso = foundIndex;
      }

      if (indProceso == 0 && Preferences.isExterior == true) {
        foundIndex = procesos
            .indexWhere((proceso) => proceso.id == "63fa17c7781f319dd4296ad8");
        if (foundIndex != -1) {
          indProceso = foundIndex;
        }
      }

      Preferences.ambito = procesos[indProceso].ambito;
      Preferences.procesoId = procesos[indProceso].id;
      Preferences.nombreProceso = procesos[indProceso].descripcion;

      //print(procesos.length);

      if (mounted) {
        MessageUtils().showSnackBarText(context, Preferences.nombreProceso);
      }

      await cargarCandidatoVotado();
      if (candidatoId != 'no-data') {
        Preferences.candidatoId = candidatoId;
        Preferences.stateVote = 2;
      }
    }
  }

  Future<void> buscarPais(
      LugarPorCoordenadasService lugarPorCoordenadasService, state) async {
    if (state.lastKnowLocation != null) {
      final latitude = state.lastKnowLocation.latitude;
      final longitude = state.lastKnowLocation.longitude;

      //Borrar - Simulacion de ubicacion Concepcion, Concepcion Paraguay
      // final latitude = -23.403557;
      // final longitude = -57.441223;

      //Borrar - Simulacion de ubicacion Buenos Aires, Paraguay, lo toma como exterior porque no consta en la base de datos de paises
      // final latitude = -34.605847;
      // final longitude = -58.376292;

      Preferences.lat = latitude;
      Preferences.lng = longitude;

      LugarPorCoordenadasResponse? lugarPorCoordenadasResponse =
          await lugarPorCoordenadasService.obtenerCoordenadasPais(
              longitude, latitude);
      if (lugarPorCoordenadasResponse!.codtel == '0') {
        Preferences.isExterior = true;
        Preferences.lat = -41.209706;
        Preferences.lng = -133.824763;
        setPreferences();
      } else {
        Preferences.paisId = lugarPorCoordenadasResponse.id;
        Preferences.pais = lugarPorCoordenadasResponse.nombre;
        Preferences.countryDial = lugarPorCoordenadasResponse.codtel.toString();
      }
    }
  }

  Future<void> buscarProvincia(
      LugarPorCoordenadasService lugarPorCoordenadasService) async {
    LugarPorCoordenadasResponse? lugarPorCoordenadasResponse =
        await lugarPorCoordenadasService.obtenerCoordenadasProvincia(
            Preferences.paisId, Preferences.lng, Preferences.lat);

    if (lugarPorCoordenadasResponse != null) {
      Preferences.provinciaId = lugarPorCoordenadasResponse.id;
      Preferences.provincia = lugarPorCoordenadasResponse.nombre;
    }
  }

  Future<void> buscarCiudad(
      LugarPorCoordenadasService lugarPorCoordenadasService) async {
    LugarPorCoordenadasResponse? lugarPorCoordenadasResponse =
        await lugarPorCoordenadasService.obtenerCoordenadasCiudad(
            Preferences.provinciaId, Preferences.lng, Preferences.lat);

    if (lugarPorCoordenadasResponse != null) {
      Preferences.ciudadId = lugarPorCoordenadasResponse.id;
      Preferences.ciudad = lugarPorCoordenadasResponse.nombre;
    }
  }
}
