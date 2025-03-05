import Flutter
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene, willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }

    window = UIWindow(windowScene: windowScene)
    let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
    window?.rootViewController = flutterViewController
    window?.makeKeyAndVisible()

    GeneratedPluginRegistrant.register(with: flutterViewController)
  }
}
