import 'models/models.dart';

abstract class CategoryRepo {
  const CategoryRepo();

  Future<List<Category>> load();
}
