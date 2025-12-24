import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetAllBorrowRepository {
  final supabase = Supabase.instance.client;

  Future<List<BorrowModel>> getBookBorrow() async {
    try {
      final borrow = await supabase.from(ApiConstant.BORROW).select();

      final borrowlist = borrow.map((e) => BorrowModel.fromMap(e)).toList();
      return borrowlist;
    } catch (e) {
      print(e);
      throw "Failed to get book borrow: $e";
    }
  }
}
