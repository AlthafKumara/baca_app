import 'package:baca_app/A_newstructure/shared/models/book_model.dart';

class SavedListModel {
  final int? id;
  final int? bookId;
  final String? userId;
  final String? listName;
  final String? createdAt;
  BookModel? books;

  SavedListModel({
    this.id,
    this.bookId,
    this.userId,
    this.createdAt,
    this.listName,
    this.books,
  });

  factory SavedListModel.fromMap(Map<String, dynamic> map) => SavedListModel(
    id: map['id'],
    bookId: map['book_id'],
    userId: map['user_id'],
    listName: map['list_name'],
    createdAt: map['created_at'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'book_id': bookId,
    'user_id': userId,
    'list_name': listName,
    'created_at': createdAt,
  };
}
