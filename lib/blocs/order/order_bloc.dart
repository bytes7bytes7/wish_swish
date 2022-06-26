import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:order_repo/order_repo.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._orderRepo) : super(const OrderInitState()) {
    on<OrderLoadEvent>(_load);
    on<OrderCreateEvent>(_create);
  }

  final OrderRepo _orderRepo;

  Future<void> _load(OrderLoadEvent event, Emitter<OrderState> emit) {
    return _orderRepo.load();
  }

  Future<void> _create(OrderCreateEvent event, Emitter<OrderState> emit) {
    return _orderRepo.create(event.order);
  }
}
