import 'dart:convert';

import 'package:ecommerce/models/category.dart';

class Product {
  int? id;
  String? productName;
  String? authorName;
  String? description;
  double? price;
  int? stock;
  String? imageUrl;
  int? numberOfPages;
  int? numberOfSales;
  String? publisher;
  String? language;
  int? publishedDate;
  DateTime? createdAt;
  int? numberOfReviews;
  double? averageRating;
  List<Category>? categories;
  bool? available;
  String? isbn;

  Product({
    this.id,
    this.productName,
    this.authorName,
    this.description,
    this.price,
    this.stock,
    this.imageUrl,
    this.numberOfPages,
    this.numberOfSales,
    this.publisher,
    this.language,
    this.publishedDate,
    this.createdAt,
    this.numberOfReviews,
    this.averageRating,
    this.categories,
    this.available,
    this.isbn,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    productName: json["productName"],
    authorName: json["authorName"],
    description: json["description"],
    price: json["price"],
    stock: json["stock"],
    imageUrl: json["imageUrl"],
    numberOfPages: json["numberOfPages"],
    numberOfSales: json["numberOfSales"],
    publisher: json["publisher"],
    language: json["language"],
    publishedDate: json["publishedDate"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    numberOfReviews: json["numberOfReviews"],
    averageRating: json["averageRating"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromMap(x))),
    available: json["available"],
    isbn: json["isbn"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "productName": productName,
    "authorName": authorName,
    "description": description,
    "price": price,
    "stock": stock,
    "imageUrl": imageUrl,
    "numberOfPages": numberOfPages,
    "numberOfSales": numberOfSales,
    "publisher": publisher,
    "language": language,
    "publishedDate": publishedDate,
    "createdAt": createdAt?.toIso8601String(),
    "numberOfReviews": numberOfReviews,
    "averageRating": averageRating,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toMap())),
    "available": available,
    "isbn": isbn,
  };
}

