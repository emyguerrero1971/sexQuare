import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sexquare/widgets/widgets.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/arguments/arguments_screen.dart';

class DetalleInstalacionScreen extends StatelessWidget {
  static const String routeName = 'detalleInstalacion';

  const DetalleInstalacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final instalacionService = Provider.of<InstalacionesService>(context);

    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return ChangeNotifierProvider(
        create: (_) =>
            InstalacionFormProvider(instalacionService.copyRegistroInstalacion),
        child: _DetalleInstalacionScreenBody(
            instalacionService: instalacionService,
            propiedad: args.nombre,
            tipo: args.tipo,
            valor: args.valor));
  }
}

class _DetalleInstalacionScreenBody extends StatelessWidget {
  const _DetalleInstalacionScreenBody({
    required this.instalacionService,
    required this.propiedad,
    required this.tipo,
    required this.valor,
  });

  final InstalacionesService instalacionService;
  final String propiedad;
  final String tipo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    final instalacionForm = Provider.of<InstalacionFormProvider>(context);

    String getPropiedadImage(propiedad) {
      switch (propiedad) {
        case 'boolBar':
          return 'imgBar';
        case 'boolBanioPublico':
          return 'imgBanioPublico';
        case 'boolBeautySalom':
          return 'imgBeautySalom';
        case 'boolBuzonQS':
          return 'imgBuzonQS';
        case 'boolCajeroAutomatico':
          return 'imgCajeroAutomatico';
        case 'boolCine':
          return 'imgCine';
        case 'boolCircuitoCerrado':
          return 'imgCircuitoCerrado';
        case 'boolCostura':
          return 'imgCostura';
        case 'boolConcursos':
          return 'imgConcursos';
        case 'boolDiskJokey':
          return 'imgDiskJokey';
        case 'boolEfectos':
          return 'imgEfectos';
        case 'boolGimnacio':
          return 'imgGimnacio';
        case 'boolGuardia':
          return 'imgGuardia';
        case 'boolHidromasaje':
          return 'imgHidromasaje';
        case 'boolLaundry':
          return 'imgLaundry';
        case 'boolLuces':
          return 'imgLuces';
        case 'boolMiniHotel':
          return 'imgMiniHotel';
        case 'boolParqueo':
          return 'imgParqueo';
        case 'boolPiscina':
          return 'imgPiscina';
        case 'boolPoledance':
          return 'imgPoledance';
        case 'boolReservado':
          return 'imgReservado';
        case 'boolRestaurant':
          return 'imgRestaurant';
        case 'boolSalaFumadores':
          return 'imgSalaFumadores';
        case 'imgSalaVip':
          return 'imgSalaVip';
        case 'boolSauna':
          return 'imgSauna';
        case 'boolShows':
          return 'imgShows';
        case 'boolTaxi':
          return 'imgTaxi';
        case 'boolTienda':
          return 'imgTienda';
        case 'boolTurco':
          return 'imgTurco';
        case 'boolVendingSnacks':
          return 'imgVendingSnacks';
        case 'boolVendingBebidas':
          return 'imgVendingBebidas';
        case 'boolWifi':
          return 'imgWifi';
        default:
          return 'imgInstalacion';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 16),
          'Instalaciones - Edición',
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
                InstalacionImageWidget(propiedad: propiedad),
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
                      if (!instalacionForm.activity) {
                        instalacionForm.existeActividad();
                      }
                      instalacionService.updateSelectedImage(
                          image.path, getPropiedadImage(propiedad));
                      instalacionForm.updateImagePropiedad(
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
                      if (!instalacionForm.activity) {
                        instalacionForm.existeActividad();
                      }
                      instalacionService.updateSelectedImage(
                          photo.path, getPropiedadImage(propiedad));
                      instalacionForm.updateImagePropiedad(
                          photo.path, getPropiedadImage(propiedad));
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                ),
              ],
            ),
          _DetalleInstalacionForm(propiedad, tipo),
          const SizedBox(
            height: 100.0,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: instalacionService.isSaving
            ? null
            : () async {
                if (!instalacionForm.isValidForm()) return;

                final String? imageUrl =
                    await instalacionService.uploadImage(valor);
                if (imageUrl != null) {
                  switch (propiedad) {
                    case 'boolBar':
                      instalacionForm.instalacion.imgBar = imageUrl;
                      break;
                    case 'boolBanioPublico':
                      instalacionForm.instalacion.imgBanioPublico = imageUrl;
                      break;
                    case 'boolBeautySalom':
                      instalacionForm.instalacion.imgBeautySalom = imageUrl;
                      break;
                    case 'boolBuzonQS':
                      instalacionForm.instalacion.imgBuzonQS = imageUrl;
                      break;
                    case 'boolCajeroAutomatico':
                      instalacionForm.instalacion.imgCajeroAutomatico =
                          imageUrl;
                      break;
                    case 'boolCine':
                      instalacionForm.instalacion.imgCine = imageUrl;
                      break;
                    case 'boolCircuitoCerrado':
                      instalacionForm.instalacion.imgCircuitoCerrado = imageUrl;
                      break;
                    case 'boolCostura':
                      instalacionForm.instalacion.imgCostura = imageUrl;
                      break;
                    case 'boolConcursos':
                      instalacionForm.instalacion.imgConcursos = imageUrl;
                      break;
                    case 'boolDiskJokey':
                      instalacionForm.instalacion.imgDiskJokey = imageUrl;
                      break;
                    case 'boolEfectos':
                      instalacionForm.instalacion.imgEfectos = imageUrl;
                      break;
                    case 'boolGimnacio':
                      instalacionForm.instalacion.imgGimnacio = imageUrl;
                      break;
                    case 'boolGuardia':
                      instalacionForm.instalacion.imgGuardia = imageUrl;
                      break;
                    case 'boolHidromasaje':
                      instalacionForm.instalacion.imgHidromasaje = imageUrl;
                      break;
                    case 'boolLaundry':
                      instalacionForm.instalacion.imgLaundry = imageUrl;
                      break;
                    case 'boolLuces':
                      instalacionForm.instalacion.imgLuces = imageUrl;
                      break;
                    case 'boolMiniHotel':
                      instalacionForm.instalacion.imgMiniHotel = imageUrl;
                      break;
                    case 'boolParqueo':
                      instalacionForm.instalacion.imgParqueo = imageUrl;
                      break;
                    case 'boolPiscina':
                      instalacionForm.instalacion.imgPiscina = imageUrl;
                      break;
                    case 'boolPoledance':
                      instalacionForm.instalacion.imgPoledance = imageUrl;
                      break;
                    case 'boolReservado':
                      instalacionForm.instalacion.imgReservado = imageUrl;
                      break;
                    case 'boolRestaurant':
                      instalacionForm.instalacion.imgRestaurant = imageUrl;
                      break;
                    case 'boolSalaFumadores':
                      instalacionForm.instalacion.imgSalaFumadores = imageUrl;
                      break;
                    case 'boolSalaVip':
                      instalacionForm.instalacion.imgSalaVip = imageUrl;
                      break;
                    case 'boolSauna':
                      instalacionForm.instalacion.imgSauna = imageUrl;
                      break;
                    case 'boolShows':
                      instalacionForm.instalacion.imgShows = imageUrl;
                      break;
                    case 'boolTaxi':
                      instalacionForm.instalacion.imgTaxi = imageUrl;
                      break;
                    case 'boolTienda':
                      instalacionForm.instalacion.imgTienda = imageUrl;
                      break;
                    case 'boolTurco':
                      instalacionForm.instalacion.imgTurco = imageUrl;
                      break;
                    case 'boolVendingSnacks':
                      instalacionForm.instalacion.imgVendingSnacks = imageUrl;
                      break;
                    case 'boolVendingBebidas':
                      instalacionForm.instalacion.imgVendingBebidas = imageUrl;
                      break;
                    case 'boolWifi':
                      instalacionForm.instalacion.imgWifi = imageUrl;
                      break;
                    default:
                      instalacionForm.instalacion.imgInstalacion = imageUrl;
                  }
                }

                await instalacionService
                    .saveInstalacion(instalacionForm.instalacion);
                
                instalacionForm.activity = false;
              },
        child: instalacionService.isSaving
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : (!instalacionForm.activity)
                ? null
                : const Icon(
                    Icons.save_outlined,
                  ),
      ),
    );
  }
}

class _DetalleInstalacionForm extends StatelessWidget {
  const _DetalleInstalacionForm(this.propiedad, this.tipo);

  final String propiedad;
  final String tipo;

  @override
  Widget build(BuildContext context) {
    final instalacionForm = Provider.of<InstalacionFormProvider>(context);
    final instalacion = instalacionForm.instalacion;

    bool getValor() {
      switch (propiedad) {
        case 'boolBar':
          return instalacion.boolBar;
        case 'boolBanioPublico':
          return instalacion.boolBanioPublico;
        case 'boolBeautySalom':
          return instalacion.boolBeautySalom;
        case 'boolBuzonQS':
          return instalacion.boolBuzonQS;
        case 'boolCajeroAutomatico':
          return instalacion.boolCajeroAutomatico;
        case 'boolCine':
          return instalacion.boolCine;
        case 'boolCircuitoCerrado':
          return instalacion.boolCircuitoCerrado;
        case 'boolCostura':
          return instalacion.boolCostura;
        case 'boolConcursos':
          return instalacion.boolConcursos;
        case 'boolDiskJokey':
          return instalacion.boolDiskJokey;
        case 'boolEfectos':
          return instalacion.boolEfectos;
        case 'boolGimnacio':
          return instalacion.boolGimnacio;
        case 'boolGuardia':
          return instalacion.boolGuardia;
        case 'boolHidromasaje':
          return instalacion.boolHidromasaje;
        case 'boolLaundry':
          return instalacion.boolLaundry;
        case 'boolLuces':
          return instalacion.boolLuces;
        case 'boolMiniHotel':
          return instalacion.boolMiniHotel;
        case 'boolParqueo':
          return instalacion.boolParqueo;
        case 'boolPiscina':
          return instalacion.boolPiscina;
        case 'boolPoledance':
          return instalacion.boolPoledance;
        case 'boolReservado':
          return instalacion.boolReservado;
        case 'boolRestaurant':
          return instalacion.boolRestaurant;
        case 'boolSalaFumadores':
          return instalacion.boolSalaFumadores;
        case 'boolSalaVip':
          return instalacion.boolSalaVip;
        case 'boolSauna':
          return instalacion.boolSauna;
        case 'boolShows':
          return instalacion.boolShows;
        case 'boolTaxi':
          return instalacion.boolTaxi;
        case 'boolTienda':
          return instalacion.boolTienda;
        case 'boolTurco':
          return instalacion.boolTurco;
        case 'boolVendingSnacks':
          return instalacion.boolVendingSnacks;
        case 'boolVendingBebidas':
          return instalacion.boolVendingBebidas;
        case 'boolWifi':
          return instalacion.boolWifi;
        default:
          return false;
      }
    }

    return Container(
      width: double.infinity,
      decoration: _buildBoxDecoration(),
      child: Form(
          key: instalacionForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              if (tipo == 'bool')
                SwitchListTile.adaptive(
                  activeColor: AppTheme.primaryColorApp,
                  title: Text(getNombre()),
                  value: getValor(),
                  onChanged: (value) {
                    if (!instalacionForm.activity) {
                      instalacionForm.existeActividad();
                    }
                    instalacionForm.updateSwitchPropiedad(
                        value, propiedad);
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
