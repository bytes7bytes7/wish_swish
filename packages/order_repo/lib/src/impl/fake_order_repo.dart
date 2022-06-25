import '../models/order.dart';
import '../order_repo.dart';

const _duration = Duration(seconds: 2);

class FakeOrderRepo implements OrderRepo {
  // TODO: add simple fake storage

  @override
  Future<List<Order>> load() {
    return Future.delayed(_duration, () => []);
  }

  @override
  Future<void> create(Order order) {
    return Future.delayed(_duration);
  }
}
