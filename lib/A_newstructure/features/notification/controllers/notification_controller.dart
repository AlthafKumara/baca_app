import 'dart:async';

import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/features/notification/models/notification_model.dart';
import 'package:baca_app/A_newstructure/features/notification/repositories/notification_repository.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationController extends GetxController
    with StateMixin<List<NotificationModel>> {
  late final StreamSubscription<AuthState> _authSub;
  final NotificationRepository _repository = NotificationRepository();
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
      final data = await _repository.fetchNotifications();
      change(data, status: RxStatus.success());

      _channel = _repository.subscribe((notif) {
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

    await _repository.markAsRead(notif.id);

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

  // ================= Navigation ================= //
  void toFeed() => Get.offAllNamed(Routes.USER_FEED);
  void toLibrary() => Get.offAllNamed(Routes.USER_LIBRARY);
}
