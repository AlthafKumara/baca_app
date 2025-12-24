import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/borrow_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetBorrowByIdRepository {
  final supabase = Supabase.instance.client;
  Future<BorrowModel> getBookBorrowById(int borrowid) async {
    try {
      final borrow = await supabase
          .from(ApiConstant.BORROW)
          .select('*, book(*)')
          .eq("id", borrowid)
          .single();

      return BorrowModel.fromMap(borrow);
    } catch (e) {
      throw "Failed to get book borrow: $e";
    }
  }
}
