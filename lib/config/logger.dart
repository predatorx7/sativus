import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

export 'package:logging/logging.dart';

final logging = Logger('sativus');

extension LoggerExtension on Logger {
  /// Create a new child [Logger] instance with a [name].
  ///
  /// The full name of this new Logging will be this logging's full name + the [name].
  Logger child(String name) {
    return Logger('$fullName.$name');
  }
}

extension LoggerObject on Object {
  Logger get $logger => logging.child(runtimeType.toString());
}

final _logDateFormat = DateFormat('hh:mm:ss aa');

void onLogsToConsole(LogRecord record) {
  final formattedTime = _logDateFormat.format(record.time);

  final label =
      '$formattedTime ${record.level.name} ${record.loggerName} (${record.sequenceNumber})';

  final message = record.message;
  debugPrintThrottled('$label $message'.trim());
  final error = record.error;
  if (error != null) debugPrintThrottled('$label [Error] $error');
  if (record.level >= Level.WARNING) {
    debugPrintStack(
      stackTrace: record.stackTrace,
      label: label,
      maxFrames: 20,
    );
  }
}

void setLogging() {
  hierarchicalLoggingEnabled = true;
  logging.level = Level.ALL;

  logging.onRecord.listen(onLogsToConsole);

  final flutterErrorLogger = logging.child('FlutterError');
  // Pass all uncaught "fatal" errors from the framework to logging
  FlutterError.onError = (details) {
    flutterErrorLogger.severe(
      details,
      details.exception,
      details.stack,
    );
  };

  final platformDispatcherLogger = logging.child('PlatformDispatcher');
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to logging
  PlatformDispatcher.instance.onError = (error, stack) {
    platformDispatcherLogger.severe(
      'Uncaught asynchronous error',
      error,
      stack,
    );
    return true;
  };
}
