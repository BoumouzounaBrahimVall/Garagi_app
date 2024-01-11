String formatNumber(int number) {
  if (number >= 0 && number <= 999) {
    return number.toString();
  } else if (number >= 1000 && number <= 999999) {
    double result = number / 1000.0;
    if (result.floor() == result) {
      return '${result.toInt()}k';
    } else {
      return '${result.toStringAsFixed(1)}k';
    }
  } else if (number >= 1000000 && number <= 999999999) {
    double result = number / 1000000.0;
    if (result.floor() == result) {
      return '${result.toInt()}m';
    } else {
      return '${result.toStringAsFixed(1)}m';
    }
  } else
    return "";
}
