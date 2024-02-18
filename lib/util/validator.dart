List<int>? tryParseDate(String dateString) {
  final splitRes = dateString.split("/");
  if (splitRes.length != 3) {
    return null;
  }
  final year = int.tryParse(splitRes[0]);
  final month = int.tryParse(splitRes[1]);
  final day = int.tryParse(splitRes[2]);
  if (year == null || month == null || day == null) {
    return null;
  }
  if (year > 10000 || year < 0) {
    return null;
  }
  if (month > 12 || month <= 0) {
    return null;
  }
  if (day <= 0) {
    return null;
  }
  if (month <= 6) {
    if (day > 31) {
      return null;
    }
  } else if (month > 6 || month < 12) {
    if (day > 30) {
      return null;
    }
  } else if (month == 12) {
    if (year % 4 == 3) {
      if (day > 30) {
        return null;
      }
    } else {
      if (day > 29) {
        return null;
      }
    }
  }
  return [year, month, day];
}

List<int>? tryParseTime(String timeString) {
  final splitRes = timeString.split(":");
  if (splitRes.length != 2) {
    return null;
  }
  final hour = int.tryParse(splitRes[0]);
  final minute = int.tryParse(splitRes[1]);
  if (hour == null || minute == null) {
    return null;
  }
  if (hour > 23 || hour < 0) {
    return null;
  }
  if (minute > 59 || hour < 0) {
    return null;
  }
  return [hour, minute];
}
