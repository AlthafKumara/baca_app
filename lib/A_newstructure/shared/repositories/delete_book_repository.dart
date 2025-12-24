import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteBookRepository {
  final supabase = Supabase.instance.client;

  Future<void> deleteListBook(List<int> bookIds) async {
    try {
      await supabase.from(ApiConstant.BOOK).delete().inFilter('id', bookIds);
    } catch (e) {
      throw "Failed to delete book: $e";
    }
  }
}
