class HomeCategoryModel {

  final int id;
  final String categoryName;
  final String image;

  HomeCategoryModel({ required this.id,required this.categoryName, required this.image});
   factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['id'] as int,
      categoryName: json['name'] ??'',
      image: json['image'] ??'',
    );
  }
}
