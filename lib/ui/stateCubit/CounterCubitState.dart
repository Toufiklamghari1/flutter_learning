import 'package:bloc/bloc.dart';
class CounterStateCubit extends Cubit<int>{
  CounterStateCubit(int state) : super(state);
  increment(){
    emit(state + 1);
  }
  decrement(){
    emit(state - 1);
  }
}