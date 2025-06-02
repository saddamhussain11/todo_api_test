import 'package:intl/intl.dart';

class DateTimeUtil {
  // Method to parse and format time from the given date string
  static String formatTime(String dateTimeString) {
    DateTime? parsedDate;
    try {
      // Preprocess the dateTimeString to replace the colon before milliseconds with a period
      String correctedDateTimeString =
          dateTimeString.replaceFirst(RegExp(r':(\d{3})$'), '.${1}');

      // Parse the corrected string
      parsedDate =
          DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(correctedDateTimeString);
    } catch (e) {
      return 'Invalid Time';
    }

    // Format time only (e.g., 5:36 PM)
    return parsedDate != null
        ? DateFormat('h:mm a').format(parsedDate)
        : 'Invalid Time';
  }

  // Method to parse and format date from the given date string
  static String formatDate(String dateTimeString) {
    DateTime? parsedDate;
    try {
      // Preprocess the dateTimeString to replace the colon before milliseconds with a period
      String correctedDateTimeString =
          dateTimeString.replaceFirst(RegExp(r':(\d{3})$'), '.${1}');

      // Parse the corrected string
      parsedDate =
          DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(correctedDateTimeString);
    } catch (e) {
      return 'Invalid Date';
    }

    // Format date only (e.g., January 25, 2025)
    return parsedDate != null
        ? DateFormat('MMMM d, yyyy').format(parsedDate)
        : 'Invalid Date';
  }
}
