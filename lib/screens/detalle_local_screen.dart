import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sexquare/models/models.dart';
import 'package:sexquare/themes/app_theme.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/global/environment.dart';
import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/arguments/arguments_screen.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DetalleLocalScreen extends StatelessWidget {
  static const String routeName = 'detalleLocal';

  const DetalleLocalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localService = Provider.of<LocalesService>(context);

    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return ChangeNotifierProvider(
        create: (_) => LocalFormProvider(localService.copyRegistroLocal),
        child: _DetalleLocalScreenBody(
            propiedad: args.nombre, tipo: args.tipo, valor: args.valor));
  }
}

class _DetalleLocalScreenBody extends StatefulWidget {
  const _DetalleLocalScreenBody({
    required this.propiedad,
    required this.tipo,
    required this.valor,
  });

  final String propiedad;
  final String tipo;
  final String valor;

  @override
  State<_DetalleLocalScreenBody> createState() =>
      _DetalleLocalScreenBodyState();
}

class _DetalleLocalScreenBodyState extends State<_DetalleLocalScreenBody> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = widget.valor;
  }

  @override
  Widget build(BuildContext context) {
    final localService = Provider.of<LocalesService>(context);
    final localForm = Provider.of<LocalFormProvider>(context);
    final local = localForm.local;

    bool existe = false;

    String? helperText =
        'El campo debe contener información válida, no puede estar vacio';
    TextStyle helperStyle = const TextStyle(color: Colors.grey);

    String getNombre(nombre) {
      String auxName = nombre;
      switch (auxName) {
        case 'textDescripcion':
          auxName = 'Nombre del local';
          break;
        case 'textDireccion':
          auxName = 'Dirección';
          break;
        case 'textEmail':
          auxName = 'Email de contacto';
          break;
        case 'textEmail2':
          auxName = 'Email alterno';
          break;
        case 'textCelular':
          auxName = 'Celular de contacto';
          break;
        case 'textCelular2':
          auxName = 'Celular secundario';
          break;
        case 'textCelular3':
          auxName = 'Celular alterno';
          break;
        case 'dblLatitud':
          auxName = 'Ubicación - Latitud';
          break;
        case 'dblLongitud':
          auxName = 'Ubicación - Longitud';
          break;
        case 'entHabitaciones':
          auxName = 'Total Habitaciones';
          break;
      }
      return auxName;
    }

    TextInputType? getTeclado(nombre) {
      TextInputType auxType = TextInputType.text;
      switch (nombre) {
        case 'textEmail':
          auxType = TextInputType.emailAddress;
          break;
        case 'textEmail2':
          auxType = TextInputType.emailAddress;
          break;
        case 'textCelular':
          auxType = TextInputType.phone;
          break;
        case 'textCelular2':
          auxType = TextInputType.phone;
          break;
        case 'textCelular3':
          auxType = TextInputType.phone;
          break;
        case 'dblLatitud':
          auxType = const TextInputType.numberWithOptions(
              signed: true, decimal: true);
          break;
        case 'dblLongitud':
          auxType = const TextInputType.numberWithOptions(
              signed: true, decimal: true);
          break;
        case 'entHabitaciones':
          auxType = TextInputType.number;
      }
      return auxType;
    }

    String getPropiedadImage(propiedad) {
      switch (propiedad) {
        // case 'propiedadname':
        //   return 'propiedadname';
        default:
          return 'imgLocal';
      }
    }

    message(String texto) {
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
                    onPressed: () => Navigator.pop(context),
                    elevation: 5.0,
                    textColor: AppTheme.primaryColorApp,
                    child: const Text('Aceptar'),
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
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar')),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 16),
          'Locales - Edición',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: localForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              if (widget.tipo == 'img')
                Stack(
                  children: [
                    LocalImageWidget(propiedad: widget.propiedad),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: IconButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery, imageQuality: 100);

                          if (image == null) {
                            return;
                          }
                          if (!localForm.activity) {
                            localForm.activity = true;
                          }
                          localService.updateSelectedImage(
                              image.path, getPropiedadImage(widget.propiedad));
                          localForm.updateImagePropiedad(
                              image.path, getPropiedadImage(widget.propiedad));
                        },
                        icon: const Icon(Icons.photo_library_outlined),
                        color: Colors.white,
                        iconSize: 32,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? photo = await picker.pickImage(
                              source: ImageSource.camera, imageQuality: 100);

                          if (photo == null) {
                            return;
                          }
                          if (!localForm.activity) {
                            localForm.activity = true;
                          }
                          localService.updateSelectedImage(
                              photo.path, getPropiedadImage(widget.propiedad));
                          localForm.updateImagePropiedad(
                              photo.path, getPropiedadImage(widget.propiedad));
                        },
                        icon: const Icon(Icons.camera_alt_outlined),
                        color: Colors.white,
                        iconSize: 32,
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 20.0,
              ),
              if (widget.tipo == 'text' &&
                  widget.propiedad == 'textDescripcion')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: controller,
                    maxLength: 50,
                    autofocus: true,
                    onChanged: (value) {
                      local.textDescripcion = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 8) {
                        return 'Longitud mínima de caracteres 8';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'text' && widget.propiedad == 'textDireccion')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: controller,
                    maxLength: 50,
                    autofocus: true,
                    onChanged: (value) {
                      local.textDireccion = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 8) {
                        return 'Longitud mínima de caracteres 8';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'ent' && widget.propiedad == 'entHabitaciones')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
                    ],
                    controller: controller,
                    maxLength: 50,
                    autofocus: true,
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        local.entHabitaciones = 5;
                      } else {
                        local.entHabitaciones = int.parse(value);
                      }
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (widget.propiedad == 'entHabitaciones') {
                        return value.length < 8
                            ? 'Longitud mínima de caracteres 8'
                            : null;
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'text' && widget.propiedad == 'textEmail')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    controller: controller,
                    maxLength: 30,
                    autofocus: true,
                    onChanged: (value) {
                      local.textEmail = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 15) {
                        return 'Longitud mínima de caracteres 15';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'text' && widget.propiedad == 'textEmail2')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    controller: controller,
                    maxLength: 30,
                    autofocus: true,
                    onChanged: (value) {
                      local.textEmail2 = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 15) {
                        return 'Longitud mínima de caracteres 15';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'text' && widget.propiedad == 'textCelular')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    controller: controller,
                    maxLength: 15,
                    autofocus: true,
                    onChanged: (value) {
                      local.textCelular = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 9) {
                        return 'Longitud mínima de caracteres 9';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'text' && widget.propiedad == 'textCelular2')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    controller: controller,
                    maxLength: 15,
                    autofocus: true,
                    onChanged: (value) {
                      local.textCelular2 = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 9) {
                        return 'Longitud mínima de caracteres 9';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'text' && widget.propiedad == 'textCelular3')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    controller: controller,
                    maxLength: 15,
                    autofocus: true,
                    onChanged: (value) {
                      local.textCelular3 = value;
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 9) {
                        return 'Longitud mínima de caracteres 9';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'dbl' && widget.propiedad == 'dblLatitud')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,14}'))
                    // ],
                    controller: controller,
                    maxLength: 20,
                    autofocus: true,
                    onChanged: (value) {
                      if (double.tryParse(value) == null) {
                        local.dblLatitud = 0.00000000000000;
                      } else {
                        local.dblLatitud = double.parse(value);
                      }
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 7) {
                        return 'Longitud mínima de caracteres 7';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.tipo == 'dbl' && widget.propiedad == 'dblLongitud')
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: getTeclado(widget.propiedad),
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp(r'^(\d-)?\.?\d{0,14}'))
                    // ],//  Numeros con 2 deciales
                    controller: controller,
                    maxLength: 20,
                    autofocus: true,
                    onChanged: (value) {
                      if (double.tryParse(value) == null) {
                        local.dblLongitud = 0.00000000000000;
                      } else {
                        local.dblLongitud = double.parse(value);
                      }
                      if (!localForm.activity) {
                        localForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 7) {
                        return 'Longitud mínima de caracteres 7';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: getNombre(widget.propiedad),
                      hintText: 'Digitar valor...',
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
                        onPressed: controller.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: localService.isSaving
            ? null
            : () async {
                if (!localForm.isValidForm()) {
                  return;
                }

                if (widget.propiedad == 'textDescripcion') {
                  existe = await verificarNombre(controller.text);
                  if (existe) {
                    message(
                        'Ya existe un Local con este nombre en la Base de datos!! Ingrese otro para continuar!');
                    existe = false;
                    return;
                  } else {
                    localForm.local.textDescripcion =
                        controller.text.toUpperCase();
                  }
                }

                if (!existe) {
                  if (widget.propiedad == 'imgLocal') {
                    final String? imageUrl =
                        await localService.uploadImage(widget.valor);
                    if (imageUrl != null) {
                      switch (widget.propiedad) {
                        // case 'propiedadname':
                        //   localForm.local.propiedadname = imageUrl;
                        //   break;
                        default:
                          localForm.local.imgLocal = imageUrl;
                      }
                    }
                  }

                  await localService.saveLocal(localForm.local);
                  Preferences.img = localForm.local.imgLocal;
                }
                localForm.activity = false;
              },
        child: localService.isSaving
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : (!localForm.activity)
                ? null
                : const Icon(
                    Icons.save_outlined,
                  ),
      ),
    );
  }

  Future<bool> verificarNombre(newValue) async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    final uri = Uri.parse(
        '${Environment.socketUrl}/api/locales/existenombre?textDescripcion=$newValue');

    final resp = await http.get(uri,
        headers: {'Content-Type': 'application/json', 'token': token!});

    if (resp.statusCode == 200) {
      final existeResponse = booleanResponseFromJson(resp.body);
      return existeResponse.existe;
    } else {
      return false;
    }
  }
}
