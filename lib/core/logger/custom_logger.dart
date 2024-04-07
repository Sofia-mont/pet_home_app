import 'dart:developer' as dev;
import 'package:pet_home/core/constants/app_constants.dart';

class CustomLogger {
  static void logError(Object message, Object? stackTrace) {
    log('______________________________________________');
    log('❌❌❌❌   HA OCURRIDO UN ERROR   ❌❌❌❌');
    log('Error:');
    log(message.toString());
    if (stackTrace != null) {
      log('StackTrace :');
      log(stackTrace.toString());
    }
    log('______________________________________________');
  }

  static void log(Object? message) {
    if (message == null) return;
    if (!AppConstants.isProd || AppConstants.forceLogs) {
      _printPreLog(message.toString());
    } else {
      _printProdLog(message.toString());
    }
  }

  static void _printProdLog(String message) {
    dev.log(message);
  }

  static void _printPreLog(String message) {
    // ignore: avoid_print
    print(message);
  }
}
