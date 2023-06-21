import 'package:intl/intl.dart';

class DateUtility {
  static String getFormattedDate(String? date) {
    return date == null
        ? ''
        : DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
  }
}
