import 'models/models.dart';

abstract class OrderRepo {
  Future<List<Order>> load();

  Future<void> create(Order order);
}
