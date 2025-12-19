import 'package:baca_app/A_laststructure/app/data/model/book_review.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final String description;
  final int stock;
  final String coverUrl;
  final DateTime createdAt;
  final int category;
  final String name_category;
  double? avgratings;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.stock,
    required this.coverUrl,
    required this.createdAt,
    required this.category,
    required this.name_category,
    this.avgratings = 0.0,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      description: map['description'],
      stock: map['stock'],
      coverUrl: map['cover_url'],
      createdAt: DateTime.parse(map['created_at']),
      category: map['category'],
      name_category: map['name_category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'stock': stock,
      'cover_url': coverUrl,
      'created_at': createdAt.toIso8601String(),
      'category': category,
      'name_category': name_category,
    };
  }
}
