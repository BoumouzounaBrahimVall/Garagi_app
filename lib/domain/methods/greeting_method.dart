String greetingMethod() {
  // Get the current time
  DateTime now = DateTime.now();

  // Extract the current hour
  int currentHour = now.hour;

  // Greet the user based on the current time
  if (currentHour >= 0 && currentHour < 12) {
    return "Good morning!";
  } else if (currentHour >= 12 && currentHour < 17) {
    return "Good afternoon!";
  } else if (currentHour >= 17 && currentHour < 20) {
    return "Good evening!";
  }
  return "Good night!";
}
