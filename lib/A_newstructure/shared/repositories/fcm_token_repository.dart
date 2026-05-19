import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FCMTokenRepository {
  final supabase = Supabase.instance.client;

  // Simpan atau update token saat user login
  Future<void> saveToken(String userId) async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null) return;

    await supabase.from('fcm_tokens').upsert(
      {
        'user_id': userId,
        'fcm_token': token,
        'created_at': DateTime.now().toIso8601String(),
      },
      onConflict: 'fcm_token', // kalau sudah ada, update saja
    );
  }

  // Hapus token saat user logout
  // supaya user yang sudah logout tidak terima notifikasi
  Future<void> removeToken(String userId) async {
    await supabase.from('fcm_tokens').delete().eq('user_id', userId);
  }
}
