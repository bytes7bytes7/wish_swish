import '../models/product.dart';
import '../product_repo.dart';
import 'fake_data.dart';

const _duration = Duration(seconds: 2);

class FakeProductRepo implements ProductRepo {
  const FakeProductRepo();

  @override
  Future<List<Product>> load(String categoryID) {
    return Future.delayed(_duration, () {
      switch (categoryID) {
        case category1:
          return products1;
        case category2:
          return products2;
        case category3:
          return products3;
        case category4:
          return products4;
        default:
          return [];
      }
    });
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
