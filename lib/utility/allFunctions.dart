import 'dart:io';

class AllFunctions {
  static String dateDifferences({required String start}) {
    var dts = HttpDate.parse(start);
    var dte = DateTime.now();

    var from = DateTime(dts.year, dts.month, dts.day);
    var to = DateTime(dte.year, dte.month, dte.day);
    var diffDays = (to.difference(from).inDays).round();
    String daysAgo = '';
    daysAgo = '$diffDays day';
    if (diffDays > 30) {
      int days = diffDays % 30;
      diffDays -= days;
      int months = diffDays.toInt() ~/ 30;
      daysAgo = '$months month';
      if (months > 1) {
        daysAgo += 's';
      }
      if (days > 0) {
        daysAgo += ' $days day';
      } else {
        daysAgo += '.';
      }
      if (days > 1) {
        daysAgo += 's.';
      }
    } else if (diffDays > 1) {
      daysAgo += 's.';
    } else {
      daysAgo += '.';
    }
    return daysAgo;
  }
}
