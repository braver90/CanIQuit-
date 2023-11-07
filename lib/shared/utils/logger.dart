import 'dart:developer' as developer;

class Logger {
  log(String messagge) {
    developer.log(messagge, time: DateTime.now());
  }
}
