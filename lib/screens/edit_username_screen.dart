import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sexquare/global/environment.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class EditUserNameScreen extends StatefulWidget {
  final String nombre;
  const EditUserNameScreen({super.key, required this.nombre});

  @override
  State<EditUserNameScreen> createState() => _EditUserNameScreenState();
}

class _EditUserNameScreenState extends State<EditUserNameScreen> {
  TextEditingController textFormFieldController = TextEditingController();

  Color colorSave = Colors.black54;
  bool ctlSave = false;
  @override
  void initState() {
    super.initState();
    textFormFieldController.text = widget.nombre;
  }

  @override
  Widget build(BuildContext context) {
    String? helperText =
        'El nickName debe ser único, antes de grabar se verificará contra la Base de datos';
    TextStyle helperStyle = const TextStyle(color: Colors.grey);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 20.0),
            child: Text('Cancelar', style: TextStyle(color: Colors.black54)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text('nickName',
          style: TextStyle(color: Colors.black, fontSize: 18),
        )),
        actions: [
          GestureDetector(
            child: SizedBox(
              width: 70,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 20.0),
                child: Text('Guardar', style: TextStyle(color: colorSave)),
              ),
            ),
            onTap: () async {
              ctlSave = await _guadarName();
              if (!ctlSave) {
                helperText =
                    'Ya existe un nickName con esa descripción en la Base de datos!! Intente con otro por favor!';
                helperStyle = const TextStyle(color: Colors.red);
              } else {
                if (mounted) {
                  Navigator.pop(context);
                }
              }
              setState(() {});
            },
          ),
        ],
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextFormField(
          controller: textFormFieldController,
          maxLength: 15,
          autofocus: true,
          onChanged: (value) {
            colorSave = Colors.red;
            setState(() {});
          },
          validator: (value) {
            if (value == null) return 'Este campo es obligatorio';
            return value.length < 8 ? 'Longitud mínima de caracteres 8' : null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: 'nickName',
            hintText: 'nickName',
            helperText: helperText,
            helperStyle: helperStyle,
            helperMaxLines: 2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            suffixIcon: IconButton(
              onPressed: textFormFieldController.clear,
              icon: const Icon(
                Icons.clear_rounded,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _guadarName() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final uri = Uri.parse(
        '${Environment.socketUrl}/api/usuarios/actualizarnombre${Preferences.id}');

    final data = {'nombre': textFormFieldController.text};

    final resp = await http.put(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      Preferences.nombre = textFormFieldController.text;
      return true;
    } else {
      return false;
    }
  }
}
