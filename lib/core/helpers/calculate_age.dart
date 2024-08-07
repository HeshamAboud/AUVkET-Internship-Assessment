import 'package:intl/intl.dart';

int calculateAge(String birthOfDate) {
  final String dateStr = birthOfDate;
  if (dateStr.isEmpty) {
    return 0;
  }

  final DateTime? birthday = DateFormat('yyyy-MM-dd').parseStrict(dateStr);
  if (birthday == null) {
    return 0;
  }

  final DateTime today = DateTime.now();
  int age = today.year - birthday.year;

  if (today.month < birthday.month ||
      (today.month == birthday.month && today.day < birthday.day)) {
    age--;
  }

  return age;
}
