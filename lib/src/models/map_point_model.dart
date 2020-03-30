class MapPointModel {
    int id;
    double latitud;
    double longitud;
    DateTime fecha;

    MapPointModel({
        this.id,
        this.latitud,
        this.longitud,
        this.fecha,
    });

    factory MapPointModel.fromJson(Map<String, dynamic> json) => MapPointModel(
        id: json["_id"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "latitud": latitud,
        "longitud": longitud,
        "fecha": fecha.toIso8601String(),
    };
}
