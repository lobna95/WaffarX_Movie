import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      MovieDetailsViewPlugin.register(with: registrar(forPlugin: "MovieDetails")!)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)

  }
}
