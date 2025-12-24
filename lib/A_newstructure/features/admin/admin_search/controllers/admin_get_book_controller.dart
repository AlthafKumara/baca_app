import 'package:baca_app/A_newstructure/features/user/user_search/repositories/get_all_book_review_repository.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:baca_app/A_newstructure/shared/models/book_review_model.dart';
import 'package:baca_app/A_newstructure/shared/repositories/get_all_book_repository.dart';
import 'package:get/get.dart';

class AdminGetBookController extends GetxController
    with StateMixin<List<BookModel>> {
  final bookServices = GetAllBookRepository();
  final reviewServices = GetAllBookReviewRepository();

  var isSearched = false.obs;
  List<BookModel> _allBooks = [];
  final Map<int, double> _avgRatings = {};

  @override
  void onInit() {
    super.onInit();
    _loadBooksWithRatings();
  }

  Future<void> _loadBooksWithRatings() async {
    change(null, status: RxStatus.loading());

    try {
      final books = await bookServices.getBook();
      final reviews = await reviewServices.getAllBookRatings();

      _calculateAvgRatings(reviews);

      for (final book in books) {
        book.avgratings = _avgRatings[book.id] ?? 0;
      }

      _allBooks = books;
      change(books, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void _calculateAvgRatings(List<BookReview> reviews) {
    final Map<int, List<int>> ratingMap = {};

    for (final review in reviews) {
      ratingMap.putIfAbsent(review.bookId, () => []);
      ratingMap[review.bookId]!.add(review.rating);
    }

    ratingMap.forEach((bookId, ratings) {
      final avg = ratings.reduce((a, b) => a + b) / ratings.length;
      _avgRatings[bookId] = double.parse(avg.toStringAsFixed(1));
    });
  }

  void filterBooks(String keyword) {
    if (keyword.isEmpty) {
      isSearched.value = false;
      change(_allBooks, status: RxStatus.success());
      return;
    }

    isSearched.value = true;
    final lower = keyword.toLowerCase();

    final filtered = _allBooks.where((book) {
      return book.title.toLowerCase().contains(lower) ||
          book.author.toLowerCase().contains(lower);
    }).toList();

    change(filtered, status: RxStatus.success());
  }
}
