// To parse this JSON data, do
//
//     final booleanResponse = booleanResponseFromJson(jsonString);

import 'dart:convert';

BooleanResponse booleanResponseFromJson(String str) => BooleanResponse.fromJson(json.decode(str));

String booleanResponseToJson(BooleanResponse data) => json.encode(data.toJson());

class BooleanResponse {
    BooleanResponse({
        required this.existe,
    });

    bool existe;

    factory BooleanResponse.fromJson(Map<String, dynamic> json) => BooleanResponse(
        existe: json["existe"],
    );

    Map<String, dynamic> toJson() => {
        "existe": existe,
    };
}
