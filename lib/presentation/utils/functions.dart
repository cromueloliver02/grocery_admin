import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('MM/dd/yyyy - hh:mm a').format(dateTime);
}
