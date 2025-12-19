class BookCategory {
  final int id;
  final String categoryName;
  final DateTime createdAt;

  BookCategory({
    required this.id,
    required this.categoryName,
    required this.createdAt,
  });

  factory BookCategory.fromMap(Map<String, dynamic> map) {
    return BookCategory(
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
