#import "InstallPlugin.h"
//#import <install_plugin/install_plugin-Swift.h>

@implementation InstallPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"install_plugin" binaryMessenger:registrar.messenger];
    [registrar addMethodCallDelegate:[[InstallPlugin alloc] init] channel:channel];
}
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    if ([call.method isEqualToString:@"gotoAppStore"]){
        NSString *url = [call.arguments objectForKey:@"urlString"];
        if (url&&[url isEqualToString: @""]==false){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        }
    }
}

/*


public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  switch call.method {
  case "gotoAppStore":
      print(call.arguments ?? "null")
      guard let urlString = (call.arguments as? Dictionary<String, Any>)?["urlString"] as? String else {
          result(FlutterError(code: "参数url不能为空", message: nil, details: nil))
          return
      }
      gotoAppStore(urlString: urlString)
  default:
      result(FlutterMethodNotImplemented)
  }
}
  
  //跳转到应用的AppStore页页面
  func gotoAppStore(urlString: String) {
      if let url = URL(string: urlString) {
          //根据iOS系统版本，分别处理
          if #available(iOS 10, *) {
              UIApplication.shared.open(url, options: [:],completionHandler: {(success) in })
          } else {
              UIApplication.shared.openURL(url)
          }
      }
  }
*/



@end
