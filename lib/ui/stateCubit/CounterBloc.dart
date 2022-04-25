
import 'package:bloc/bloc.dart';
enum EventCount{ INCREMENT, DECREMENT}
class CounterBloc extends Bloc<EventCount,int>{
  CounterBloc(int state) : super(state);


  @override
  Stream<int> mapEventToState(EventCount event) async*{
    switch(event){
      case EventCount.DECREMENT:
        yield state-1;break;
      case EventCount.INCREMENT:
        yield state+1;break;

    }
  }

}