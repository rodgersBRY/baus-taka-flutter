class ProductModel {
  String productName;
  int price;
  String description;

  ProductModel({
    required this.productName,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productName: json['product_name'],
        description: json['desc'],
        price: json['price'],
      );
}
