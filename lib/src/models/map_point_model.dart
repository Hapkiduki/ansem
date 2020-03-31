import 'dart:convert';

MapPointModel mapPointModelFromJson(String str) =>
    MapPointModel.fromJson(json.decode(str));

String mapPointModelModelToJson(MapPointModel data) =>
    json.encode(data.toJson());

class MapPointModel {
  String id;
  String latitud;
  String longitud;
  DateTime fecha;

  MapPointModel({
    this.id,
    this.latitud,
    this.longitud,
    this.fecha,
  });

  factory MapPointModel.fromJson(Map<String, dynamic> json) => MapPointModel(
        id: json["_id"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "latitud": latitud,
        "longitud": longitud,
        "fecha": fecha.toIso8601String(),
      };
}
