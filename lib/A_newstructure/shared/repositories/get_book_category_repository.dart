import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/book_category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetBookCategoryRepository {
  final supabase = Supabase.instance.client;
  Future<List<BookCategoryModel>> getCategoryBook() async {
    final category = await supabase.from(ApiConstant.BOOK_CATEGORY).select();

    final categoryList = category
        .map((e) => BookCategoryModel.fromMap(e))
        .toList();
    return categoryList;
  }

  Future<BookCategoryModel> getCategoryBookById(int id) async {
    final category = await supabase
        .from(ApiConstant.BOOK_CATEGORY)
        .select()
        .eq('id', id)
        .maybeSingle();
    return BookCategoryModel.fromMap(category!);
  }
}
