import 'package:flutter/material.dart';
import 'package:sexquare/models/models.dart';

class HorarioFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Horario horario;

  HorarioFormProvider(this.horario);

  updateSwitchMostrar(bool value) {
    horario.boolEstado = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool activity = false;
  existeActividad() {
    activity = true;
    notifyListeners();
  }
}
