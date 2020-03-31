import 'package:flutter/material.dart';

import 'package:ansem/src/blocs/location_bloc.dart';
export 'package:ansem/src/blocs/location_bloc.dart';



class Provider extends InheritedWidget {

  final _locationBloc = new LocationBLoC();


  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );


  

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LocationBLoC locationBLoC ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider )._locationBloc;
  }

}