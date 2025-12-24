import 'package:baca_app/A_newstructure/utils/enums/enum_helper.dart';

enum NotificationType { borrow_status, community, general }

class NotificationModel {
  final int id;
  final String userId;
  final String title;
  final String message;
  final bool isRead;
  final int? borrowId;
  final int? communityId;
  final NotificationType type;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.isRead,
    this.borrowId,
    this.communityId,
    required this.type,
    required this.createdAt,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      userId: map['user_id'],
      title: map['title'],
      message: map['message'],
      isRead: map['is_read'],
      borrowId: map['borrow_id'],
      communityId: map['community_id'],
      type: fromString(map['type']),
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'message': message,
      'is_read': isRead,
      'borrow_id': borrowId,
      'community_id': communityId,
      'type': type.name,
      'created_at': createdAt.toIso8601String(),
    };
  }

  NotificationModel copyWith({bool? isRead}) {
    return NotificationModel(
      id: id,
      userId: userId,
      title: title,
      message: message,
      type: type,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt,
      borrowId: borrowId,
      communityId: communityId,
    );
  }
}
