//import UIKit
//import Flutter
//
//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//  override func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//    GeneratedPluginRegistrant.register(with: self)
//    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//  }
//}


import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  
  private var methodChannel: FlutterMethodChannel?
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
    
    methodChannel = FlutterMethodChannel(name: "test.bbws.com/channel", binaryMessenger: flutterViewController.binaryMessenger)
    
    methodChannel?.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "initialLink" {
        // Handle the initial deep link here
        if let url = launchOptions?[.url] as? URL {
          // Send the initial deep link URL to Flutter
          result(url.absoluteString)
        } else {
          result(nil)
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })
    
    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    // Handle the deep link when the app is already running
    methodChannel?.invokeMethod("handleLink", arguments: url.absoluteString)
    return true
  }
}
