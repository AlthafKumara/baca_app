import 'package:baca_app/app/data/model/community_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommunnityServices {
  final supabase = Supabase.instance.client;

  Future<void> createMessage({
    required String userId,
    int? bookId,
    String? messageText,
  }) async {
    try {
      final data = {
        'user_id': userId,
        'message_text': messageText,
        'created_at': DateTime.now().toIso8601String(),
        if (bookId != null) 'book_id': bookId,
      };
      await supabase.from('community').insert(data).select().single();
    } catch (e) {
      throw "Failed to create message: $e";
    }
  }

  Future<void> replyMessage({
    required int parentId,
    required String userId,
    required String messageText,
    int? bookId,
  }) async {
    try {
      final data = {
        'parent_id': parentId,
        'user_id': userId,
        'message_text': messageText,
        'created_at': DateTime.now().toIso8601String(),
        if (bookId != null) 'book_id': bookId,
      };
      await supabase.from('community').insert(data).select().single();
    } catch (e) {
      throw "Failed to reply message: $e";
    }
  }

  Future<List<Community>> getCommunity() async {
    try {
      final community = await supabase.from('community').select();
      return community.map((e) => Community.fromMap(e)).toList();
    } catch (e) {
      throw "Failed to get community: $e";
    }
  }
}
