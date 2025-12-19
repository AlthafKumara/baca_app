import 'package:baca_app/A_laststructure/app/data/model/borrow_model.dart';
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
            "status": "Pending",
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
      print(e);
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

  Future<Borrow> getBookBorrowById(int borrowid) async {
    try {
      final borrow = await supabase
          .from("borrow")
          .select('*, book(*)')
          .eq("id", borrowid)
          .single();

      return Borrow.fromMap(borrow);
    } catch (e) {
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
      await supabase.from("borrow").update(data).eq("id", borrowId);
    } catch (e) {
      throw "Failed to update borrow status: $e";
    }
  }

  Future<void> updateBorrowReview({required int borrowId}) async {
    try {
      await supabase
          .from("borrow")
          .update({"is_reviewed": true})
          .eq("id", borrowId);
    } catch (e) {
      throw "Failed to update borrow status: $e";
    }
  }
}
