import 'package:sexquare/models/models.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = 'map';

  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Voto> votos = [];
  late List<Marker> markers = [];
  List<LatLng> points = [
    //LatLng(49.-3.99313, 3.3522),
  ];

  // bool statusVote = false;
  bool showMap = false;

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('votar-candidato-sexquare', (payload) {
      setState(() {
        // statusVote = payload;
      });
    });

    super.initState();
    showMap = false;
  }

  Widget map = Container();

  @override
  Widget build(BuildContext context) {
    final Candidato candidato =
        ModalRoute.of(context)?.settings.arguments as Candidato;
    final votosService = Provider.of<VotosService>(context);
    //print(candidato.nombre);

    cargarVotos() async {
      votos = await votosService.getVotosCandidato(candidato.id);
      map = createMap(votos);
      setState(() {});
    }

    if (!showMap) {
      showMap = true;
      cargarVotos();
    }
    final socketService = Provider.of<SocketService>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('seXquare'),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => Navigator.pushReplacementNamed(context, 'home',
                  arguments: Preferences.procesoId),
            ),
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: (socketService.serverStatus == ServerStatus.offLine)
                    ? const Icon(Icons.cloud_off)
                    : const Icon(Icons.cloud_done_outlined)),
          ],
          backgroundColor: AppTheme.primaryColorApp,
          //expandedHeight: 50.0,
          //floating: true,
          // pinned: true,
        ),
        drawer: const SideMenu(),
        body: Column(
          children: [
            Container(
              height: 50.0,
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "${Preferences.nombreProceso}  ${candidato.nombre}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
                maxLines: 2,
              ),
            ),
            Expanded(
              child: Container(child: map
                  // map,

                  ),
            ),
          ],
        ),
      ),
    );
  }

  FlutterMap createMap(List<Voto> votos) {
    for (var voto in votos) {
      //print(voto.candidato);
      if (voto.lng != 0.0) {
        points.add(LatLng(voto.lat, voto.lng));
        markers.add(Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(voto.lat, voto.lng),
          builder: (ctx) =>
              const Icon(Icons.pin_drop, color: Colors.black, size: 36),
        ));
      }
    }
    return FlutterMap(
      options: MapOptions(
        center: points.isNotEmpty ? points[0] : LatLng(-1.831239, -78.183406),
        zoom: 15,
        maxZoom: 18,
        //onTap: (_, __)
        //=>
        // //_popupController
        //.hideAllPopups(), // Hide popup when the map is tapped.
      ),
      children: <Widget>[
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            spiderfyCircleRadius: 80,
            spiderfySpiralDistanceMultiplier: 2,
            circleSpiralSwitchover: 12,
            maxClusterRadius: 120,
            rotate: true,
            size: const Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: const FitBoundsOptions(
              padding: EdgeInsets.all(50),
              maxZoom: 15,
            ),
            markers: markers,
            polygonOptions: const PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupState: PopupState(),
                popupSnap: PopupSnap.markerTop,
                //popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                      width: 200,
                      height: 100,
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () => debugPrint('Popup tap!'),
                        child: Text(
                          'Container popup for marker at ${marker.point}',
                        ),
                      ),
                    )),
            builder: (context, markers) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    markers.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
