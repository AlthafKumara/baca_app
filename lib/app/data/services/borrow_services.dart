import 'package:baca_app/app/data/model/borrow_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BorrowServices {
  final supabase = Supabase.instance.client;

  Future<void> createBorrow({
    required String userId,
    required int bookId,
  }) async {
    try {
      final response = await supabase
          .from("borrow")
          .insert({
            "user_id": userId,
            "book_id": bookId,
            "status": "pending",
            "created_at": DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      final borrowId = response["id"];
      final qrText = "BORROW-$borrowId-$userId-$bookId";

      await supabase
          .from("borrow")
          .update({"qr_text": qrText})
          .eq("id", borrowId);
    } catch (e) {
      throw "Failed to create borrow: $e";
    }
  }

  Future<List<Borrow>> getBookBorrow() async {
    try {
      print("Fungsii dijalankan");
      final borrow = await supabase.from("borrow").select();

      final borrowlist = borrow.map((e) => Borrow.fromMap(e)).toList();
      return borrowlist;
    } catch (e) {
      print(e);
      throw "Failed to get book borrow: $e";
    }
  }

  Future<List<Borrow>> getBookBorrowByUser(String userId) async {
    try {
      final borrow = await supabase
          .from("borrow")
          .select()
          .eq("user_id", userId);

      final borrowlist = borrow.map((e) => Borrow.fromMap(e)).toList();
      return borrowlist;
    } catch (e) {
      throw "Failed to get book borrow: $e";
    }
  }

  Future<void> getBookBorrowByBook(int bookId) async {
    try {
      final response = await supabase
          .from("borrow")
          .select()
          .eq("book_id", bookId);
    } catch (e) {
      throw "Failed to get stock book borrow: $e";
    }
  }
}
