
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:ansem/src/blocs/provider.dart';
import 'package:location/location.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();

  String tipoMapa = 'streets';
  LocationBLoC locationBloc;

  List<Marker> markers = [];

  /*@override
  void initState() {
    _locationBloc.getLocation();
    super.initState();
  }*/

  /*@override
  void dispose() { 
    locationBloc.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    locationBloc = Provider.locationBLoC(context);
    locationBloc.getLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación Actual'),
        actions: <Widget>[
          _changeMapStyle(),
        ],
      ),
      body: _crearFlutterMap(),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _changeMapStyle() {
    return IconButton(
      icon: Icon(Icons.repeat),
      onPressed: () {
        // streets, dark, light, outdoors, satellite
        if (tipoMapa == 'streets') {
          tipoMapa = 'dark';
        } else if (tipoMapa == 'dark') {
          tipoMapa = 'light';
        } else if (tipoMapa == 'light') {
          tipoMapa = 'outdoors';
        } else if (tipoMapa == 'outdoors') {
          tipoMapa = 'satellite';
        } else {
          tipoMapa = 'streets';
        }

        setState(() {});
      },
    );
  }

  Widget _crearBotonFlotante(BuildContext context) {
    locationBloc.getLocation();

    return StreamBuilder(
      stream: locationBloc.locationStream,
      builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
        if (snapshot.hasData) {
          final center =
              LatLng(snapshot.data.latitude, snapshot.data.longitude);
          return FloatingActionButton(
            child: Icon(Icons.my_location),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              
              markers = <Marker>[
                Marker(
                    width: 100.0,
                    height: 100.0,
                    point: center,
                    builder: (context) => Container(
                          child: Icon(
                            Icons.location_on,
                            size: 50.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
              ];

              map.move(center, 15);
              setState(() {});
            },
          );
        } else {
          return FloatingActionButton(
            child: Icon(Icons.my_location),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
          );
        }
      },
    );
  }

  Widget _crearFlutterMap() {
    return StreamBuilder(
      stream: locationBloc.locationStream,
      builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
        if (snapshot.hasData) {
          final center =
              LatLng(snapshot.data.latitude, snapshot.data.longitude);
          return FlutterMap(
            mapController: map,
            options: MapOptions(
              //center: LatLng(6.217, -75.567),
              center: center,
              zoom: 15.0,
              interactive: true,
            ),
            layers: [
              _crearMapa(),
              MarkerLayerOptions(markers: markers),
            ],
          );
        } else {
          return IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              print(snapshot.error);
            },
          );
        }
      },
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
          'id': 'mapbox.$tipoMapa'
          // streets, dark, light, outdoors, satellite
        });
  }

}
