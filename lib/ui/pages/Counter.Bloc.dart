import 'package:app_flutter/ui/stateCubit/CounterBloc.dart';
import 'package:app_flutter/ui/stateCubit/CounterCubitState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Bloc'),),
      body: BlocBuilder<CounterBloc,int>(
        builder: (context,state){
          return Center(
              child: Text('the counter value is $state')
          );
        },

      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(EventCount.INCREMENT);
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
            onPressed: () {
                context.read<CounterBloc>().add(EventCount.DECREMENT);
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
