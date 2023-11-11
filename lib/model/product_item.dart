class ProductModel {
  final int id;
  final String name;
  final String description;
  final double oldPrice;
  final double currentPrice;
  final String category;
  final String image;
  final List<ProductModel> recommended;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.oldPrice,
    required this.currentPrice,
    required this.category,
    required this.image,
    required this.recommended,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    
    final List recommendedJson = json['Recommended'] ?? [];
     final recommended = recommendedJson.map((json) => ProductModel.fromJson(json)).toList();
    return ProductModel(
      
      id: json['id'],
      name: json['name'],
      description: json['description'],
      oldPrice: json['old_price'].toDouble(),
      currentPrice: json['current_price'].toDouble(),
      category: json['category'],
      image: json['image'],
      recommended: recommended,
    );
  }
}
 
