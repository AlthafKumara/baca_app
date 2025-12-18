import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/model/profiles_model.dart';

class Community {
  final int id;
  final String userId;
  final int? parentId;
  final int? bookId;
  final String messageText;
  final DateTime createdAt;
  Profile? profile;
  Book? book;
  List<Community> replies;

  Community({
    required this.id,
    required this.userId,
    this.parentId,
    this.bookId,
    required this.messageText,
    required this.createdAt,
    this.profile,
    this.book,
    List<Community>? replies,
  }) : replies = replies ?? [];

  factory Community.fromMap(Map<String, dynamic> map) {
    final raw = map['created_at'];

    final parsedUtc = DateTime.parse(raw);

    final fixedLocal = DateTime(
      parsedUtc.year,
      parsedUtc.month,
      parsedUtc.day,
      parsedUtc.hour,
      parsedUtc.minute,
      parsedUtc.second,
      parsedUtc.millisecond,
      parsedUtc.microsecond,
    );

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
