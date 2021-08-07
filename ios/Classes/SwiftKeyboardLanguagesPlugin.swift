import Flutter
import UIKit

public class SwiftKeyboardLanguagesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "keyboard_languages", binaryMessenger: registrar.messenger())
    let instance = SwiftKeyboardLanguagesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let localeIdentifier = UITextInputMode.activeInputModes().first as? UITextInputMode
    var locale:NSLocale = NSLocale(localeIdentifier: localeIdentifier.primaryLanguage!)
    result("iOS:" + \(localeIdentifier.primaryLanguage!))
  }
}
