import 'dart:convert';
import 'package:sexquare/models/voto.dart';

VotosResponse votosResponseFromJson(String str) =>
    VotosResponse.fromJson(json.decode(str));

class VotosResponse {
  VotosResponse({
    required this.votos,
  });

  List<Voto> votos;

  factory VotosResponse.fromJson(Map<String, dynamic> json) => VotosResponse(
        votos: List<Voto>.from(json["votos"].map((x) => Voto.fromJson(x))),
      );

  factory VotosResponse.fromMap(Map<String, dynamic> json) => VotosResponse(
        votos: List<Voto>.from(json["votos"].map((x) => Voto.fromMap(x))),
      );
}
