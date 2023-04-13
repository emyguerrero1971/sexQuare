import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

class DetalleHabitacionScreen extends StatelessWidget {
  static const String routeName = 'detalleHabitacion';

  const DetalleHabitacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitacionService = Provider.of<HabitacionesService>(context);

    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return ChangeNotifierProvider(
        create: (_) =>
            HabitacionFormProvider(habitacionService.copyRegistroHabitacion),
        child: _DetalleHabitacionScreenBody(
            habitacionService: habitacionService,
            propiedad: args.nombre,
            tipo: args.tipo,
            valor: args.valor));
  }
}

class _DetalleHabitacionScreenBody extends StatelessWidget {
  const _DetalleHabitacionScreenBody({
    required this.habitacionService,
    required this.propiedad,
    required this.tipo,
    required this.valor,
  });

  final HabitacionesService habitacionService;
  final String propiedad;
  final String tipo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    final habitacionForm = Provider.of<HabitacionFormProvider>(context);

    String getPropiedadImage(propiedad) {
      switch (propiedad) {
        case 'boolAguaCaliente':
          return 'imgAguaCaliente';
        case 'boolAguaEmbotellada':
          return 'imgAguaEmbotellada';
        case 'boolAireAcondicionado':
          return 'imgAireAcondicionado';
        case 'boolAlfombra':
          return 'imgAlfombra';
        case 'boolAlmohada':
          return 'imgAlmohada';
        case 'boolBanioPrivado':
          return 'imgBanioPrivado';
        case 'boolCloset':
          return 'imgCloset';
        case 'boolEspejo':
          return 'imgEspejo';
        case 'boolExhibidor':
          return 'imgExhibidor';
        case 'boolIntercomunicador':
          return 'imgIntercomunicador';
        case 'boolKitAseoPersonal':
          return 'imgKitAseoPersonal';
        case 'boolKitLimpieza':
          return 'imgKitLimpieza';
        case 'boolLenceriaCama':
          return 'imgLenceriaCama';
        case 'boolLlave':
          return 'imgLlave';
        case 'boolPlanchador':
          return 'imgPlanchador';
        case 'boolProtectorColchon':
          return 'imgProtectorColchon';
        case 'boolPuertaServicio':
          return 'imgPuertaServicio';
        case 'boolRefrigerador':
          return 'imgRefrigerador';
        case 'boolSalaStar':
          return 'imgSalaStar';
        case 'boolSujetadorSabana':
          return 'imgSujetadorSabana';
        case 'boolTvCable':
          return 'imgTvCable';
        case 'boolTvProyector':
          return 'imgTvProyector';
        case 'boolVentilador':
          return 'imgVentilador';
        case 'boolVestidor':
          return 'imgVestidor';
        case 'boolWifi':
          return 'imgWifi';
        case 'selCalidadAlmohada':
          return 'imgCalidadAlmohada';
        case 'selMaterialCama':
          return 'imgMaterialCama';
        case 'selMedidaCama':
          return 'imgMedidaCama';
        case 'selTipoBanio':
          return 'imgTipoBanio';
        case 'selTipoColchon':
          return 'imgTipoColchon';
        case 'textCantidadAlmohada':
          return 'imgCantidadAlmohada';
        default:
          return 'imgHabitacion';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 16),
          'Habitaciones - Edición',
        ),
      ),
      body: SingleChildScrollView(
          // Para ocultar el teclado cuando el usuario hace Scroll
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
        children: [
          if(tipo != 'nulo')
            Stack(
              children: [
                HabitacionImageWidget(propiedad: propiedad),
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
                      if (!habitacionForm.activity) {
                        habitacionForm.activity = true;
                      }
                      habitacionService.updateSelectedImage(
                          image.path, getPropiedadImage(propiedad));
                      habitacionForm.updateImagePropiedad(
                          image.path, getPropiedadImage(propiedad));
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
                      if (!habitacionForm.activity) {
                        habitacionForm.activity = true;
                      }
                      habitacionService.updateSelectedImage(
                          photo.path, getPropiedadImage(propiedad));
                      habitacionForm.updateImagePropiedad(
                          photo.path, getPropiedadImage(propiedad));
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                ),
              ],
            ),
          _DetalleHabitacionForm(propiedad, tipo),
          const SizedBox(
            height: 100.0,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: habitacionService.isSaving
            ? null
            : () async {
                if (!habitacionForm.isValidForm()) return;

                final String? imageUrl =
                    await habitacionService.uploadImage(valor);
                if (imageUrl != null) {
                  switch (propiedad) {
                    case 'boolAguaCaliente':
                      habitacionForm.habitacion.imgAguaCaliente = imageUrl;
                      break;
                    case 'boolAguaEmbotellada':
                      habitacionForm.habitacion.imgAguaEmbotellada = imageUrl;
                      break;
                    case 'boolAireAcondicionado':
                      habitacionForm.habitacion.imgAireAcondicionado = imageUrl;
                      break;
                    case 'boolAlfombra':
                      habitacionForm.habitacion.imgAlfombra = imageUrl;
                      break;
                    case 'boolAlmohada':
                      habitacionForm.habitacion.imgAlmohada = imageUrl;
                      break;
                    case 'boolBanioPrivado':
                      habitacionForm.habitacion.imgBanioPrivado = imageUrl;
                      break;
                    case 'boolCloset':
                      habitacionForm.habitacion.imgCloset = imageUrl;
                      break;
                    case 'boolEspejo':
                      habitacionForm.habitacion.imgEspejo = imageUrl;
                      break;
                    case 'boolExhibidor':
                      habitacionForm.habitacion.imgExhibidor = imageUrl;
                      break;
                    case 'boolIntercomunicador':
                      habitacionForm.habitacion.imgIntercomunicador = imageUrl;
                      break;
                    case 'boolKitAseoPersonal':
                      habitacionForm.habitacion.imgKitAseoPersonal = imageUrl;
                      break;
                    case 'boolKitLimpieza':
                      habitacionForm.habitacion.imgKitLimpieza = imageUrl;
                      break;
                    case 'boolLenceriaCama':
                      habitacionForm.habitacion.imgLenceriaCama = imageUrl;
                      break;
                    case 'boolLlave':
                      habitacionForm.habitacion.imgLlave = imageUrl;
                      break;
                    case 'boolPlanchador':
                      habitacionForm.habitacion.imgPlanchador = imageUrl;
                      break;
                    case 'boolProtectorColchon':
                      habitacionForm.habitacion.imgProtectorColchon = imageUrl;
                      break;
                    case 'boolPuertaServicio':
                      habitacionForm.habitacion.imgPuertaServicio = imageUrl;
                      break;
                    case 'boolRefrigerador':
                      habitacionForm.habitacion.imgRefrigerador = imageUrl;
                      break;
                    case 'boolSalaStar':
                      habitacionForm.habitacion.imgSalaStar = imageUrl;
                      break;
                    case 'boolSujetadorSabana':
                      habitacionForm.habitacion.imgSujetadorSabana = imageUrl;
                      break;
                    case 'boolTvCable':
                      habitacionForm.habitacion.imgTvCable = imageUrl;
                      break;
                    case 'boolTvProyector':
                      habitacionForm.habitacion.imgTvProyector = imageUrl;
                      break;
                    case 'boolVentilador':
                      habitacionForm.habitacion.imgVentilador = imageUrl;
                      break;
                    case 'boolVestidor':
                      habitacionForm.habitacion.imgVestidor = imageUrl;
                      break;
                    case 'boolWifi':
                      habitacionForm.habitacion.imgWifi = imageUrl;
                      break;
                    case 'selCalidadAlmohada':
                      habitacionForm.habitacion.imgCalidadAlmohada = imageUrl;
                      break;
                    case 'selMaterialCama':
                      habitacionForm.habitacion.imgMaterialCama = imageUrl;
                      break;
                    case 'selMedidaCama':
                      habitacionForm.habitacion.imgMedidaCama = imageUrl;
                      break;
                    case 'selTipoBanio':
                      habitacionForm.habitacion.imgTipoBanio = imageUrl;
                      break;
                    case 'selTipoColchon':
                      habitacionForm.habitacion.imgTipoColchon = imageUrl;
                      break;
                    case 'textCantidadAlmohada':
                      habitacionForm.habitacion.imgCantidadAlmohada = imageUrl;
                      break;
                    default:
                      habitacionForm.habitacion.imgHabitacion = imageUrl;
                  }
                }

                await habitacionService
                    .saveHabitacion(habitacionForm.habitacion);

                habitacionForm.activity = false;
              },
        child: habitacionService.isSaving
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : (!habitacionForm.activity)
                ? null
                : const Icon(
                    Icons.save_outlined,
                  ),
      ),
    );
  }
}

class _DetalleHabitacionForm extends StatelessWidget {

  const _DetalleHabitacionForm(this.propiedad, this.tipo);

  final String propiedad;
  final String tipo;
  
  @override
  Widget build(BuildContext context) {
    final habitacionForm = Provider.of<HabitacionFormProvider>(context);
    final habitacion = habitacionForm.habitacion;

    bool getValor() {
      switch (propiedad) {
        case 'boolAguaCaliente':
          return habitacion.boolAguaCaliente;
        case 'boolAguaEmbotellada':
          return habitacion.boolAguaEmbotellada;
        case 'boolAireAcondicionado':
          return habitacion.boolAireAcondicionado;
        case 'boolAlfombra':
          return habitacion.boolAlfombra;
        case 'boolAlmohada':
          return habitacion.boolAlmohada;
        case 'boolBanioPrivado':
          return habitacion.boolBanioPrivado;
        case 'boolCloset':
          return habitacion.boolCloset;
        case 'boolEspejo':
          return habitacion.boolEspejo;
        case 'boolExhibidor':
          return habitacion.boolExhibidor;
        case 'boolIntercomunicador':
          return habitacion.boolIntercomunicador;
        case 'boolKitAseoPersonal':
          return habitacion.boolKitAseoPersonal;
        case 'boolKitLimpieza':
          return habitacion.boolKitLimpieza;
        case 'boolLenceriaCama':
          return habitacion.boolLenceriaCama;
        case 'boolLlave':
          return habitacion.boolLlave;
        case 'boolPlanchador':
          return habitacion.boolPlanchador;
        case 'boolProtectorColchon':
          return habitacion.boolProtectorColchon;
        case 'boolPuertaServicio':
          return habitacion.boolPuertaServicio;
        case 'boolRefrigerador':
          return habitacion.boolRefrigerador;
        case 'boolSalaStar':
          return habitacion.boolSalaStar;
        case 'boolSujetadorSabana':
          return habitacion.boolSujetadorSabana;
        case 'boolTvCable':
          return habitacion.boolTvCable;
        case 'boolTvProyector':
          return habitacion.boolTvProyector;
        case 'boolVentilador':
          return habitacion.boolVentilador;
        case 'boolVestidor':
          return habitacion.boolVestidor;
        case 'boolWifi':
          return habitacion.boolWifi;
        default:
          return false;
      }
    }

    return Container(
      width: double.infinity,
      decoration: _buildBoxDecoration(),
      child: Form(
          key: habitacionForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              if (tipo == 'text' && propiedad == 'textCantidadAlmohada')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: habitacion.textCantidadAlmohada,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?'))
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Ingrese un valor',
                        labelText: 'Cantidad de Almohadas'),
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        habitacion.textCantidadAlmohada = '1';
                      } else {
                        habitacion.textCantidadAlmohada = value;
                      }
                      if (!habitacionForm.activity) {
                        habitacionForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese un valor válido';
                      }
                      return null;
                    },
                  ),
                ),
              if (tipo == 'sel' && propiedad == 'selCalidadAlmohada')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: habitacion.selCalidadAlmohada,
                    items: const [
                      DropdownMenuItem(value: 'M', child: Text('Media')),
                      DropdownMenuItem(value: 'A', child: Text('Alta')),
                      DropdownMenuItem(value: 'S', child: Text('Superior')),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Calidad Almohada',
                    ),
                    onChanged: (value) {
                      if (!habitacionForm.activity) {
                        habitacionForm.existeActividad();
                      }
                      habitacion.selCalidadAlmohada = value!;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                if (tipo == 'sel' && propiedad == 'selMaterialCama')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: habitacion.selMaterialCama,
                    items: const [
                      DropdownMenuItem(value: 'H', child: Text('Hormigón')),
                      DropdownMenuItem(value: 'M', child: Text('Madera')),
                      DropdownMenuItem(value: 'F', child: Text('Metal')),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Material cama',
                    ),
                    onChanged: (value) {
                      if (!habitacionForm.activity) {
                        habitacionForm.existeActividad();
                      }
                      habitacion.selMaterialCama = value!;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                if (tipo == 'sel' && propiedad == 'selMedidaCama')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: habitacion.selMedidaCama,
                    items: const [
                      DropdownMenuItem(
                          value: 'C', child: Text('Plaza un cuarto')),
                      DropdownMenuItem(
                          value: 'M', child: Text('Plaza y media')),
                      DropdownMenuItem(value: 'D', child: Text('Plaza doble')),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Ancho cama',
                    ),
                    onChanged: (value) {
                      if (!habitacionForm.activity) {
                        habitacionForm.existeActividad();
                      }
                      habitacion.selMedidaCama = value!;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                if (tipo == 'sel' && propiedad == 'selTipoBanio')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: habitacion.selTipoBanio,
                    items: const [
                      DropdownMenuItem(value: 'S', child: Text('Baño Simple')),
                      DropdownMenuItem(
                          value: 'C', child: Text('Baño Completo')),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Tipo de baño',
                    ),
                    onChanged: (value) {
                      if (!habitacionForm.activity) {
                        habitacionForm.existeActividad();
                      }
                      habitacion.selTipoBanio = value!;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                if (tipo == 'sel' && propiedad == 'selTipoColchon')
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    value: habitacion.selTipoColchon,
                    items: const [
                      DropdownMenuItem(value: 'M', child: Text('Media')),
                      DropdownMenuItem(value: 'A', child: Text('Alta')),
                      DropdownMenuItem(value: 'S', child: Text('Superior')),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Calidad colchón',
                    ),
                    onChanged: (value) {
                      if (!habitacionForm.activity) {
                        habitacionForm.existeActividad();
                      }
                      habitacion.selTipoColchon = value!;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
              if (tipo == 'bool')
                SwitchListTile.adaptive(
                  activeColor: AppTheme.primaryColorApp,
                  title: Text(getNombre()),
                  value: getValor(),
                  onChanged: (value) {
                    if (!habitacionForm.activity) {
                      habitacionForm.existeActividad();
                    }
                    habitacionForm.updateSwitchPropiedad(
                        value.toString(), propiedad);
                  },
                ),
              const SizedBox(height: 30.0)
            ],
          )),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]);

  String getNombre() {
    switch (propiedad) {
      case 'boolAguaCaliente':
        return 'Agua Caliente';
      case 'boolAguaEmbotellada':
        return 'Agua embotellada';
      case 'boolAireAcondicionado':
        return 'Aire acondicionado';
      case 'boolAlfombra':
        return 'Alfombra';
      case 'boolAlmohada':
        return 'Almohada';
      case 'boolBanioPrivado':
        return 'Baño privado';
      case 'boolCloset':
        return 'Closet';
      case 'boolEspejo':
        return 'Espejo';
      case 'boolExhibidor':
        return 'Exhibidor';
      case 'boolIntercomunicador':
        return 'Intercomunicador';
      case 'boolKitAseoPersonal':
        return 'Kit de aseo personal';
      case 'boolKitLimpieza':
        return 'Kit de limpieza habitación';
      case 'boolLenceriaCama':
        return 'Lenceria de Cama';
      case 'boolLlave':
        return 'Llave de habitación';
      case 'boolPlanchador':
        return 'Planchador';
      case 'boolProtectorColchon':
        return 'Protector de colchón';
      case 'boolPuertaServicio':
        return 'Puerta de servicio';
      case 'boolRefrigerador':
        return 'Mini nevera';
      case 'boolSalaStar':
        return 'Sala de star';
      case 'boolSujetadorSabana':
        return 'Sujetador de sábana';
      case 'boolTvCable':
        return 'TvCable';
      case 'boolTvProyector':
        return 'Tv - Proyector';
      case 'boolVentilador':
        return 'Ventilador';
      case 'boolVestidor':
        return 'Vestidor';
      case 'boolWifi':
        return 'Wifi';
      case 'selCalidadAlmohada':
        return 'Calidad almohada';
      case 'selMaterialCama':
        return 'Material de cama';
      case 'selMedidaCama':
        return 'Medida cama';
      case 'selTipoBanio':
        return 'Tipo de baño';
      case 'selTipoColchon':
        return 'Tipo de colchón';
      case 'textCantidadAlmohada':
        return 'Cantidad de almohadas';
      default:
        return 'Habitación';
    }
  }
}
