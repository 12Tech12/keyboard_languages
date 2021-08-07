package com.twtech.keyboard_languages

import androidx.annotation.NonNull

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter

import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

import android.view.inputmethod.InputMethodManager
import android.view.inputmethod.InputMethodSubtype

import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry.Registrar


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import 	java.util.Locale

/** KeyboardLanguagesPlugin */
class KeyboardLanguagesPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "keyboard_languages")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getKeyboardLanguages") {
      // var imm : InputMethodManager = activity.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
      // var ims = imm.getCurrentInputMethodSubtype()
      // var localeString = ims.getLocale()
      // var locale = Locale(localeString)
      // var currentLanguage = locale.getDisplayLanguage()
      // val keyboardLanguages = mutableListOf<String>()
      // keyboardLanguages.add(currentLanguage)
      // keyboardLanguages.add("test")
      // keyboardLanguages.add("me")
      // result.success(keyboardLanguages)

      val keyboardLanguages = mutableListOf<String>()
      var locales = Locale.getAvailableLocales();
      locales.forEach {
        keyboardLanguages.add(it.toString())
      }
      result.success(keyboardLanguages)

    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
      TODO("Not yet implemented")
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
      activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
      TODO("Not yet implemented")
  }
}
