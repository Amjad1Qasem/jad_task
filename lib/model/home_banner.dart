class HomeBannerModel {
  final int id;
  final String name;
  final String description;
  final String image;

  HomeBannerModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});
  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
