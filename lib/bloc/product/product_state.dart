part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitState extends ProductState {
  const ProductInitState();
}

class ProductLoadingState extends ProductState {
  const ProductLoadingState();
}

class ProductDataState extends ProductState {
  const ProductDataState({
    required this.products,
    required this.cart,
    required this.cartCost,
  });

  final List<ProductWrapper> products;
  final List<ProductWrapper> cart;
  final double cartCost;

  @override
  List<Object?> get props => [products, cart, cartCost];
}
