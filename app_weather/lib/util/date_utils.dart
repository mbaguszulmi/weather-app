import 'package:intl/intl.dart';

String formatToTime(DateTime date) {
  return DateFormat.Hm().format(date);
}

String formatToDate(DateTime date) {
  return DateFormat.yMd().format(date);
}

String formatToDay(DateTime date) {
  return DateFormat.EEEE().format(date);
}
