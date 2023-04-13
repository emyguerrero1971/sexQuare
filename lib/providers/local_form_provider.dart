import 'package:flutter/material.dart';
import 'package:sexquare/models/models.dart';

class LocalFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Local local;

  LocalFormProvider(this.local);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool activity = false;
  existeActividad() {
    activity = true;
    notifyListeners();
  }

  updateImagePropiedad(String value, String propiedad) {
    switch (propiedad) {
      // case 'nomPropiedad':
      //   local.nomPropiedad = value;
      //   break;
      default:
        local.imgLocal = value;
    }
    notifyListeners();
  }
}
