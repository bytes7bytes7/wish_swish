class Category {
  const Category({
    required this.id,
    required this.title,
    required this.amountOfProducts,
    this.image = '',
  });

  final String id;
  final String title;
  final int amountOfProducts;

  /// Empty `image` means that there is no pic.
  final String image;
}
