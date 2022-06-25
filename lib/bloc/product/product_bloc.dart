import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repo/product_repo.dart';

import '../../wrappers/product_wrapper.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._productRepo) : super(const ProductInitState()) {
    on<ProductLoadEvent>(_load);
    on<ProductPickEvent>(_pick);
    on<ProductRemoveEvent>(_remove);
    on<ProductClearEvent>(_clear);
  }

  final ProductRepo _productRepo;

  Future<void> _load(ProductLoadEvent event, Emitter<ProductState> emit) {
    return _productRepo.load(event.categoryID);
  }

  Future<void> _pick(ProductPickEvent event, Emitter<ProductState> emit) {
    return _productRepo.pick(event.productWrapper.product);
  }

  Future<void> _remove(ProductRemoveEvent event, Emitter<ProductState> emit) {
    return _productRepo.remove(event.productWrapper.product);
  }

  Future<void> _clear(ProductClearEvent event, Emitter<ProductState> emit) {
    return _productRepo.clear();
  }
}
