import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/search/search_delegate.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Candidato> candidatos = [];

  // bool statusVote = false;
  @override
  void dispose() {
    Provider.of<SocketService>(context, listen: false).socket.ondisconnect();
    super.dispose();
  }

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('emitir-mensaje', (payload) {
      listener(payload);
    });
    socketService.socket.on('votar-candidato-sexquare', (payload) {
      listener(payload);
    });

    super.initState();
  }

  void listener(payload) {
    Map values = {};
    if (payload != null && payload is Map) {
      values = payload;
    }

    setState(() {
      if (values.containsKey("proceso") &&
          values["proceso"] == Preferences.procesoId) {
        Preferences.refresh = true;
      }
    });
  }

  // @override
  // void dispose() {
  // final socketService = Provider.of<SocketService>(context, listen: false);
  // socketService.socket.off('votar-candidato-sexquare');
  //   super.dispose();
  // }
  late AuthService? authService;

  @override
  Widget build(BuildContext context) {
    //print("Execute build****");
    authService = Provider.of<AuthService>(context);
    final String procesoId =
        ModalRoute.of(context)?.settings.arguments.toString() ??
            '63fa17c7781f319dd4296ad8';
    final candidatoService = Provider.of<CandidatosService>(context);

    cargarCandidatos() async {
      await obtenerDatosUsuario().then((value) async =>
          candidatos = await candidatoService.getCandidatos(procesoId));
    }

    cargarCandidatos();

    final socketService = Provider.of<SocketService>(context);

    return SafeArea(
      //key: UniqueKey(),
      child: Scaffold(
        drawer: const SideMenu(),
        body: CustomScrollView(
          //key: UniqueKey(),
          slivers: [
            SliverAppBar(
              title: const Text('seXquare'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: () => showSearch(
                      context: context, delegate: ProcesoSearchDelegate()),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: (socketService.serverStatus == ServerStatus.offLine)
                        ? const Icon(Icons.cloud_off)
                        : const Icon(Icons.cloud_done_outlined)),
              ],
              backgroundColor: AppTheme.primaryColorApp,
              expandedHeight: 50.0,
              floating: true,
              // pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              sliver: makeHeader(Preferences.nombreProceso),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              sliver: SliverFixedExtentList(
                  itemExtent: 256,
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      return CandidatoCard(
                          ranking: index,
                          candidato: candidatos[index],
                          candidatosService:
                              Provider.of<CandidatosService>(context));
                    },
                    childCount: candidatos.length,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  guardarVoto(String candidatoId) async {
    final candidatoService = Provider.of<CandidatosService>(context);
    //print(candidatoService);
    candidatoService.guardarVoto(candidatoId);
    // exitDialog(context);
    //submit = !submit;
    //Preferences.refresh = true;
    //if (mounted) {

    //}

//MessageUtils().showSnackBarText(super.context, "Se registró su voto");
  }

  SliverPersistentHeader makeHeader(String headerTitle) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: HeaderDelegate(headerTitle),
    );
  }

  Future<void> obtenerDatosUsuario() async {
    if (Preferences.dispositivoId.isEmpty) {
      await authService!.registrarDispositivo();
    }
  }

  List<DataColor> getChartData() {
    final List<DataColor> dataList = [];
    Color color;
    final datos = List.from(candidatos.reversed);
    for (var dato in datos) {
      String auxColor = dato.color.replaceAll('#', '0xff');
      color = Color(int.parse(auxColor));
      dataList.add(DataColor(dato.nombre, dato.votos, color));
    }

    return dataList;
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String headerTitle;

  HeaderDelegate(this.headerTitle);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50.0,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        headerTitle,
        textAlign: TextAlign.center,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        maxLines: 2,
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 45.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Data {
  final String name;
  final int votos;

  Data(this.name, this.votos);
}

class DataColor {
  final String name;
  final int votos;
  final Color color;

  DataColor(this.name, this.votos, this.color);
}

// class _NavegacionModel with ChangeNotifier {
//   int _paginaActual = 0;

//   int get paginaActual => _paginaActual;

//   set paginaActual(int valor) {
//     _paginaActual = valor;
//     notifyListeners();
//   }
// }
