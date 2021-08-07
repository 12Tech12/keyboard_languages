#import "KeyboardLanguagesPlugin.h"
#if __has_include(<keyboard_languages/keyboard_languages-Swift.h>)
#import <keyboard_languages/keyboard_languages-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "keyboard_languages-Swift.h"
#endif

@implementation KeyboardLanguagesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKeyboardLanguagesPlugin registerWithRegistrar:registrar];
}
@end
