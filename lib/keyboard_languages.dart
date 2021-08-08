import 'dart:async';

import 'package:flutter/services.dart';

const MethodChannel _keyboardLanguagesChannel = MethodChannel('keyboard_languages');

Future<List<String>?> getKeyboardLanguages() async {
  final List<String>? keyboardLangauges = await _keyboardLanguagesChannel.invokeListMethod<String>('getKeyboardLanguages');
  return keyboardLangauges;
}
