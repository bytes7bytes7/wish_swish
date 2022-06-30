import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repo/product_repo.dart';

import '../order/order_bloc.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
    this._cartRepo,
    this._orderBloc,
  ) : super(const CartInitState()) {
    on<CartLoadEvent>(_load);
    on<CartPickEvent>(_pick);
    on<CartRemoveEvent>(_remove);
    on<CartOrderEvent>(_order);
  }

  final CartRepo _cartRepo;
  final OrderBloc _orderBloc;

  Future<void> _load(
    CartLoadEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is! CartLoadingState) {
      emit(const CartLoadingState());
    }

    final products = await _cartRepo.load();
    final cost = products.fold<double>(0.0, (prev, curr) => prev + curr.cost);

    emit(
      CartDataState(
        products: products,
        cost: cost,
      ),
    );
  }

  Future<void> _pick(CartPickEvent event, Emitter<CartState> emit) async {
    final prevState = state;

    if (state is! CartLoadingState) {
      emit(const CartLoadingState());
    }

    unawaited(_cartRepo.pick(event.product));

    final products = <Product>[];

    if (prevState is CartDataState) {
      products.addAll(prevState.products);
    }

    products.add(event.product);

    final cost = products.fold<double>(0.0, (prev, curr) => prev + curr.cost);

    emit(
      CartDataState(
        products: products,
        cost: cost,
      ),
    );

    return;
  }

  Future<void> _remove(
    CartRemoveEvent event,
    Emitter<CartState> emit,
  ) async {
    final prevState = state;

    if (state is! CartLoadingState) {
      emit(const CartLoadingState());
    }

    unawaited(_cartRepo.remove(event.product));

    final products = <Product>[];

    if (prevState is CartDataState) {
      products
        ..addAll(prevState.products)
        ..removeWhere((e) => e.id == event.product.id);
    }

    final cost = products.fold<double>(0.0, (prev, curr) => prev + curr.cost);

    emit(
      CartDataState(
        products: products,
        cost: cost,
      ),
    );

    return;
  }

  Future<void> _order(
    CartOrderEvent event,
    Emitter<CartState> emit,
  ) async {
    unawaited(_cartRepo.clear());

    final prevState = state;
    if (prevState is CartDataState) {
      _orderBloc.add(
        OrderCreateEvent(
          products: prevState.products,
          cost: prevState.cost,
        ),
      );
    }

    emit(
      const CartDataState(
        products: [],
        cost: 0,
      ),
    );

    return;
  }
}
