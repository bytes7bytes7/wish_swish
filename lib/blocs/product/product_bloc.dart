import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repo/product_repo.dart';

import '../../wrappers/product_wrapper.dart';
import '../cart/cart_bloc.dart';

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
  ProductBloc(
    this._productRepo,
    this._cartBloc,
  ) : super(const ProductInitState()) {
    on<ProductLoadEvent>(_load);
  }

  final ProductRepo _productRepo;
  final CartBloc _cartBloc;
  StreamSubscription? _cartSub;

  @override
  Future<void> close() async {
    await _cartSub?.cancel();

    await super.close();
  }

  Future<void> _load(ProductLoadEvent event, Emitter<ProductState> emit) async {
    if (state is! ProductLoadingState) {
      emit(const ProductLoadingState());
    }

    final cartState = _cartBloc.state;
    if (cartState is CartDataState) {
      final products = await _productRepo.load(event.categoryID);
      final productWrappers = <ProductWrapper>[];

      for (final p in products) {
        final cp = cartState.products.firstWhereOrNull((e) => e.id == p.id);
        productWrappers.add(
          ProductWrapper(
            product: p,
            isInCart: cp != null,
          ),
        );
      }

      emit(
        ProductDataState(
          products: productWrappers,
        ),
      );
    } else {
      _cartSub = _cartBloc.stream.listen((cartState) {
        if (cartState is CartDataState) {
          _cartSub?.cancel();

          add(
            ProductLoadEvent(categoryID: event.categoryID),
          );
        }
      });

      if (_cartBloc.state is CartInitState) {
        _cartBloc.add(const CartLoadEvent());
      }
    }

    return;
  }
}
