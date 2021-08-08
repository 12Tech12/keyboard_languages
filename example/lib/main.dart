import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:keyboard_languages/keyboard_languages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _keyboardLanguages = 'Unknown';

  @override
  void initState() {
    super.initState();
    initKeyboardLanguagesState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initKeyboardLanguagesState() async {
    List<String> keyboardLanguages;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      keyboardLanguages = await getKeyboardLanguages() ?? <String>[];
    } on PlatformException {
      keyboardLanguages = <String>['Failed to get keyboard languages.'];
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    setState(() {
      _keyboardLanguages = '';
      for (final String kl in keyboardLanguages) {
        _keyboardLanguages += kl.toString() + ', ';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard languages example'),
        ),
        body: Center(
          child: Text('Available keyboards: $_keyboardLanguages\n'),
        ),
      ),
    );
  }
}
