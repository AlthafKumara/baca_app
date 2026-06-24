// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedListModel {

 int? get id;@JsonKey(name: 'book_id') int? get bookId;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'list_name') String? get listName;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson) BookModel? get books;
/// Create a copy of SavedListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedListModelCopyWith<SavedListModel> get copyWith => _$SavedListModelCopyWithImpl<SavedListModel>(this as SavedListModel, _$identity);

  /// Serializes this SavedListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.listName, listName) || other.listName == listName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.books, books) || other.books == books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,userId,listName,createdAt,books);

@override
String toString() {
  return 'SavedListModel(id: $id, bookId: $bookId, userId: $userId, listName: $listName, createdAt: $createdAt, books: $books)';
}


}

/// @nodoc
abstract mixin class $SavedListModelCopyWith<$Res>  {
  factory $SavedListModelCopyWith(SavedListModel value, $Res Function(SavedListModel) _then) = _$SavedListModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'book_id') int? bookId,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'list_name') String? listName,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson) BookModel? books
});




}
/// @nodoc
class _$SavedListModelCopyWithImpl<$Res>
    implements $SavedListModelCopyWith<$Res> {
  _$SavedListModelCopyWithImpl(this._self, this._then);

  final SavedListModel _self;
  final $Res Function(SavedListModel) _then;

/// Create a copy of SavedListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? bookId = freezed,Object? userId = freezed,Object? listName = freezed,Object? createdAt = freezed,Object? books = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,listName: freezed == listName ? _self.listName : listName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,books: freezed == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as BookModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedListModel].
extension SavedListModelPatterns on SavedListModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedListModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedListModel value)  $default,){
final _that = this;
switch (_that) {
case _SavedListModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedListModel value)?  $default,){
final _that = this;
switch (_that) {
case _SavedListModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'book_id')  int? bookId, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'list_name')  String? listName, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson)  BookModel? books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedListModel() when $default != null:
return $default(_that.id,_that.bookId,_that.userId,_that.listName,_that.createdAt,_that.books);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'book_id')  int? bookId, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'list_name')  String? listName, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson)  BookModel? books)  $default,) {final _that = this;
switch (_that) {
case _SavedListModel():
return $default(_that.id,_that.bookId,_that.userId,_that.listName,_that.createdAt,_that.books);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'book_id')  int? bookId, @JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'list_name')  String? listName, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson)  BookModel? books)?  $default,) {final _that = this;
switch (_that) {
case _SavedListModel() when $default != null:
return $default(_that.id,_that.bookId,_that.userId,_that.listName,_that.createdAt,_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedListModel implements SavedListModel {
   _SavedListModel({this.id, @JsonKey(name: 'book_id') this.bookId, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'list_name') this.listName, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson) this.books});
  factory _SavedListModel.fromJson(Map<String, dynamic> json) => _$SavedListModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'book_id') final  int? bookId;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'list_name') final  String? listName;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson) final  BookModel? books;

/// Create a copy of SavedListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedListModelCopyWith<_SavedListModel> get copyWith => __$SavedListModelCopyWithImpl<_SavedListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.listName, listName) || other.listName == listName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.books, books) || other.books == books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bookId,userId,listName,createdAt,books);

@override
String toString() {
  return 'SavedListModel(id: $id, bookId: $bookId, userId: $userId, listName: $listName, createdAt: $createdAt, books: $books)';
}


}

/// @nodoc
abstract mixin class _$SavedListModelCopyWith<$Res> implements $SavedListModelCopyWith<$Res> {
  factory _$SavedListModelCopyWith(_SavedListModel value, $Res Function(_SavedListModel) _then) = __$SavedListModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'book_id') int? bookId,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'list_name') String? listName,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(fromJson: _bookModelFromJson, toJson: _bookModelToJson) BookModel? books
});




}
/// @nodoc
class __$SavedListModelCopyWithImpl<$Res>
    implements _$SavedListModelCopyWith<$Res> {
  __$SavedListModelCopyWithImpl(this._self, this._then);

  final _SavedListModel _self;
  final $Res Function(_SavedListModel) _then;

/// Create a copy of SavedListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? bookId = freezed,Object? userId = freezed,Object? listName = freezed,Object? createdAt = freezed,Object? books = freezed,}) {
  return _then(_SavedListModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,bookId: freezed == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,listName: freezed == listName ? _self.listName : listName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,books: freezed == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as BookModel?,
  ));
}


}

// dart format on
