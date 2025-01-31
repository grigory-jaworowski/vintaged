import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String? brand;
  double? co2;
  String categoryId;
  String condition;
  String description;
  List<String> images;
  int? likes;
  String owner;
  double price;
  String size;
  String subCategoryId;
  String title;

  ProductModel(
      {required this.id,
      this.brand,
      this.co2,
      required this.categoryId,
      required this.condition,
      required this.description,
      required this.images,
      this.likes = 0,
      required this.owner,
      required this.price,
      required this.size,
      required this.subCategoryId,
      required this.title});

  static ProductModel empty() => ProductModel(
      id: '',
      categoryId: '',
      condition: '',
      description: '',
      images: [],
      owner: '',
      price: 0,
      size: '',
      subCategoryId: '',
      title: '');

  toJson() {
    return {
      'Brand': brand,
      'CO2': co2,
      'CategoryId': categoryId,
      'Condition': condition,
      'Description': description,
      'Images': images,
      'Likes': likes,
      'Owner': owner,
      'Price': price,
      'Size': size,
      'SubCategoryId': subCategoryId,
      'Title': title
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        brand: data['Brand'] ?? '',
        co2: double.parse((data['CO2'] ?? 0.0).toString()),
        categoryId: data['CategoryId'] ?? '',
        condition: data['Condition'] ?? '',
        description: data['Description'] ?? '',
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        likes: data['Likes'] ?? 0,
        owner: data['Owner'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()),
        size: data['Size'] ?? '',
        subCategoryId: data['SubCategoryId'] ?? '',
        title: data['Title'] ?? '');
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
        id: document.id,
        brand: data['Brand'] ?? '',
        co2: double.parse((data['CO2'] ?? 0.0).toString()),
        categoryId: data['CategoryId'] ?? '',
        condition: data['Condition'] ?? '',
        description: data['Description'] ?? '',
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        likes: data['Likes'] ?? 0,
        owner: data['Owner'] ?? '',
        price: double.parse((data['Price'] ?? 0.0).toString()),
        size: data['Size'] ?? '',
        subCategoryId: data['SubCategoryId'] ?? '',
        title: data['Title'] ?? '');
  }
}
