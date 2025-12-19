import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static DateTime _normalize(DateTime dt) {
    final raw = dt.toUtc();
    return DateTime(
      raw.year,
      raw.month,
      raw.day,
      raw.hour,
      raw.minute,
      raw.second,
    );
  }

  static String yearMonthDayFormatter({required DateTime? datetime}) {
    if (datetime == null) return "-";
    final local = _normalize(datetime);
    return DateFormat.yMMMd().format(local);
  }

  static String timeFormatter({required DateTime? datetime}) {
    if (datetime == null) return "-";
    final local = _normalize(datetime);
    return DateFormat.jm().format(local);
  }

  /// ================== TIME AGO FORMATTER ==================

  static String timeAgo({required DateTime? datetime}) {
    if (datetime == null) return "-";

    final now = DateTime.now();

    // localDate sekarang akan bernilai 13:39 (bukan 20:39 lagi)
    final localDate = _normalize(datetime);

    // Menghitung selisih antara 16:00 (now) dan 13:39 (localDate)
    final difference = now.difference(localDate);

    // Jika karena sedikit delay waktu backend hasilnya negatif tipis, tetap anggap 'just now'
    // Tapi jika selisihnya jauh (seperti 2 jam), dia akan masuk ke logika jam.
    if (difference.inSeconds < 30 && !difference.isNegative) {
      return 'just now';
    }

    // Gunakan .abs() supaya jika ada selisih negatif karena backend 'lebih maju',
    // hitungannya tetap tampil sebagai "... ago"
    final absoluteDiff = difference.abs();

    if (absoluteDiff.inMinutes < 60) {
      return '${absoluteDiff.inMinutes} minutes ago';
    }
    if (absoluteDiff.inHours < 24) {
      return '${absoluteDiff.inHours} hours ago';
    }
    if (absoluteDiff.inDays < 7) {
      return '${absoluteDiff.inDays} days ago';
    }
    if (absoluteDiff.inDays < 30) {
      return '${(absoluteDiff.inDays / 7).floor()} weeks ago';
    }
    if (absoluteDiff.inDays < 365) {
      return '${(absoluteDiff.inDays / 30).floor()} months ago';
    }
    return '${(absoluteDiff.inDays / 365).floor()} years ago';
  }
}
