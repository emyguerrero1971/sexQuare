// To parse this JSON data, do
//
//     final localesResponse = localesResponseFromJson(jsonString);

import 'dart:convert';
import 'package:sexquare/models/models.dart';

LocalesResponse localesResponseFromJson(String str) => LocalesResponse.fromJson(json.decode(str));

class LocalesResponse {
    LocalesResponse({
        required this.locales,
    });

    List<Local> locales;

    factory LocalesResponse.fromJson(Map<String, dynamic> json) => LocalesResponse(
        locales: List<Local>.from(json["locales"].map((x) => Local.fromJson(x))),
    );

    factory LocalesResponse.fromMap(Map<String, dynamic> json) => LocalesResponse(
        locales: List<Local>.from(json["locales"].map((x) => Local.fromMap(x))),
    );
}