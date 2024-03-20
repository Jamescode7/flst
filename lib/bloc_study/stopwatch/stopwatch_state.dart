part of 'stopwatch_bloc.dart';

class StopwatchState {
  final int elapsedTime;
  final bool isRunning;
  final List<String> labs;

  const StopwatchState({
    required this.elapsedTime,
    this.isRunning = false,
    this.labs = const [],
  });

  StopwatchState copyWith({
    int? elapsedTime,
    bool? isRunning,
    List<String>? labs,
  }) =>
      StopwatchState(
        elapsedTime: elapsedTime ?? this.elapsedTime,
        isRunning: isRunning ?? this.isRunning,
        labs: labs ?? this.labs,
      );
}
