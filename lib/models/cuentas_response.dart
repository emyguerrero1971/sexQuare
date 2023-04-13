// To parse this JSON data, do
//
//     final cuentasResponse = cuentasResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

CuentasResponse cuentasResponseFromJson(String str) => CuentasResponse.fromJson(json.decode(str));

class CuentasResponse {
    CuentasResponse({
        required this.cuentas,
    });

    List<Cuenta> cuentas;

    factory CuentasResponse.fromJson(Map<String, dynamic> json) => CuentasResponse(
        cuentas: List<Cuenta>.from(json["cuentas"].map((x) => Cuenta.fromJson(x))),
    );

    factory CuentasResponse.fromMap(Map<String, dynamic> json) => CuentasResponse(
        cuentas: List<Cuenta>.from(json["cuentas"].map((x) => Cuenta.fromMap(x))),
    );
}