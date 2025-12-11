import 'package:baca_app/app/data/model/borrow_model.dart';

Status parseStatus(String value) {
  switch (value) {
    case 'pending':
      return Status.pending;
    case 'onBorrow':
      return Status.onBorrow;
    case 'returned':
      return Status.returned;
    case 'rejected':
      return Status.rejected;
    default:
      return Status.pending;
  }
}
