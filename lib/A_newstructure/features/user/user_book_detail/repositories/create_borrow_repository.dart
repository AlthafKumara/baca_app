import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateBorrowRepository {
  final supabase = Supabase.instance.client;
  Future<void> createBorrow({
    required String userId,
    required int bookId,
  }) async {
    try {
      final response = await supabase
          .from(ApiConstant.BORROW)
          .insert({
            "user_id": userId,
            "book_id": bookId,
            "status": "Pending",
            "created_at": DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      final borrowId = response["id"];
      final qrText = "BORROW-$borrowId-$userId-$bookId";

      await supabase
          .from("borrow")
          .update({"qr_text": qrText})
          .eq("id", borrowId);
    } catch (e) {
      print(e);
      throw "Failed to create borrow: $e";
    }
  }
}
