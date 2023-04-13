import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexquare/models/horario.dart';

import 'package:sexquare/themes/app_theme.dart';
import 'package:sexquare/services/services.dart';
import 'package:sexquare/providers/providers.dart';

class DetalleHorarioScreen extends StatelessWidget {
  static const String routeName = 'detalleHorario';

  const DetalleHorarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final horarioService = Provider.of<HorariosService>(context);

    return ChangeNotifierProvider(
        create: (_) => HorarioFormProvider(horarioService.copyRegistroHorario),
        child: _HorarioScreenBody(horarioService: horarioService));
  }
}

class _HorarioScreenBody extends StatelessWidget {
  const _HorarioScreenBody({
    required this.horarioService,
  });

  final HorariosService horarioService;

  @override
  Widget build(BuildContext context) {
    final horarioForm = Provider.of<HorarioFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 16),
          'Horarios - Edición',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        _HorarioForm(
            ent1: horarioService.copyRegistroHorario.textPrimerIni,
            sal1: horarioService.copyRegistroHorario.textPrimerFin,
            ent2: horarioService.copyRegistroHorario.textSegundoIni,
            sal2: horarioService.copyRegistroHorario.textSegundoFin,
            mostrar: horarioService.copyRegistroHorario.boolEstado),
        const SizedBox(
          height: 100,
        )
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: horarioService.isSaving
            ? null
            : () async {
                if (!horarioForm.isValidForm()) {
                  return;
                }

                await horarioService.saveHorario(
                    horarioForm.horario);

                horarioForm.activity = false;
              },
        child: horarioService.isSaving
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : (!horarioForm.activity)
                ? null
                : const Icon(
                    Icons.save_outlined,
                  ),
      ),
    );
  }
}

class _HorarioForm extends StatefulWidget {
  const _HorarioForm({
    required this.ent1,
    required this.sal1,
    required this.ent2,
    required this.sal2,
    required this.mostrar,
  });

  final String ent1;
  final String sal1;
  final String ent2;
  final String sal2;
  final bool mostrar;

  @override
  State<_HorarioForm> createState() => _HorarioFormState();
}

class _HorarioFormState extends State<_HorarioForm> {
  TextEditingController controllerEnt1 = TextEditingController();
  TextEditingController controllerSal1 = TextEditingController();
  TextEditingController controllerEnt2 = TextEditingController();
  TextEditingController controllerSal2 = TextEditingController();
  @override
  void initState() {
    super.initState();
    controllerEnt1.text = widget.ent1;
    controllerSal1.text = widget.sal1;
    controllerEnt2.text = widget.ent2;
    controllerSal2.text = widget.sal2;
  }

  @override
  Widget build(BuildContext context) {
    final horarioForm = Provider.of<HorarioFormProvider>(context);
    final horario = horarioForm.horario;
    String helperText = 'Ingrese información válida, campo obligatorio';
    TextStyle helperStyle = const TextStyle(color: Colors.grey);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _builtBoxDecoration(),
        child: Form(
            key: horarioForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Text(
                  horario.textDia,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: controllerEnt1,
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 5,
                    autofocus: true,
                    onChanged: (value) {
                      horario.textPrimerIni = value;
                      if (!horarioForm.activity) {
                        horarioForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 5) {
                        return 'Longitud mínima de caracteres 5';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Entrada',
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
                        onPressed: controllerEnt1.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: controllerSal1,
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 5,
                    onChanged: (value) {
                      horario.textPrimerFin = value;
                      if (!horarioForm.activity) {
                        horarioForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 5) {
                        return 'Longitud mínima de caracteres 5';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Salida',
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
                        onPressed: controllerSal1.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: controllerEnt2,
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 5,
                    onChanged: (value) {
                      horario.textSegundoIni = value;
                      if (!horarioForm.activity) {
                        horarioForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 5) {
                        return 'Longitud mínima de caracteres 5';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Entrada',
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
                        onPressed: controllerEnt2.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: controllerSal2,
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 5,
                    onChanged: (value) {
                      horario.textSegundoFin = value;
                      if (!horarioForm.activity) {
                        horarioForm.existeActividad();
                      }
                    },
                    validator: (value) {
                      if (value == null) return 'Este campo es obligatorio';
                      if (value.length < 5) {
                        return 'Longitud mínima de caracteres 5';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: 'Salida',
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
                        onPressed: controllerSal2.clear,
                        icon: const Icon(
                          Icons.clear_rounded,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SwitchListTile.adaptive(
                  activeColor: AppTheme.primaryColorApp,
                  title: const Text('Mostrar'),
                  value: horario.boolEstado,
                  onChanged: (value) {
                    if (!horarioForm.activity) {
                      horarioForm.existeActividad();
                    }
                    horarioForm.updateSwitchMostrar(value);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }

  BoxDecoration _builtBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 8),
                blurRadius: 5)
          ]);
}
