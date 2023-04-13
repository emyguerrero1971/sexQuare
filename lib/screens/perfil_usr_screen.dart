import 'package:flutter/material.dart';
import 'package:sexquare/share_preferences/preferences.dart';

class PerfilUsrScreen extends StatefulWidget {
  static const String routeName = 'perfilUsr';

  const PerfilUsrScreen({super.key});

  @override
  State<PerfilUsrScreen> createState() => _PerfilUsrScreenState();
}

class _PerfilUsrScreenState extends State<PerfilUsrScreen> {
  final duration = const Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil - ${Preferences.nombre}'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                    onTap: () {
                      print('mostrar camara');
                    },
                    child: Stack(
                        //& Stack contenente l'immagine del profilo.
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 96,
                                backgroundColor: Colors.red[400],
                                backgroundImage: NetworkImage(Preferences.img)),
                          ),
                          Positioned(
                            //& All'interno del precedente Stack, posizionamento dei pulsanti immagine dalla galleria/fotocamera.
                            bottom: -10,
                            left: -15,
                            child: IconButton(
                              onPressed: () {
                                // selectImage(ImageSource.gallery);
                              },
                              icon: const Icon(Icons.photo_library_rounded),
                              color: Colors.black45,
                              iconSize: 32,
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            left: 165,
                            child: IconButton(
                              onPressed: () {
                                // selectImage(ImageSource.camera);
                              },
                              icon: const Icon(Icons.add_a_photo),
                              color: Colors.black45,
                              iconSize: 32,
                            ),
                          ),
                        ])),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text('Cambiar Imagen'),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Acerca de ti',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('nickName')),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Preferences.nombre),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'editUserName');
                },
              )
            ],
          ),
        )));
  }
}
