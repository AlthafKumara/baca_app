import 'package:baca_app/A_newstructure/shared/models/book_category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetCategoryBookRepository {
  final supabase = Supabase.instance.client;
  Future<BookCategoryModel> getCategoryBookById(int id) async {
    final category = await supabase
        .from('book_category')
        .select()
        .eq('id', id)
        .maybeSingle();
    return BookCategoryModel.fromMap(category!);
  }
}
