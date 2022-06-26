import 'package:product_repo/product_repo.dart';

import '../cart_repo.dart';

const _duration = Duration(seconds: 2);

class FakeCartRepo implements CartRepo {
  const FakeCartRepo();

  @override
  Future<List<Product>> load() {
    return Future.delayed(_duration, () => []);
  }

  @override
  Future<void> pick(Product product) {
    return Future.delayed(_duration);
  }

  @override
  Future<void> remove(Product product) {
    return Future.delayed(_duration);
  }

  @override
  Future<void> clear() {
    return Future.delayed(_duration);
  }
}
