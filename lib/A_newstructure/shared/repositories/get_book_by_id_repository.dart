import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/book_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetBookByIdRepository {
  final supabase = Supabase.instance.client;
  Future<List<BookModel>> getBookById(List<int> ids) async {
    final book = await supabase
        .from(ApiConstant.BOOK)
        .select()
        .inFilter('id', ids);

    return book.map((e) => BookModel.fromMap(e)).toList();
  }
}
