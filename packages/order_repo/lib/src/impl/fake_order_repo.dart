import 'package:product_repo/product_repo.dart';

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
  Future<void> create(List<Product> products, double cost) async {
    _storage.add(
      Order(
        id: 'order${_storage.length}',
        number: _storage.length,
        totalCost: cost,
        dateTime: DateTime.now(),
        products: products,
      ),
    );

    return Future.delayed(_duration);
  }
}
