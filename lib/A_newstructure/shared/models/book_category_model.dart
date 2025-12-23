class BookCategoryModel {
  final int id;
  final String categoryName;
  final DateTime createdAt;

  BookCategoryModel({
    required this.id,
    required this.categoryName,
    required this.createdAt,
  });

  factory BookCategoryModel.fromMap(Map<String, dynamic> map) {
    return BookCategoryModel(
      id: map['id'],
      categoryName: map['category_name'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_name': categoryName,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
