import 'package:easy_localization/easy_localization.dart';

class DateHelper {
  static String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }
}
