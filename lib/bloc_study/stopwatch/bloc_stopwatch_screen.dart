import 'package:flst/bloc_study/stopwatch/stopwatch_bloc.dart';
import 'package:flst/bloc_study/stopwatch/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocStopWatchScreen extends StatelessWidget {
  const BlocStopWatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC StopWatch Screen')),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<StopwatchBloc, StopwatchState>(
              builder: (context, state) {
                return Text(
                  formatElapsedTime(state.elapsedTime),
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
          ),
          Expanded(child: BlocBuilder<StopwatchBloc, StopwatchState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.labs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Lab${index + 1} ${state.labs[index]}'),
                  );
                },
              );
            },
          )),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<StopwatchBloc>().add(const StopwatchStarted()),
            child: const Icon(Icons.play_arrow),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<StopwatchBloc>().add(const StopwatchStoped()),
            child: const Icon(Icons.stop),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<StopwatchBloc>().add(const StopwatchReset()),
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<StopwatchBloc>().add(const StopwatchRecorded()),
            child: const Icon(Icons.flag),
          ),
        ],
      ),
    );
  }
}
