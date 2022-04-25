import 'package:flutter/material.dart';

class GlobalParams{
  static List<Map<String,dynamic>> menus= [
    {
      "title":"Counter",
      "icon": Icon(Icons.home, color: Colors.orange,),
      "route": "/counter"
    },
    {
      "title":"CounterProvider",
      "icon": Icon(Icons.home, color: Colors.orange,),
      "route": "/counter2"
    },
    {
      "title":"CounterCubit",
      "icon": Icon(Icons.home, color: Colors.orange,),
      "route": "/counterCubit"
    },
    {
      "title":"CounterBloc",
      "icon": Icon(Icons.home, color: Colors.orange,),
      "route": "/counterBloc"
    },
    {
      "title":"Gallery",
      "icon": Icon(Icons.map, color: Colors.orange,),
      "route": "/gallery"
    },
    {
      "title":"Meteo",
      "icon": Icon(Icons.camera, color: Colors.orange,),
      "route": "/meteo"
    },
    {
      "title":"Users",
      "icon": Icon(Icons.supervised_user_circle_sharp, color: Colors.orange,),
      "route": "/users"
    },

  ];
}
