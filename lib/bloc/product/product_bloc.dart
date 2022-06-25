import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repo/product_repo.dart';

import '../../wrappers/product_wrapper.dart';

part 'product_event.dart';

part 'product_state.dart';

extension _ListExt<E> on List<E> {
  E? firstWhereOrNull(bool Function(E element) test, {E Function()? orElse}) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }

    if (orElse != null) {
      return orElse();
    }

    return null;
  }
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._productRepo) : super(const ProductInitState()) {
    on<ProductLoadEvent>(_load);
    on<ProductPickEvent>(_pick);
    on<ProductRemoveEvent>(_remove);
    on<ProductClearEvent>(_clear);
  }

  final ProductRepo _productRepo;

  Future<void> _load(ProductLoadEvent event, Emitter<ProductState> emit) async {
    final products = await _productRepo.load(event.categoryID);

    final productWrappers = <ProductWrapper>[];
    final cart = <ProductWrapper>[];

    final prevState = state;

    if (state is! ProductLoadingState) {
      emit(const ProductLoadingState());
    }

    if (prevState is ProductDataState) {
      cart.addAll(prevState.cart);
      for (final p in products) {
        final pw = cart.firstWhereOrNull((e) => e.product.id == p.id);
        if (pw != null) {
          productWrappers.add(pw);
        } else {
          productWrappers.add(
            ProductWrapper(
              product: p,
              isInCart: false,
            ),
          );
        }
      }
    } else {
      productWrappers.addAll(
        products.map(
          (e) => ProductWrapper(
            product: e,
            isInCart: false,
          ),
        ),
      );
    }

    final cartCost =
        cart.fold<double>(0.0, (prev, curr) => prev + curr.product.cost);

    emit(
      ProductDataState(
        products: productWrappers,
        cart: cart,
        cartCost: cartCost,
      ),
    );
  }

  Future<void> _pick(ProductPickEvent event, Emitter<ProductState> emit) async {
    await _productRepo.pick(event.productWrapper.product);

    final newProductWrapper = event.productWrapper.copyWith(isInCart: true);

    final productWrappers = <ProductWrapper>[];
    final cart = <ProductWrapper>[
      newProductWrapper,
    ];

    final prevState = state;

    if (state is! ProductLoadingState) {
      emit(const ProductLoadingState());
    }

    if (prevState is ProductDataState) {
      cart.addAll(prevState.cart);
      productWrappers.addAll(prevState.products);
      final index = productWrappers
          .indexWhere((e) => e.product.id == event.productWrapper.product.id);
      productWrappers
        ..removeAt(index)
        ..insert(index, newProductWrapper);
    }

    final cartCost =
        cart.fold<double>(0.0, (prev, curr) => prev + curr.product.cost);

    emit(
      ProductDataState(
        products: productWrappers,
        cart: cart,
        cartCost: cartCost,
      ),
    );

    return;
  }

  Future<void> _remove(
    ProductRemoveEvent event,
    Emitter<ProductState> emit,
  ) async {
    await _productRepo.remove(event.productWrapper.product);

    final newProductWrapper = event.productWrapper.copyWith(isInCart: false);

    final productWrappers = <ProductWrapper>[];
    final cart = <ProductWrapper>[];

    final prevState = state;

    if (state is! ProductLoadingState) {
      emit(const ProductLoadingState());
    }

    if (prevState is ProductDataState) {
      cart.addAll(prevState.cart);
      final cartIndex = cart
          .indexWhere((e) => e.product.id == event.productWrapper.product.id);
      cart
        ..removeAt(cartIndex)
        ..insert(cartIndex, newProductWrapper);
      productWrappers.addAll(prevState.products);
      final prodIndex = productWrappers
          .indexWhere((e) => e.product.id == event.productWrapper.product.id);
      productWrappers
        ..removeAt(prodIndex)
        ..insert(prodIndex, newProductWrapper);
    }

    final cartCost =
        cart.fold<double>(0.0, (prev, curr) => prev + curr.product.cost);

    emit(
      ProductDataState(
        products: productWrappers,
        cart: cart,
        cartCost: cartCost,
      ),
    );

    return;
  }

  Future<void> _clear(
    ProductClearEvent event,
    Emitter<ProductState> emit,
  ) async {
    await _productRepo.clear();

    emit(
      const ProductDataState(
        products: [],
        cart: [],
        cartCost: 0,
      ),
    );

    return;
  }
}
