import 'package:flutter_bloc/flutter_bloc.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc()
      : super(const NameState(
          name: '',
          isNotEmpty: false,
        )) {
    on<NameChanged>(_onNameChanged);
    on<NameSubmitted>(_onNameSubmitted);
  }

  void _onNameChanged(NameChanged event, Emitter<NameState> emit) {
    final name = event.name;
    final isNotEmpty = name.isNotEmpty;
    emit(NameState(name: name, isNotEmpty: isNotEmpty));
  }

  void _onNameSubmitted(NameSubmitted event, Emitter<NameState> emit) {
    emit(const NameState(name: '', isNotEmpty: false));
  }
}
