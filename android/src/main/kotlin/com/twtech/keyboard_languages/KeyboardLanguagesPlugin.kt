package com.twtech.keyboard_languages

import androidx.annotation.NonNull
import android.os.LocaleList
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.Locale;

/** KeyboardLanguagesPlugin */
class KeyboardLanguagesPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "keyboard_languages")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getKeyboardLanguages") {
      val keyboardLanguages = mutableListOf<String>()
      if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N) {
        var locales = LocaleList.getDefault();
        var numLocales = locales.size()
        var i = 0
        while (i < numLocales) {
          var locale = locales.get(i)
          keyboardLanguages.add(locale.toLanguageTag())
          i++
        }
      } else {
        keyboardLanguages.add(Locale.getDefault().toString())
      }
      result.success(keyboardLanguages)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
