import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getStringFormattedDateTime(DateTime date) {
  return new DateFormat("dd/MM/yy HH:mm").format(date);
}

String getStringFormattedDateTimeMonthName(DateTime date) {
  return new DateFormat("dd MMM, yyyy").format(date);
}

String getStringFormattedDateTimeDDMMYYYY(DateTime date) {
  return new DateFormat("dd-MM-yyyy").format(date);
}

String getStringFormattedDateMonth(DateTime date) {
  return new DateFormat("MMM d").format(date);
}

String getFormattedDateTime(String date) {
  var d = DateTime.parse(date);
  return new DateFormat("dd-MM-yyyy\nHH:mm", "id").format(d);
}

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  return DateFormat("HH:mm").format(dt);
}
