import 'package:product_repo/product_repo.dart';

class ProductWrapper {
  const ProductWrapper({
    required this.product,
    required this.isInCart,
  });

  final Product product;
  final bool isInCart;
}
