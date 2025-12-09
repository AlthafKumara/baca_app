import 'package:baca_app/app/data/model/book_category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookCategoryServices {
  final supabase = Supabase.instance.client;

  Future<List<BookCategory>> getCategoryBook() async {
    final category = await supabase.from('book_category').select();

    final categoryList = category.map((e) => BookCategory.fromMap(e)).toList();
    return categoryList;
  }

  Future<BookCategory> getCategoryBookById(int id) async {
    final category = await supabase
        .from('book_category')
        .select()
        .eq('id', id)
        .maybeSingle();
    return BookCategory.fromMap(category!);
  }
}
