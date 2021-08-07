import Flutter
import UIKit

public class SwiftKeyboardLanguagesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "keyboard_languages", binaryMessenger: registrar.messenger())
    let instance = SwiftKeyboardLanguagesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    var res = [String]()
    for activeInputMode in UITextInputMode.activeInputModes {
    let localeIdentifier = activeInputMode as? UITextInputMode
      res.append("\(localeIdentifier!.primaryLanguage!)");
    }

    result(res)
  }
}
