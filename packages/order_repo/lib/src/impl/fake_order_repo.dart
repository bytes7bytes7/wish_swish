import '../models/order.dart';
import '../order_repo.dart';

const _duration = Duration(seconds: 2);

class FakeOrderRepo implements OrderRepo {
  final _storage = <Order>[];

  @override
  Future<List<Order>> load() {
    return Future.delayed(_duration, () => List.from(_storage));
  }

  @override
  Future<void> create(Order order) {
    _storage.add(order);
    return Future.delayed(_duration);
  }
}
