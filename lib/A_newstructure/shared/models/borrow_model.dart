import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/utils/enums/enum_helper.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';

class BorrowModel {
  final int id;
  final String userId;
  final int bookId;
  final Status status;
  DateTime? borrowDate;
  DateTime? returnDate;
  final DateTime createdAt;
  final String qrText;
  final bool isReviewed;
  BookModel? book;

  BorrowModel({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.status,
    this.borrowDate,
    this.returnDate,
    required this.createdAt,
    required this.qrText,
    required this.isReviewed,
    this.book,
  });

  factory BorrowModel.fromMap(Map<String, dynamic> map) {
    return BorrowModel(
      id: map['id'],
      userId: map['user_id'],
      bookId: map['book_id'],
      status: parseStatus(map['status']),
      borrowDate: map['borrow_date'] != null
          ? DateTime.parse(map['borrow_date'])
          : null,

      returnDate: map['return_date'] != null
          ? DateTime.parse(map['return_date'])
          : null,

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
      'borrow_date': borrowDate?.toIso8601String(),
      'return_date': returnDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'qr_text': qrText,
      'is_reviewed': isReviewed,
    };
  }
}
