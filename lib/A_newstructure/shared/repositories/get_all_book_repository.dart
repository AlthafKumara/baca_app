import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetAllBookRepository {
  final supabase = Supabase.instance.client;

  Future<List<BookModel>> getBook() async {
    final book = await supabase.from('book').select();

    final bookList = book.map((e) => BookModel.fromMap(e)).toList();

    return bookList;
  }
}
