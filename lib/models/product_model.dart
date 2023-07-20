import 'package:shamo/models/gallery_model.dart';

import 'category.model.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;
  String? tags;
  final CategoryModel category;
  DateTime? createdAt;
  DateTime? updatedAt;
  final List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    this.tags,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        tags: json['tags'] ?? '',
        category: CategoryModel.fromJson(json['category']),
        galleries: json['galleries']
            .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
            .toList(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitiaLizedProductModel extends ProductModel {
  UninitiaLizedProductModel({
    int? id,
    String? name,
    double? price,
    String? description,
    String? tags,
    CategoryModel? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<GalleryModel>? galleries,
  }) : super(
          id: id ?? 0,
          name: name ?? '',
          price: price ?? 0.0,
          description: description ?? '',
          tags: tags,
          category: category ?? CategoryModel(id: 0, name: ''),
          createdAt: createdAt,
          updatedAt: updatedAt,
          galleries: galleries ?? [],
        );
}

// class UninitiaLizedProductModel extends ProductModel {
//   UninitiaLizedProductModel({
//     final int? id,
//     String name,
//     double? price,
//     String? description,
//     String? tags,
//     CategoryModel? category,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     List<GalleryModel>? galleries,
//   }) : super(
//           id: id ?? 1,
//           name: name?? '',
//           price: price!,
//           description: description!,
//           tags: tags,
//           category: category!,
//           createdAt: createdAt,
//           updatedAt: updatedAt,
//           galleries: galleries!,
//         );
// }
