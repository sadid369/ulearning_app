import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/app_blocs.dart';
import 'package:ulearning_app/app_events.dart';
import 'package:ulearning_app/app_states.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return AppBlocs();
    },
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Learning',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Welcome(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrementCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<AppBlocs, AppStates>(
                builder: (context, state) {
                  return Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<AppBlocs>().add(Increment());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<AppBlocs>().add(Decrement());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
