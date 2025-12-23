import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddBookList {
  final supabase = Supabase.instance.client;

  Future<void> addBookList({required int listId, required int bookId}) async {
    try {
      await supabase
          .from(ApiConstant.SAVED_LIST_BOOK)
          .update({"book_id": bookId})
          .eq("id", listId);
    } catch (e) {
      throw "Failed to add book to saved list: $e";
    }
  }
}
