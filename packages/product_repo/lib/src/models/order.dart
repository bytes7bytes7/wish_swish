import 'product.dart';

class Order {
  const Order({
    required this.id,
    required this.number,
    required this.totalCost,
    required this.dateTime,
    required this.products,
  });

  final String id;
  final int number;
  final double totalCost;
  final DateTime dateTime;
  final List<Product> products;
}
