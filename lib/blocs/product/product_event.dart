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
