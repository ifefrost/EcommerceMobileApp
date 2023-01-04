class ProductObject {
  String image;
  String name;
  double price;
  String description;
  String category;
  String id;
  int quantity;
  double rating;
  bool isFavorite;

  ProductObject({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.id,
    required this.quantity,
    required this.rating,
    required this.isFavorite,
  });
}