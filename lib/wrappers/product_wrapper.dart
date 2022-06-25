import 'package:product_repo/product_repo.dart';

class ProductWrapper {
  ProductWrapper({
    required this.product,
    required this.isInCart,
  });

  final Product product;
  final bool isInCart;
}
