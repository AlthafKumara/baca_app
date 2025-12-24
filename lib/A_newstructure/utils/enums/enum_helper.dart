import 'package:baca_app/A_newstructure/features/notification/models/notification_model.dart';
import 'package:baca_app/A_newstructure/utils/enums/profiles_enum.dart';
import 'package:baca_app/A_newstructure/utils/enums/status_enum.dart';

Status parseStatus(String value) {
  switch (value) {
    case 'Pending':
      return Status.pending;
    case 'On Borrow':
      return Status.onBorrow;
    case 'Returned':
      return Status.returned;
    case 'Rejected':
      return Status.rejected;
    default:
      return Status.pending;
  }
}

NotificationType fromString(String value) {
  switch (value) {
    case 'community':
      return NotificationType.community;
    case 'borrow_status':
      return NotificationType.borrow_status;
    case 'general':
    default:
      return NotificationType.general;
  }
}

Role parseRole(String value) {
  switch (value) {
    case 'admin':
      return Role.admin;
    case 'user':
    default:
      return Role.user;
  }
}
