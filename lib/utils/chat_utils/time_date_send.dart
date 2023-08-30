import 'package:intl/intl.dart';

String timeSend(int msEpoch) {
  if (msEpoch != 0) {
    final format = DateFormat('h:mm a');
    final time = format.format(DateTime.fromMillisecondsSinceEpoch(msEpoch));
    return time;
  }
  return '';
}

String dateSend(int msEpoch) {
  final format = DateFormat('MM/dd/yyyy');
  final time = format.format(DateTime.fromMillisecondsSinceEpoch(msEpoch));
  return time;
}
