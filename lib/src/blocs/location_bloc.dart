import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

import 'package:ansem/src/models/map_point_model.dart';
import 'package:location/location.dart';
//import 'package:ansem/src/utils/save_to_json.dart';

class LocationBLoC {
  MapPointModel mapPointModel = MapPointModel();

  //SaveToJson _saveToJson = SaveToJson();

  LocationData locationData;
  final _locationStreamController = StreamController<LocationData>.broadcast();
  final _locationDbStreamController =
      StreamController<MapPointModel>.broadcast();

  Function(LocationData) get locationSink => _locationStreamController.sink.add;
  Function(MapPointModel) get locationDbSink =>
      _locationDbStreamController.sink.add;

  Stream<LocationData> get locationStream => _locationStreamController.stream;
  Stream<MapPointModel> get locationDbStream =>
      _locationDbStreamController.stream;

  getLocation() async {
    final location = Location();
    locationData = await location.getLocation();
    locationSink(locationData);
  }

  getLastLocation() async {
    final resp = await rootBundle.loadString('data/location.json');
    mapPointModel =  mapPointModelFromJson(resp);
    locationDbSink(mapPointModel);
  }

  /*writeFile(MapPointModel mapPointModel) async {
    print(mapPointModel);
    _saveToJson.writeCounter(mapPointModelModelToJson(mapPointModel));
    locationDbSink(mapPointModel);
  }*/

  void dispose() {
    _locationStreamController?.close();
    _locationDbStreamController?.close();
  }

}
