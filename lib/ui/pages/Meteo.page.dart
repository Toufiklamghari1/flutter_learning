import 'package:flutter/material.dart';

class Meteo extends StatelessWidget {
  const Meteo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meteo'),),
      body: Center(
        child: Text('Meteo page', style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}
