import '../auth_repo.dart';
import '../models/models.dart';
import 'fake_data.dart';

class FakeAuthRepo implements AuthRepo {
  const FakeAuthRepo();

  @override
  Future<User> logIn(String email, String password) {
    return Future.delayed(const Duration(seconds: 2), () => user);
  }
}
