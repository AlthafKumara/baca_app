import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String yearMonthDayFormatter({required DateTime? datetime}) {
    if (datetime == null) return "-";
    return DateFormat.yMMMd().format(datetime);
  }

  static String timeFormatter({required DateTime? datetime}) {
    if (datetime == null) return "-";
    return DateFormat.jm().format(datetime);
  }
}
