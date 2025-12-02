class Community {
  final int id;
  final String userId;
  final int? parentId;
  final int bookId;
  final String messageText;
  final DateTime createdAt;

  Community({
    required this.id,
    required this.userId,
    this.parentId,
    required this.bookId,
    required this.messageText,
    required this.createdAt,
  });

  factory Community.fromMap(Map<String, dynamic> map) {
    return Community(
      id: map['id'],
      userId: map['user_id'],
      parentId: map['parent_id'],
      bookId: map['book_id'],
      messageText: map['message_text'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'parent_id': parentId,
      'book_id': bookId,
      'message_text': messageText,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
