import 'package:intl/intl.dart';

class FormatDateUtils {
  static String dayMonthYear(DateTime dateTime) {
    // var dateFromTimeStamp = DateTime
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  dateRefactor(DateTime value) {
    RegExp regex = RegExp(r'([.]*000)(?!.*\d)');
    String finalDate = value.toString().replaceAll(regex, '');
    return finalDate;
  }
}
