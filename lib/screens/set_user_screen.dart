// import 'dart:io';
// import 'package:flutter/cupertino.dart';

// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/common/message_utils.dart';
import 'package:sexquare/models/models.dart';
// import 'package:sexquare/global/environment.dart';
// import 'package:sexquare/providers/providers.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/share_preferences/preferences.dart';
import 'package:sexquare/widgets/widgets.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart'

class SetUserScreen extends StatefulWidget {
  static const String routeName = 'setUser';

  const SetUserScreen({super.key});

  @override
  State<SetUserScreen> createState() => _SetUserScreenState();
}

class _SetUserScreenState extends State<SetUserScreen> {
  List<Servicio> servicios = [];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final servicioService = Provider.of<ServiciosService>(context);

    cargarServicios() async {
        servicios = await servicioService.getServicios(Preferences.id);
    }

    cargarServicios();

    final Map<String, dynamic> formValues = {
      'compania': servicios[0].compania,
      'valcompania': servicios[0].valcompania,
      'vaginal': servicios[0].vaginal,
      'valvaginal': servicios[0].valvaginal,
      'oral': servicios[0].oral,
      'valoral': servicios[0].valoral,
      'anal': servicios[0].anal,
      'valanal': servicios[0].valanal,
      'poses': servicios[0].poses,
      'valposes': servicios[0].valposes,
      'hotshow': servicios[0].hotshow,
      'valhotshow': servicios[0].valhotshow,
      'poledance': servicios[0].poledance,
      'valpoledance': servicios[0].valpoledance,
      'trajes': servicios[0].trajes,
      'valtrajes': servicios[0].valtrajes,
      'sextoys': servicios[0].sextoys,
      'valsextoys': servicios[0].valsextoys,
      'fetiches': servicios[0].fetiches,
      'valfetiches': servicios[0].valfetiches,
      'fantasias': servicios[0].fantasias,
      'valfantasias': servicios[0].valfantasias,
      'trios': servicios[0].trios,
      'valtrios': servicios[0].valtrios,
      'grupos': servicios[0].grupos,
      'valgrupos': servicios[0].valgrupos,
      'salidas': servicios[0].salidas,
      'valsalidas': servicios[0].valsalidas,
    };
    return Scaffold(
        appBar: AppBar(
          title: Text('Cofiguración - ${Preferences.nombre}'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Form(
                  key: myFormKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Compañía'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              autofocus: true,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Hora',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valcompania',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Vaginal'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valvaginal',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Oral'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valoral',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Anal'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valanal',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Poses'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valposes',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Hot Show'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valhotshow',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Pole Dance'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valpoledance',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Trajes'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Uso',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valtrajes',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Sex Toys'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Uso',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valsextoys',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Fetiches'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valfetiches',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Fantasías'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valfantasias',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Tríos'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valtrios',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Grupos'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valgrupos',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 55,
                            child: SwitchListTile(
                                activeColor: AppTheme.primaryColorApp,
                                title: const Text('Salida'),
                                value: true,
                                onChanged: (value) {
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            flex: 25,
                            child: CustomInputField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              labelText: 'Acto',
                              initialValue: '0.00',
                              enabled: true,
                              isDense: true,
                              formProperty: 'valsalida',
                              formValues: formValues,
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (!myFormKey.currentState!.validate()) {
                              MessageUtils().showSnackBarText(
                                  context, 'Información incompleta! Revise...');
                              return;
                            } else {
                              print(formValues);
                            }
                          },
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('Guardar')))),
                    ],
                  ),
                ))));
  }
}
