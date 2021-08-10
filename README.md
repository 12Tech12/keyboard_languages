# keyboard_languages

Flutter plugin that lists available keyboard languages in Android/iOS device.

## Installation

Add `keyboard_languages: ^0.1.4` in your `pubspec.yaml` dependencies, and import it:

```dart
import 'package:keyboard_languages/keyboard_languages.dart';
```

## How to use

Simply call `getKeyboardLanguages()` to receive a list of supported keyboard languages:

```dart
List<String> keyboardLanguages;
// Platform messages may fail, so we use a try/catch PlatformException.
// We also handle the message potentially returning null.
try {
    keyboardLanguages = await getKeyboardLanguages() ?? <String>[];
} on PlatformException {
    keyboardLanguages = <String>['Failed to get keyboard languages.'];
}
```

For a more detailed example please take a look at the `example` folder.
