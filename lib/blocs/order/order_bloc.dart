import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:order_repo/order_repo.dart';
import 'package:product_repo/product_repo.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._orderRepo) : super(const OrderInitState()) {
    on<OrderLoadEvent>(_load);
    on<OrderCreateEvent>(_create);
  }

  final OrderRepo _orderRepo;

  Future<void> _load(OrderLoadEvent event, Emitter<OrderState> emit) async {
    if (state is! OrderLoadingState) {
      emit(const OrderLoadingState());
    }

    final orders = await _orderRepo.load();

    emit(
      OrderDataState(
        orders: orders,
      ),
    );
  }

  Future<void> _create(OrderCreateEvent event, Emitter<OrderState> emit) async {
    if (state is! OrderLoadingState) {
      emit(const OrderLoadingState());
    }

    await _orderRepo.create(event.products, event.cost);

    final orders = await _orderRepo.load();

    emit(
      OrderDataState(
        orders: orders,
      ),
    );
  }
}
