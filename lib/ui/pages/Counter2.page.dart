import 'package:app_flutter/ui/states/CounterState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Counter2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider'),),
      body: Consumer<CounterState>(
        builder: (context,counterState,child){
          return Center(
              child: Text('the counter value is ${counterState.counter}', style: Theme.of(context).textTheme.headline3,)
          );
        },

      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
                Provider.of<CounterState>(context, listen: false).increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterState>(context, listen: false).decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
