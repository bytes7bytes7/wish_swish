part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class ProductLoadEvent extends ProductEvent {
  const ProductLoadEvent({required this.categoryID});

  final String categoryID;

  @override
  List<Object?> get props => [categoryID];
}

class ProductPickEvent extends ProductEvent {
  const ProductPickEvent({required this.productWrapper});

  final ProductWrapper productWrapper;

  @override
  List<Object?> get props => [productWrapper];
}

class ProductRemoveEvent extends ProductEvent {
  const ProductRemoveEvent({required this.productWrapper});

  final ProductWrapper productWrapper;

  @override
  List<Object?> get props => [productWrapper];
}

class ProductClearEvent extends ProductEvent {
  const ProductClearEvent();
}
