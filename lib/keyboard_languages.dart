import 'dart:async';

import 'package:flutter/services.dart';

/// MethodChannel to native code
const MethodChannel _keyboardLanguagesChannel =
    MethodChannel('keyboard_languages');

/// Obtain available keyboard languages
Future<List<String>?> getKeyboardLanguages() async {
  return await _keyboardLanguagesChannel
      .invokeListMethod<String>('getKeyboardLanguages');
}
