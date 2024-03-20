import 'dart:async';

import 'package:flst/bloc_study/stopwatch/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  final Stopwatch _stopwatch = Stopwatch();
  final Duration _tick = const Duration(milliseconds: 10);

  StopwatchBloc() : super(const StopwatchState(elapsedTime: 0)) {
    on<StopwatchStarted>(_onStarted);
    on<StopwatchStoped>(_onStopped);
    on<StopwatchReset>(_onReset);
    on<StopwatchTicked>(_onTicked);
    on<StopwatchRecorded>(_onLabRecorded);
  }

  void _onStarted(StopwatchStarted event, Emitter<StopwatchState> emit) {
    _stopwatch.start();
    emit(state.copyWith(isRunning: true));
    _tickTimer();
  }

  void _onStopped(StopwatchStoped event, Emitter<StopwatchState> emit) {
    _stopwatch.stop();
    emit(state.copyWith(isRunning: false));
  }

  void _onReset(StopwatchReset event, Emitter<StopwatchState> emit) {
    _stopwatch.reset();
    emit(state.copyWith(elapsedTime: 0, labs: []));
  }

  void _onTicked(StopwatchTicked event, Emitter<StopwatchState> emit) {
    emit(state.copyWith(elapsedTime: event.elapsedTime));
  }

  void _onLabRecorded(StopwatchRecorded event, Emitter<StopwatchState> emit) {
    final labTime = formatElapsedTime(state.elapsedTime);
    final List<String> updatedLabs = List<String>.from(state.labs)
      ..add(labTime);
    emit(state.copyWith(labs: updatedLabs));
  }

  void _tickTimer() {
    Timer.periodic(_tick, (timer) {
      if (!_stopwatch.isRunning) {
        timer.cancel();
      } else {
        add(StopwatchTicked(elapsedTime: _stopwatch.elapsedMilliseconds));
      }
    });
  }
}
