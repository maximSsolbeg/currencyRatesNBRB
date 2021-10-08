import 'package:intl/intl.dart';

String today = FormatDateForUrl(DateTime.now().toString());
String thisDayAYearBefore = FormatDateForUrl(DateTime.now().subtract(const Duration(days: 365)).toString());

String FormatDate (date) {
  DateTime parseDt = DateTime.parse(date);
  var newFormat = DateFormat('dd LLLL yyyy');
  String updatedDt = newFormat.format(parseDt);

  return updatedDt;
}

String FormatDateForUrl (date) {
  DateTime parseDt = DateTime.parse(date);
  var newFormat = DateFormat('yyyy-LL-dd');
  String updatedDt = newFormat.format(parseDt);

  return updatedDt;
}

String FormatDateShortView (date) {
  DateTime parseDt = DateTime.parse(date);
  var newFormat = DateFormat('dd.LL.yy');
  String updatedDt = newFormat.format(parseDt);

  return updatedDt;
}
