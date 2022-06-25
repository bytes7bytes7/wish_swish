part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

class CounterInitialState extends CounterState {
  const CounterInitialState();
}

class CounterLoadingState extends CounterState {
  const CounterLoadingState();
}

class CounterDataState extends CounterState {
  const CounterDataState({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];
}
