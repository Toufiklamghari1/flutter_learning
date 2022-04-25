
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterState extends ChangeNotifier{
  int counter=0;
  increment(){
    counter++;
    notifyListeners();
  }
  decrement(){
    counter--;
    notifyListeners();
  }
}