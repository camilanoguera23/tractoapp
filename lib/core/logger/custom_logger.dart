import 'dart:developer' as dev;

class CustomLogger {
  static void log(String message) {
    _printProdLog(message);
  }

  static void _printProdLog(String message) {
    dev.log(message);
  }
}
