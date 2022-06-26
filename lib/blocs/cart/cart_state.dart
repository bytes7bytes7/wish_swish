part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitState extends CartState {
  const CartInitState();
}

class CartLoadingState extends CartState {
  const CartLoadingState();
}

class CartDataState extends CartState {
  const CartDataState({
    required this.products,
    required this.cost,
  });

  final List<Product> products;
  final double cost;

  @override
  List<Object?> get props => [products, cost];
}
