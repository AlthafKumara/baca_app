import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetBookBorrowByUserRepository {
  final supabase = Supabase.instance.client;
  Future<List<BorrowModel>> getBookBorrowByUser(String userId) async {
    try {
      final borrow = await supabase
          .from("borrow")
          .select()
          .eq("user_id", userId);

      final borrowlist = borrow.map((e) => BorrowModel.fromMap(e)).toList();
      return borrowlist;
    } catch (e) {
      throw "Failed to get book borrow: $e";
    }
  }
}
