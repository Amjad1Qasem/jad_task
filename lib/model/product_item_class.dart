class ProductModel {
  final String productName;
  final String productdescription;
  final int oldPrice;
  final int currentPrice;
  final String categoryName;
  final String image;

  ProductModel(
      {required this.productName,
      required this.productdescription,
      required this.oldPrice,
      required this.currentPrice,
      required this.categoryName,
      required this.image});
}
