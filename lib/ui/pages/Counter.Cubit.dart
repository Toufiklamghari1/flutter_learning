import 'package:app_flutter/ui/stateCubit/CounterCubitState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends StatelessWidget {
  const CounterCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Cubit'),),
      body: BlocBuilder<CounterStateCubit,int>(
        builder: (context,counterCubit){
          return Center(
              child: Text('the counter value is ${counterCubit}')
          );
        },

      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterStateCubit>().increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
            onPressed: () {
                context.read<CounterStateCubit>().decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
