import 'models/models.dart';

abstract class ProductRepo {
  const ProductRepo();

  Future<List<Product>> load(String categoryID);

  Future<void> pick(Product product);

  Future<void> remove(Product product);

  Future<void> clear();
}
