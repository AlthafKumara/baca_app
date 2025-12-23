import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/saved_list_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetSavedListRepository {
  final supabase = Supabase.instance.client;

  Future<List<SavedListModel>> getSavedList(String userId) async {
    try {
      final saved = await supabase
          .from(ApiConstant.SAVED_LIST_BOOK)
          .select()
          .eq('user_id', userId);

      final savedList = saved.map((e) => SavedListModel.fromMap(e)).toList();
      return savedList;
    } catch (e) {
      throw "Failed to get saved list: $e";
    }
  }
}
