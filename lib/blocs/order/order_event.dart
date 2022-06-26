part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class OrderLoadEvent extends OrderEvent {
  const OrderLoadEvent();
}

class OrderCreateEvent extends OrderEvent {
  const OrderCreateEvent({
    required this.products,
    required this.cost,
  });

  final List<Product> products;
  final double cost;

  @override
  List<Object?> get props => [products, cost];
}
