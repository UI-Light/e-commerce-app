import 'dart:developer' as dev;

AppLogger getLogger(Object scope) => _Logger(scope.toString());
bool _showLogs = false;

abstract class AppLogger {
  AppLogger._();

  static void configure({required bool showLogs}) {
    _showLogs = showLogs;
  }

  void log(Object? e) {}
}

class _Logger implements AppLogger {
  _Logger(this.scope);

  final String scope;

  @override
  void log(Object? e) {
    if (_showLogs) dev.log("$e");
  }
}
