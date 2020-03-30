import 'dart:async';
import 'package:location/location.dart';

class LocationBLoC {
  LocationData locationData;
  final _locationStreamController = StreamController<LocationData>.broadcast();

  Function(LocationData) get locationSink => _locationStreamController.sink.add;

  Stream<LocationData> get locationStream => _locationStreamController.stream;

  Future<LocationData> getLocation() async {
    final location = Location();
    locationData = await location.getLocation();
    locationSink(locationData);
  }

  void dispose() {
    _locationStreamController?.close();
  }
}
