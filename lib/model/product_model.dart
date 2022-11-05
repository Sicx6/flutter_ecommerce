class Product {
  String title;
  String image;
  int price;
  String category;
  String? specification;
  String? review;

  Product(
      {required this.title,
      required this.price,
      required this.image,
      required this.category,
      this.specification,
      this.review});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] ?? '',
      price: json['price'] as int,
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      specification: json['specification'] ?? '',
      review: json['review'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'category': category,
      'specification': specification,
      'review': review,
    };
  }
}
