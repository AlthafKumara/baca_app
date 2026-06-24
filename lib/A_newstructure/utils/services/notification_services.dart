import 'dart:convert';
import 'dart:developer';
import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/admin/admin_library/controllers/get_book_borrow_by_id_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Map<String, dynamic>? pendingNotificationData;


  // Channel Android — wajib ada, ini "jalur" notifikasi di Android
  // Setiap channel bisa punya pengaturan suara/vibrate sendiri
  static const _androidChannel = AndroidNotificationChannel(
    'notification_baca', 
    'Notifikasi Baca App', 
    description: 'Notifikasi aktivitas peminjaman buku dan konten lainnya',
    importance: Importance.high,
  );

  static Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission();

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: _onTap,
      onDidReceiveBackgroundNotificationResponse: _onTap,
    );

    FirebaseMessaging.onMessage.listen(_showFromFCM);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      navigateByType(message.data);
    });
  }

  // Dipanggil otomatis oleh Firebase saat pesan FCM masuk dan app sedang terbuka
  static Future<void> showFromFCM(RemoteMessage message) async {
    final logPayload = {
      'message': {
        'notification': {
          'title': message.notification?.title ?? '-',
          'body': message.notification?.body ?? '-',
        },
        'data': message.data,
      },
    };

    log('=== FCM PAYLOAD RUNNING FOREGROUND ===');
    log(const JsonEncoder.withIndent('  ').convert(logPayload));
    log('===================');

    await _plugin.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
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
    navigateByType(data);
  }

  // Routing berdasarkan type yang ada di payload
  static Future<void> navigateByType(Map<String, dynamic> data) async {
    final type = data['type'] as String?;
    final borrowId = int.tryParse(data['borrow_id']?.toString() ?? '0');

    if (type == "general") {
      if (borrowId != null) {
        try {
          // Fetch data
          final controller = GetBookBorrowByIdController(borrowId: borrowId);
          await controller.getBookBorrowed();
          Get.back();

          Get.toNamed(
            Routes.ADMIN_BOOK_BORROW_DETAIL,
            arguments: {
              'borrow': controller.borrowData.value,
              'status': controller.borrowStatus.value,
            },
          );
        } catch (e) {
          Get.back();
          debugPrint('Error fetch borrow: $e');
        }
      }
    } else if (type == "community") {
      Get.toNamed(Routes.NOTIFICATION);
    } else if (type == "borrow_status") {
      if (borrowId != null) {
        Get.toNamed(Routes.USER_BOOK_BORROW_DETAIL, arguments: borrowId);
      }
    } else {
      Get.toNamed(Routes.NOTIFICATION);
    }
  }
}

@pragma('vm:entry-point')
Future<void> onFCMBackground(RemoteMessage message) async {
  await Firebase.initializeApp();

  final logPayload = {
    'message': {
      'notification': {
        'title': message.notification?.title ?? '-',
        'body': message.notification?.body ?? '-',
      },
      'data': message.data,
    },
  };

  log('=== FCM PAYLOAD RUNNING BACKGROUND ===');
  log(const JsonEncoder.withIndent('  ').convert(logPayload));
  log('===================');
}
