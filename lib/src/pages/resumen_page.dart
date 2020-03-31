import 'package:ansem/src/models/map_point_model.dart';
import 'package:flutter/material.dart';
import 'package:ansem/src/blocs/provider.dart';

class ResumenPage extends StatefulWidget {
  @override
  _ResumenPageState createState() => _ResumenPageState();
}

class _ResumenPageState extends State<ResumenPage> {
  LocationBLoC locationBloc;

  
  /*@override
  void initState() {
    _locationBloc.getLastLocation();
    super.initState();
  }

  @override
  void dispose() { 
    _locationBloc.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {

    locationBloc = Provider.locationBLoC(context);
    locationBloc.getLastLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ultima Ubicación'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: locationBloc.locationDbStream,
          builder:
              (BuildContext context, AsyncSnapshot<MapPointModel> snapshot) {
            MapPointModel mapPointModel = MapPointModel();
            
              mapPointModel = snapshot.data;
              return ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Icon(
                    Icons.my_location,
                    size: 175.0,
                  ),
                  _info(
                    icono: Icons.navigation,
                    title: 'Latitud',
                    valor: mapPointModel.latitud
                  ),
                  _info(
                    icono: Icons.near_me,
                    title: 'Longitud',
                    valor: mapPointModel.longitud
                  ),
                  _info(
                    icono: Icons.timer,
                    title: 'Fecha de ubicación',
                    valor: mapPointModel.fecha.toIso8601String()
                  ),
                ],
              );
          },
        ),
      ),
    );
  }

  Widget _info({String title, String valor, IconData icono}) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      icono,
                      color: Colors.red[500],
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                valor,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
