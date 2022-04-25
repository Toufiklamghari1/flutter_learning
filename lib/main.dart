import 'package:app_flutter/ui/pages/Counter.Bloc.dart';
import 'package:app_flutter/ui/pages/Counter.Cubit.dart';
import 'package:app_flutter/ui/pages/Counter.page.dart';
import 'package:app_flutter/ui/pages/Counter2.page.dart';
import 'package:app_flutter/ui/pages/Home.page.dart';
import 'package:app_flutter/ui/pages/Meteo.page.dart';
import 'package:app_flutter/ui/pages/Users.page.dart';
import 'package:app_flutter/ui/pages/gallery.page.dart';
import 'package:app_flutter/ui/stateCubit/CounterBloc.dart';
import 'package:app_flutter/ui/stateCubit/CounterCubitState.dart';
import 'package:app_flutter/ui/states/CounterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyAppBloc());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => HomePage(),
          "/users": (context) => UsersPage(),
          "/counter": (context) => Counter(),
          "/meteo": (context) => Meteo(),
          "/gallery": (context) => Gallery(),
          "/counter2": (context) => Counter2(),
          "/counterCubit": (context) => CounterCubit(),
        },
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: "/home",
      ),
    );
  }
}


class MyAppBloc extends StatelessWidget {
  const MyAppBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterStateCubit(0)),
        BlocProvider(create: (context) => CounterBloc(0))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => HomePage(),
          "/users": (context) => UsersPage(),
          "/counter": (context) => Counter(),
          "/meteo": (context) => Meteo(),
          "/gallery": (context) => Gallery(),
          "/counter2": (context) => Counter2(),
          "/counterCubit": (context) => CounterCubit(),
          "/counterBloc": (context) => CounterBlocPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: "/home",
      ),
    );
  }
}






