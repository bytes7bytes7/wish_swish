import '../category_repo.dart';
import '../models/models.dart';
import 'fake_data.dart';

class FakeCategoryRepo implements CategoryRepo {
  const FakeCategoryRepo();

  @override
  Future<List<Category>> load() {
    return Future.delayed(const Duration(seconds: 2), () => categories);
  }
}
