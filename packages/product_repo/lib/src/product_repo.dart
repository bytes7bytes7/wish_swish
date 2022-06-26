import 'models/models.dart';

abstract class ProductRepo {
  const ProductRepo();

  Future<List<Product>> load(String categoryID);
}
