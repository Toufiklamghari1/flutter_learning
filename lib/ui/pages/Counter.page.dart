import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: Text('the counter value is $counter')
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
