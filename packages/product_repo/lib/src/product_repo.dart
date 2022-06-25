import 'models/models.dart';

abstract class ProductRepo {
  Future<List<Product>> load(String categoryID);

  Future<void> pick(Product product);

  Future<void> remove(Product product);

  Future<void> clear();
}
