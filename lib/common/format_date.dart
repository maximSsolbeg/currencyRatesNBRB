import 'package:intl/intl.dart';

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
