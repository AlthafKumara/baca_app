import 'package:baca_app/A_laststructure/app/data/model/saved_list_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SavedListServices {
  final supabase = Supabase.instance.client;

  Future<void> createSavedList({
    required String userId,
    required String listname,
  }) async {
    try {
      final response = await supabase.from("saved_list_book").insert({
        "user_id": userId,
        "list_name": listname,
      });
    } catch (e) {
      throw "Failed to create saved list: $e";
    }
  }

  Future<List<SavedListModel>> getSavedList(String userId) async {
    try {
      final saved = await supabase
          .from('saved_list_book')
          .select()
          .eq('user_id', userId);

      final savedList = saved.map((e) => SavedListModel.fromMap(e)).toList();
      return savedList;
    } catch (e) {
      throw "Failed to get saved list: $e";
    }
  }

  Future<void> addBookList({required int listId, required int bookId}) async {
    try {
      await supabase
          .from("saved_list_book")
          .update({"book_id": bookId})
          .eq("id", listId);
    } catch (e) {
      throw "Failed to add book to saved list: $e";
    }
  }

  Future<void> deleteBookList({required int listId}) async {
    try {
      await supabase.from("saved_list_book").delete().eq("id", listId);
    } catch (e) {
      throw "Failed to delete saved list: $e";
    }
  }
}
