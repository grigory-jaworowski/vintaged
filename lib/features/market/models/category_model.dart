import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parendId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parendId = '',
    this.isFeatured = false,
  });

  // Empty function
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  // Convert model to JSON to store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parendId,
      'isFeatured': isFeatured,
    };
  }

  // Map JSON oriented document snapshot from Firebase to CategoryModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parendId: data['ParentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}