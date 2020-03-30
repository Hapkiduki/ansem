import 'package:flutter/material.dart';
import 'package:ansem/src/pages/mapas_page.dart';
import 'package:ansem/src/pages/resumen_page.dart';



class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }


  Widget _callPage( int paginaActual ) {

    switch( paginaActual ) {

      case 0: return MapaPage();
      case 1: return ResumenPage();

      default:
        return MapaPage();
    }

  }

  Widget _crearBottomNavigationBar() {

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index; 
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.map ),
          title: Text('Mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.person_pin_circle ),
          title: Text('Resumen')
        ),
      ],
    );


  }
}