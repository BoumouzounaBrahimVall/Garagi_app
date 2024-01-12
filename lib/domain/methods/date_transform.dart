import 'package:intl/intl.dart';

String formatDateToString(String dateString) {
  try {
    // Parse the date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date in the desired format
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedDate;
  } catch (e) {
    print('Error formatting date: $e');
    return ''; // Return an empty string or handle the error as needed
  }
}
