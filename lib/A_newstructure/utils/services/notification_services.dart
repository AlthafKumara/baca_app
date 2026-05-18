import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

// navigatorKey = "remote control" Navigator dari luar widget tree
// Deklarasi di sini agar bisa diakses dari mana saja
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  // Channel Android — wajib ada, ini "jalur" notifikasi di Android
  // Setiap channel bisa punya pengaturan suara/vibrate sendiri
  static const _androidChannel = AndroidNotificationChannel(
    'notification_baca', // id channel — harus unik
    'Notifikasi Baca App', // nama yang tampil di pengaturan HP
    description: 'Notifikasi aktivitas peminjaman buku dan konten lainnya',
    importance: Importance.high,
  );

  static Future<void> init() async {
    // Minta izin notifikasi ke user (wajib di iOS, recommended di Android 13+)
    await FirebaseMessaging.instance.requestPermission();

    // Daftarkan channel di Android
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    // Inisialisasi plugin local notification
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      // Dipanggil otomatis saat user tap notifikasi (app foreground/background)
      onDidReceiveNotificationResponse: _onTap,
      // Dipanggil otomatis saat user tap notifikasi (app terminated)
      onDidReceiveBackgroundNotificationResponse: _onTap,
    );

    // Pasang listener FCM foreground
    // "listen" = pasang telinga, Firebase yang akan memanggilnya saat ada pesan
    FirebaseMessaging.onMessage.listen(_showFromFCM);
  }

  // Dipanggil otomatis oleh Firebase saat pesan FCM masuk dan app sedang terbuka
  static Future<void> showFromFCM(RemoteMessage message) async {
    await _plugin.show(
      id: message.hashCode,
      title: message.notification?.title, // title dari Edge Function
      body: message.notification?.body, // body dari Edge Function
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      // payload = "surat pengantar" berisi data untuk routing
      // disimpan sebagai JSON string karena hanya bisa String
      payload: jsonEncode(message.data),
    );
  }

  // Internal alias untuk listener
  static Future<void> _showFromFCM(RemoteMessage message) =>
      showFromFCM(message);

  // Dipanggil otomatis saat user tap notifikasi
  static void _onTap(NotificationResponse response) {
    if (response.payload == null) return;

    // Kembalikan JSON string ke bentuk Map
    final data = jsonDecode(response.payload!) as Map<String, dynamic>;
    _navigateByType(data);
  }

  // Routing berdasarkan type yang ada di payload
  static void _navigateByType(Map<String, dynamic> data) {
    final type = data['type'] as String?;

    switch (type) {
      case 'general':
        navigatorKey.currentState?.pushNamed(
          '/borrow-detail',
          arguments: data['borrow_id'],
        );
        break;
      case 'return_request':
        navigatorKey.currentState?.pushNamed(
          '/return-detail',
          arguments: data['borrow_id'],
        );
        break;
      case 'borrow_status':
        navigatorKey.currentState?.pushNamed(
          '/borrow-detail',
          arguments: data['borrow_id'],
        );
        break;
      // tambah case lain sesuai kebutuhan
    }
  }
}

// WAJIB top-level function (di luar class) untuk handle background
// Dipanggil otomatis oleh Firebase saat app di-background atau terminated
@pragma('vm:entry-point')
Future<void> onFCMBackground(RemoteMessage message) async {
  // Harus init Firebase lagi karena berjalan di isolate terpisah
  // Isolate = proses terpisah yang tidak berbagi memori dengan app utama
  await Firebase.initializeApp();
  await NotificationService.showFromFCM(message);
}
