import 'package:intl/intl.dart';

String FormatDate (date) {
  DateTime parseDt = DateTime.parse(date);
  var newFormat = DateFormat('dd LLLL yyyy');
  String updatedDt = newFormat.format(parseDt);

  return updatedDt;
}
