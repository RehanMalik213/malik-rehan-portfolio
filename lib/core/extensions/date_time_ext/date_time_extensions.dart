extension DateTimeEx on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return isSameDate(now);
  }

  bool isSameDate(DateTime secondDate) {
    return year == secondDate.year &&
        month == secondDate.month &&
        day == secondDate.day;
  }

  bool isLeaveDay() {
    return isSaturday() || isSunday();
  }

  bool isSaturday() {
    return weekday == DateTime.saturday;
  }

  bool isSunday() {
    return weekday == DateTime.sunday;
  }

  List<DateTime> get getHoursOfDay {
    List<DateTime> hours = [];
    for (int i = 0; i < 24; i++) {
      hours.add(DateTime(year, month, day, i));
    }
    return hours;
  }

  bool isFutureDate() {
    final now = DateTime.now();
    return isAfter(now);
  }
}
