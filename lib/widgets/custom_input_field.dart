import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? initialValue;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final TextAlign textAlign;
  final bool isDense;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    Key? key,
    this.autofocus = false,
    this.hintText,
    this.labelText,
    this.helperText,
    this.initialValue,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.isDense = false,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    required this.enabled,
    required this.formValues,
    required this.formProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color colorTextPage = const Color(0xff0F3B78);

    return TextFormField(
        autofocus: autofocus,
        enabled: enabled,
        initialValue: initialValue,
        textAlign: textAlign,
        // textCapitalization: TextCapitalization.sentences,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: (value) => formValues[formProperty] = value,
        validator: (value) {
          if (value!.isEmpty) return 'Digite un valor';
          return null;
          // return value.length < 3 ? 'Mínimo de 3 caracteres' : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // style: TextStyle(color: colorTextPage, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          isDense: isDense,
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          icon: icon == null ? null : Icon(icon),
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ));
  }
}
