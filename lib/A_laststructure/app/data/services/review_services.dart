import 'package:baca_app/A_laststructure/app/data/model/book_review.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReviewServices {
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
      final review = await supabase.from('book_review').insert(data);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<BookReview>> getReview(int bookId) async {
    try {
      final review = await supabase
          .from('book_review')
          .select()
          .eq('book_id', bookId)
          .order('created_at', ascending: false);
      return review.map((e) => BookReview.fromMap(e)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

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
