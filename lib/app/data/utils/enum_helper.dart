import 'package:baca_app/app/data/model/borrow_model.dart';

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
