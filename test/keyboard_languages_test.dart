import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_languages/keyboard_languages.dart';

void main() {
  const MethodChannel channel = MethodChannel('keyboard_languages');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getKeyboardLanguages', () async {
    expect(await getKeyboardLanguages(), '42');
  });
}
