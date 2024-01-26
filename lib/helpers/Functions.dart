import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MMM, dd yyyy').format(now);
  return formattedDate;
}

String getDayAbbreviation(int weekday) {
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return days[(weekday - 1) % 7]; // Adjusting for the zero-based index
}
