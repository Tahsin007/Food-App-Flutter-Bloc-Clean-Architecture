import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  CategoryModel({
    super.id,
    super.imageFullUrl,
    super.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      imageFullUrl: json['image_full_url'],
      title: json['name'],
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, imageFullUrl: $imageFullUrl, title: $title}';
  }
}