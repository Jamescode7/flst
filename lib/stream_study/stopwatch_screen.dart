import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final List<String> _labs = [];
  final Stopwatch _stopwatch = Stopwatch();
  final Duration _tick = const Duration(milliseconds: 10);
  late Timer _timer;
  late StreamController<int> _streamController;

  void _startTimer() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(_tick, (Timer t) {
        _streamController.add(_stopwatch.elapsedMilliseconds);
      });
    }
  }

  void _stopTimer() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer.cancel();
    }
  }

  void _resetTimer() {
    _stopwatch.reset();
    _streamController.add(0);
    setState(() {
      _labs.clear();
    });
  }

  void _recordLab() {
    if (_stopwatch.isRunning) {
      final milliseconds = _stopwatch.elapsedMilliseconds;
      final labTime = formatElapsedTime(milliseconds);
      setState(() {
        _labs.add(labTime);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
  }

  @override
  void dispose() {
    _timer.cancel();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StopWatch Screen')),
      body: StreamBuilder<int>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          String timerDisplay = formatElapsedTime(snapshot.data ?? 0);
          return Column(
            children: [
              Center(
                child: Text(
                  timerDisplay,
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: _labs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Lab ${index + 1} ${_labs[index]}'),
                  );
                },
              )),
            ],
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _startTimer,
            child: const Icon(Icons.play_arrow),
          ),
          FloatingActionButton(
            onPressed: _stopTimer,
            child: const Icon(Icons.stop),
          ),
          FloatingActionButton(
            onPressed: _resetTimer,
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: _recordLab,
            child: const Icon(Icons.flag),
          ),
        ],
      ),
    );
  }

  String formatElapsedTime(int milliseconds) {
    //milliseconds *= 100;
    final hours = (milliseconds / (1000 * 60 * 60) % 24).floor();
    final minutes = (milliseconds / (1000 * 60) % 60).floor();
    final seconds = ((milliseconds / 1000) % 60).floor();
    final millisecondsDisplay = (milliseconds % 1000).floor();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${millisecondsDisplay.toString().padLeft(3, '0')}';
  }
}
