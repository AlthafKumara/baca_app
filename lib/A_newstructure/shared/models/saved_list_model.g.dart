// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedListModel _$SavedListModelFromJson(Map<String, dynamic> json) =>
    _SavedListModel(
      id: (json['id'] as num?)?.toInt(),
      bookId: (json['book_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      listName: json['list_name'] as String?,
      createdAt: json['created_at'] as String?,
      books: _bookModelFromJson(json['books']),
    );

Map<String, dynamic> _$SavedListModelToJson(_SavedListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'book_id': instance.bookId,
      'user_id': instance.userId,
      'list_name': instance.listName,
      'created_at': instance.createdAt,
      'books': _bookModelToJson(instance.books),
    };
