import 'package:product_repo/product_repo.dart';

abstract class CartRepo {
  const CartRepo();

  Future<List<Product>> load();

  Future<void> pick(Product product);

  Future<void> remove(Product product);

  Future<void> clear();
}
