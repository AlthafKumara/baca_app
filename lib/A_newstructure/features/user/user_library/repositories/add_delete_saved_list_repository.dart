import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddDeleteSavedListRepository {
  final supabase = Supabase.instance.client;

  Future<void> createSavedList({
    required String userId,
    required String listname,
  }) async {
    try {
      final response = await supabase.from(ApiConstant.SAVED_LIST_BOOK).insert({
        "user_id": userId,
        "list_name": listname,
      });
    } catch (e) {
      throw "Failed to create saved list: $e";
    }
  }

  Future<void> deleteBookList({required int listId}) async {
    try {
      await supabase
          .from(ApiConstant.SAVED_LIST_BOOK)
          .delete()
          .eq("id", listId);
    } catch (e) {
      throw "Failed to delete saved list: $e";
    }
  }
}
