import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FullscreenProvider extends ChangeNotifier {
  bool _isFullscreen = false;

  bool get isFullscreen => _isFullscreen;

  void toggleFullscreen() {
    _isFullscreen = !_isFullscreen;
    if (_isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    notifyListeners();
  }
}
