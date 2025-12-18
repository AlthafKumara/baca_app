import 'package:baca_app/app/data/model/notification_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationService {
  final supabase = Supabase.instance.client;

  Future<List<NotificationModel>> fetchNotifications() async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];
    final userId = user.id;

    final res = await supabase
        .from('notifications')
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
        .channel('notifications-$userId')
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
    await supabase.from('notifications').update({'is_read': true}).eq('id', id);
  }
}
