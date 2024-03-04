import 'package:flutter/foundation.dart';

class BaseViewModel {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  bool get isLoading => _loading.value;

  void setLoading(bool val) {
    _loading.value = val;
  }
}
