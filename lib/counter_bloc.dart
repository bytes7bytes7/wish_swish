import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'counter_repo.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(this._counterRepo) : super(const CounterInitialState()) {
    on<CounterIncrementEvent>(_increment);
    on<CounterDecrementEvent>(_decrement);
  }

  final CounterRepo _counterRepo;

  Future<void> _increment(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    final s = state;
    late final int value;
    if (s is CounterDataState) {
      value = s.value;
    } else {
      value = 0;
    }

    emit(const CounterLoadingState());

    final newValue = await _counterRepo.increment(value);
    emit(CounterDataState(value: newValue));
  }

  Future<void> _decrement(
    CounterDecrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    if (state is! CounterLoadingState) {
      final s = state;
      late final int value;
      if (s is CounterDataState) {
        value = s.value;
      } else {
        value = 0;
      }

      emit(const CounterLoadingState());

      final newValue = await _counterRepo.decrement(value);
      emit(CounterDataState(value: newValue));
    }
  }
}
