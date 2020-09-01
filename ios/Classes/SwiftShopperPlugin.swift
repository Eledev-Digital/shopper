import Flutter
import UIKit

public class SwiftShopperPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "shopper", binaryMessenger: registrar.messenger())
    let instance = SwiftShopperPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    switch call.method {
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)

      default:
        result("unimplemented")
    }
  }
  
}
