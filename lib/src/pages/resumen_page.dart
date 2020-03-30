import 'package:flutter/material.dart';

class ResumenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ultima Ubicación'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Icon(
              Icons.my_location,
              size: 175.0,
            ),
            _info('Latitud', 63.99999, Icons.navigation),
            _info('Longitud', -75.989878878, Icons.near_me),
            _info('Fecha de ubicación', 63.99999, Icons.timer),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, double valor, IconData icono) {
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
                valor.toString(),
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
