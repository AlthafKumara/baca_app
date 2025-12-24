import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateBorrowReviewRepository {
  final supabase = Supabase.instance.client;

  Future<void> updateBorrowReview({required int borrowId}) async {
    try {
      await supabase
          .from(ApiConstant.BOOK_REVIEW)
          .update({"is_reviewed": true})
          .eq("id", borrowId);
    } catch (e) {
      throw "Failed to update borrow status: $e";
    }
  }
}
