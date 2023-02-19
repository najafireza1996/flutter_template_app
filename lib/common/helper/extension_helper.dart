

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day;
  }
}

extension Contain on List<String> {
  bool containsString(String key) {
    for (int i = 0; i < length; i++) {
      if (elementAt(i).contains(key)) {
        return true;
      }
    }
    return false;
  }
}
