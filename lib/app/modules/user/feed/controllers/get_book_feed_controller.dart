import 'package:baca_app/app/data/model/book_model.dart';
import 'package:baca_app/app/data/services/book_services.dart';
import 'package:baca_app/app/data/services/review_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBookFeedController extends GetxController with StateMixin<List<Book>> {
  final bookServices = BookServices();
  final reviewServices = ReviewServices();
  final Rxn<int> selectedBookId = Rxn<int>();

  final searchController = TextEditingController();

  var isSearched = false.obs;
  List<Book> _allBooks = [];

  @override
  void onInit() {
    super.onInit();
    _loadBooks();
    searchController.addListener(searchChanged);
  }

  void selectBook(int bookId) {
    selectedBookId.value = bookId;
  }

  void toggleBook(int bookId) {
    if (selectedBookId.value == bookId) {
      selectedBookId.value = null; // unselect
    } else {
      selectedBookId.value = bookId; // select
    }
  }

  void clearSelectedBook() {
    selectedBookId.value = null;
  }

  Future<void> _loadBooks() async {
    change(null, status: RxStatus.loading());

    try {
      final books = await bookServices.getBook();

      _allBooks = books;

      final keyword = searchController.text.trim();
      if (keyword.isNotEmpty) {
        filterBooks(keyword);
      } else {
        change(books, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Book? getBookById(int bookId) {
    try {
      return _allBooks.firstWhere((book) => book.id == bookId);
    } catch (e) {
      return null;
    }
  }

  void searchChanged() {
    filterBooks(searchController.text.trim());
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

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
