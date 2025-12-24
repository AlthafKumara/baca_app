import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateBorrowRepository {
  final supabase = Supabase.instance.client;

  Future<void> updateBorrowStatus({
    required int borrowId,
    required String status,
    DateTime? borrowDate,
    DateTime? returnDate,
  }) async {
    final data = {"status": status};

    if (borrowDate != null) {
      data["borrow_date"] = borrowDate.toIso8601String();
    }

    if (returnDate != null) {
      data["return_date"] = returnDate.toIso8601String();
    }
    try {
      await supabase.from(ApiConstant.BORROW).update(data).eq("id", borrowId);
    } catch (e) {
      throw "Failed to update borrow status: $e";
    }
  }
}
