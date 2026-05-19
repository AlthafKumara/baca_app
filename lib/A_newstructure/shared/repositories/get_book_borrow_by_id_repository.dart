import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetBookBorrowByIdRepository {
  final supabase = Supabase.instance.client;
  Future<BorrowModel> getBookBorrowById(int id) async {
    try {
      final borrow = await supabase
          .from(ApiConstant.BORROW)
          .select()
          .eq("id", id);

      return BorrowModel.fromMap(borrow.first);
    } catch (e) {
      print(e);
      throw "Failed to get book borrow: $e";
    }
  }
}
