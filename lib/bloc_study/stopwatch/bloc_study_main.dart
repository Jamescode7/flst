import 'package:flst/bloc_study/stopwatch/bloc_stopwatch_screen.dart';
import 'package:flst/bloc_study/stopwatch/stopwatch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<StopwatchBloc>(
    create: (context) => StopwatchBloc(),
    child: MaterialApp(
      title: 'StreamBuilder 예제',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const ClockScreen(),
      home: const BlocStopWatchScreen(),
    ),
  ));
}
