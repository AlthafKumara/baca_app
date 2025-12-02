class BookReview {
  final int id;
  final String userId;
  final int bookId;
  final String reviewText;
  final int rating;
  final DateTime createdAt;

  BookReview({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.reviewText,
    required this.rating,
    required this.createdAt,
  });

  factory BookReview.fromMap(Map<String, dynamic> map) {
    return BookReview(
      id: map['id'],
      userId: map['user_id'],
      bookId: map['book_id'],
      reviewText: map['review_text'],
      rating: map['rating'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'book_id': bookId,
      'review_text': reviewText,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
