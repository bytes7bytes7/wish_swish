class Product {
  const Product({
    required this.id,
    required this.categoryID,
    required this.title,
    required this.rating,
    required this.cost,
    this.image = '',
  });

  final String id;
  final String categoryID;
  final String title;
  final double rating;
  final double cost;

  /// Empty `image` means that there is no pic.
  final String image;
}
