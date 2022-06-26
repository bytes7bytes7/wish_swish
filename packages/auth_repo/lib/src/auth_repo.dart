import 'models/models.dart';

abstract class AuthRepo {
  const AuthRepo();

  Future<User?> logIn(String email, String password);
}
