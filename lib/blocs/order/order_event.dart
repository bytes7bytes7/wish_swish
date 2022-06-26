part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderLoadEvent extends OrderEvent {
  const OrderLoadEvent();
}

class OrderCreateEvent extends OrderEvent {
  const OrderCreateEvent({required this.order});

  final Order order;

  @override
  List<Object> get props => [order];
}
