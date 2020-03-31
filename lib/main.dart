import 'package:ansem/src/blocs/provider.dart';
import 'package:flutter/material.dart';

import 'package:ansem/src/pages/home_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ansem',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
