import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/features/notification/models/notification_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationRepository {
  final supabase = Supabase.instance.client;

  Future<List<NotificationModel>> fetchNotifications() async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];
    final userId = user.id;

    final res = await supabase
        .from(ApiConstant.NOTIFICATION)
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return res
        .map<NotificationModel>((e) => NotificationModel.fromMap(e))
        .toList();
  }

  RealtimeChannel subscribe(void Function(NotificationModel) onNew) {
    final userId = supabase.auth.currentUser!.id;

    return supabase
        .channel('${ApiConstant.NOTIFICATION}-$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) {
            final notif = NotificationModel.fromMap(payload.newRecord);
            onNew(notif);
          },
        )
        .subscribe();
  }

  Future<void> markAsRead(int id) async {
    await supabase
        .from(ApiConstant.NOTIFICATION)
        .update({'is_read': true})
        .eq('id', id);
  }
}
