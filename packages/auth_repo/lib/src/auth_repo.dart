import 'models/models.dart';

abstract class AuthRepo {
  Future<User> logIn(String email, String password);
}
