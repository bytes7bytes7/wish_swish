part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitState extends CategoryState {
  const CategoryInitState();
}

class CategoryLoadingState extends CategoryState {
  const CategoryLoadingState();
}

class CategoryDataState extends CategoryState {
  const CategoryDataState({required this.categories});

  final List<Category> categories;

  @override
  List<Object?> get props => [categories];
}
