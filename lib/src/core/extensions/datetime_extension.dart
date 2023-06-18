extension DateTimeExtension on DateTime {
  bool compareOnlyDate(DateTime other) {
    return other.day == day && other.month == month && other.year == year;
  }
}
