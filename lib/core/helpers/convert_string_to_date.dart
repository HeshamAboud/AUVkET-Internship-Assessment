String convertDateToString(dynamic date) {
  String flag = date != null ? date : "لا يكن";
  dynamic dateTime = flag != "لا يكن" ? DateTime.parse(date) : "لا يكن";
  String finalDate = dateTime != "لا يكن"

      ? "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}"
      : "لا يكن";

  // String finalFormatDate = finalDate.replaceAll("-", "/");

  return finalDate;
}