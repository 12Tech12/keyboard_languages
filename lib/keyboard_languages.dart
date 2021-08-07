
import 'dart:async';

import 'package:flutter/services.dart';

class KeyboardLanguages {
  static const MethodChannel _channel =
      const MethodChannel('keyboard_languages');

  static Future<List<String>?> get platformVersion async {
    final List<String>? keyboardLangauges = await _channel.invokeListMethod<String>('getKeyboardLanguages');
    return keyboardLangauges;
  }
}
