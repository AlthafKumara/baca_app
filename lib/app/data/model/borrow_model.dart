enum Status{pending,onBorrow, returned,rejected}

class Borrow {
  final int id;
  final String userId;
  final int bookId;
  final Status status;
  final DateTime borrowDate;
  final DateTime returnDate;
  final DateTime createdAt;
  final String qrText;
  final bool isReviewed;

  Borrow({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.status,
    required this.borrowDate,
    required this.returnDate,
    required this.createdAt,
    required this.qrText,
    required this.isReviewed,
  });

  factory Borrow.fromMap(Map<String, dynamic> map) {
    return Borrow(
      id: map['id'],
      userId: map['user_id'],
      bookId: map['book_id'],
      status: map['status'],
      borrowDate: DateTime.parse(map['borrow_date']),
      returnDate: DateTime.parse(map['return_date']),
      createdAt: DateTime.parse(map['created_at']),
      qrText: map['qr_text'],
      isReviewed: map['is_reviewed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'book_id': bookId,
      'status': status,
      'borrow_date': borrowDate.toIso8601String(),
      'return_date': returnDate.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'qr_text': qrText,
      'is_reviewed': isReviewed,
    };
  }
}
