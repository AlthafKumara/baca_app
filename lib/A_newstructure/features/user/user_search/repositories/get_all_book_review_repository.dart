import 'package:baca_app/A_newstructure/shared/models/book_review_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetAllBookReviewRepository {
  final supabase = Supabase.instance.client;
  Future<List<BookReview>> getAllBookRatings() async {
    final data = await supabase.from('book_review').select('book_id, rating');

    return data.map<BookReview>((e) {
      return BookReview(
        id: 0,
        userId: '',
        bookId: e['book_id'],
        reviewText: '',
        rating: e['rating'],
        createdAt: DateTime.now(),
      );
    }).toList();
  }
}
