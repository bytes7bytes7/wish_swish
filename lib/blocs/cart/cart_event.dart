part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartLoadEvent extends CartEvent {
  const CartLoadEvent();
}

class CartPickEvent extends CartEvent {
  const CartPickEvent({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

class CartRemoveEvent extends CartEvent {
  const CartRemoveEvent({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

class CartOrderEvent extends CartEvent {
  const CartOrderEvent();
}
