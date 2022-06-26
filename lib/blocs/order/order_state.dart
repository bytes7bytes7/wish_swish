part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitState extends OrderState {
  const OrderInitState();
}

class OrderLoadingState extends OrderState {
  const OrderLoadingState();
}

class OrderDataState extends OrderState {
  const OrderDataState({required this.orders});

  final List<Order> orders;

  @override
  List<Object?> get props => [orders];
}
