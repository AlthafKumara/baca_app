import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';

part 'saved_list_model.freezed.dart';
part 'saved_list_model.g.dart';

BookModel? _bookModelFromJson(dynamic json) {
  if (json == null) return null;
  if (json is Map<String, dynamic>) return BookModel.fromMap(json);
  return null;
}

dynamic _bookModelToJson(BookModel? book) => book?.toMap();

@freezed
abstract class SavedListModel with _$SavedListModel {
  factory SavedListModel({
    int? id,
    @JsonKey(name: 'book_id') int? bookId,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'list_name') String? listName,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson)
    BookModel? books,
  }) = _SavedListModel;

  factory SavedListModel.fromJson(Map<String, dynamic> json) =>
      _$SavedListModelFromJson(json);
}
