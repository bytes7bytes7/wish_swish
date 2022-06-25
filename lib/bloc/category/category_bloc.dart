import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category_repo/category_repo.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._categoryRepo) : super(const CategoryInitState()) {
    on<CategoryLoadEvent>(_load);
  }

  final CategoryRepo _categoryRepo;

  Future<void> _load(CategoryLoadEvent event, Emitter<CategoryState> emit) {
    return _categoryRepo.load();
  }
}
