import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddReviewRepository {
  final supabase = Supabase.instance.client;

  Future<void> createReview({
    required String userId,
    required int bookId,
    String? text,
    required int rating,
  }) async {
    try {
      final data = {
        'user_id': userId,
        'book_id': bookId,
        'review_text': text ?? '',
        'rating': rating,
      };
      final review = await supabase.from(ApiConstant.BOOK_REVIEW).insert(data);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
