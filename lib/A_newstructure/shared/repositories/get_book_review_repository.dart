import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/book_review_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetBookReviewRepository {
  final supabase = Supabase.instance.client;

  Future<List<BookReview>> getReview(int bookId) async {
    try {
      final review = await supabase
          .from(ApiConstant.BOOK_REVIEW)
          .select()
          .eq('book_id', bookId)
          .order('created_at', ascending: false);
      return review.map((e) => BookReview.fromMap(e)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
