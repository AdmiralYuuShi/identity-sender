import 'package:intl/intl.dart';

String getStringFormattedDateTime(DateTime date) {
  return new DateFormat("dd MMM yyyy HH.mm.ss").format(date);
}
