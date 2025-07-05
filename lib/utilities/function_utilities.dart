class FunctionUtilities {
  static String formatMovieRunTime(int minute) {
    final hour = minute ~/ 60;
    final minuteRemaining = minute % 60;
    return '${hour}h ${minuteRemaining}min';
  }

  static String formatReleaseDate(String date) {
    final dateFormat = date.split('-');
    return '${dateFormat[2]}/${dateFormat[1]}/${dateFormat[0]}';
  }
}
