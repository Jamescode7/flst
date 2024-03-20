import 'package:flst/stream_study/stopwatch_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'StreamBuilder 예제',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    //home: const ClockScreen(),
    home: StopWatchScreen(),
  ));
}
