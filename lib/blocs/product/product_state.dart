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
  });

  final List<ProductWrapper> products;

  @override
  List<Object?> get props => [products];
}
