import 'package:flutter/widgets.dart';

class BaseController extends ChangeNotifier {

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
