class Product {
  const Product({
    required this.id,
    required this.categoryID,
    required this.title,
    required this.rating,
    required this.cost,
    required this.image,
  });

  final String id;
  final String categoryID;
  final String title;
  final double rating;
  final double cost;
  final String image;
}
