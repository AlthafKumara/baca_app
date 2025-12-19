import 'dart:async';

import 'package:baca_app/A_laststructure/app/data/model/notification_model.dart';
import 'package:baca_app/A_laststructure/app/data/services/notification_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationController extends GetxController
    with StateMixin<List<NotificationModel>> {
  late final StreamSubscription<AuthState> _authSub;
  final NotificationService _service = NotificationService();
  RealtimeChannel? _channel;

  @override
  void onInit() {
    super.onInit();

    _authSub = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (data.event == AuthChangeEvent.signedIn) {
        _reInit();
      }

      if (data.event == AuthChangeEvent.signedOut) {
        change([], status: RxStatus.empty());
        _channel?.unsubscribe();
      }
    });
    _init();
  }

  Future<void> _init() async {
    change(null, status: RxStatus.loading());

    try {
      final data = await _service.fetchNotifications();
      change(data, status: RxStatus.success());

      _channel = _service.subscribe((notif) {
        final current = state ?? [];
        change([notif, ...current], status: RxStatus.success());

        Get.snackbar(
          notif.title,
          notif.message,
          snackPosition: SnackPosition.TOP,
        );
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> _reInit() async {
    await _channel?.unsubscribe();
    await _init();
  }

  int get unreadCount => state?.where((n) => !n.isRead).length ?? 0;

  Future<void> markAsRead(NotificationModel notif) async {
    if (notif.isRead) return;

    await _service.markAsRead(notif.id);

    final updated = state?.map((n) {
      if (n.id == notif.id) {
        return n.copyWith(isRead: true);
      }
      return n;
    }).toList();

    change(updated, status: RxStatus.success());
  }

  @override
  void onClose() {
    _channel?.unsubscribe();
    super.onClose();
  }
}
