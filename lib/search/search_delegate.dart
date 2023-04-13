// import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/models/models.dart';
import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/services/services.dart';
// import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProcesoSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Ciudad';

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      primaryColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white), border: InputBorder.none),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  Widget _logoSeXquare(String mensaje) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
          child: Column(
        children: [
          const SizedBox(height: 30.0),
          const Image(
            height: 200.0,
            image: AssetImage('assets/pngs/sexquare.png'),
          ),
          const SizedBox(height: 10.0),
          Text(mensaje),
        ],
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _logoSeXquare('');
    }

    final procesosSearchProvider =
        Provider.of<ProcesosSearchProvider>(context, listen: false);

    procesosSearchProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: procesosSearchProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<ProcesoSearch>> snapshot) {
        if (!snapshot.hasData) return _logoSeXquare('');

        final procesosSearch = snapshot.data!;
        if (procesosSearch.isNotEmpty) {
          return ListView.builder(
            itemCount: procesosSearch.length,
            itemBuilder: (_, int index) =>
                _ProcesoSearchItem(procesosSearch[index]),
          );
        } else {
          return _logoSeXquare('No se encontraron coincidencias!!');
        }
      },
    );
  }
}

class _ProcesoSearchItem extends StatefulWidget {
  final ProcesoSearch procesoSearch;

  const _ProcesoSearchItem(this.procesoSearch);

  @override
  State<_ProcesoSearchItem> createState() => _ProcesoSearchItemState();
}

class _ProcesoSearchItemState extends State<_ProcesoSearchItem> {
  Text getDynamicJurisdiccion(String ambito) {
    switch (ambito) {
      case '1':
        return const Text('Nacional');
      case '2':
        return const Text('Provincial');
      case '3':
        return const Text('Cantonal');
      default:
        return const Text('Local');
    }
  }

  String candidatoId = '';

  @override
  Widget build(BuildContext context) {
    final votoService = Provider.of<VotosService>(context, listen: false);
    cargarCandidatoVotado() async {
      candidatoId = await votoService.getCandidatoVotado();
    }

    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(widget.procesoSearch.descripcion.substring(0, 2)),
        ),
        title: Text(widget.procesoSearch.descripcion),
        subtitle: getDynamicJurisdiccion(widget.procesoSearch.ambito),
        onTap: () async {
          Preferences.procesoId = widget.procesoSearch.id;
          await cargarCandidatoVotado();
          Preferences.stateVote = 1;
          Preferences.candidatoId = '';
          Preferences.ambito = widget.procesoSearch.ambito;
          Preferences.procesoId = widget.procesoSearch.id;
          Preferences.nombreProceso = widget.procesoSearch.descripcion;
          switch (widget.procesoSearch.ambito) {
            case '1':
              if (Preferences.paisId != widget.procesoSearch.pais.toString()) {
                Preferences.stateVote = 0;
              }
              break;
            case '2':
              if (Preferences.provinciaId !=
                  widget.procesoSearch.provincia.toString()) {
                Preferences.stateVote = 0;
              }
              break;
            case '3':
              if (Preferences.ciudadId !=
                  widget.procesoSearch.ciudad.toString()) {
                Preferences.stateVote = 0;
              }
              break;
          }

          if (candidatoId != 'no-data') {
            Preferences.candidatoId = candidatoId;
            Preferences.stateVote = 2;
          }

          if (mounted) {
            Preferences.refresh = true;
            Navigator.pushReplacementNamed(context, 'home',
                arguments: widget.procesoSearch.id);
          }
        });
  }
}
