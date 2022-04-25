import 'package:app_flutter/ui/widgets/MyDrawer.widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Home Page'),),
        body: Center(
          child: Text('Home Page',style: Theme.of(context).textTheme.headline5 ),
        )
    );
  }
}