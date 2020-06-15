import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setApplicationColorTheme()
    return true
  }

  func setApplicationColorTheme() {
    let redColor = RGB(233, 55, 44)

    // Application tintColor
    window?.tintColor = redColor

    // Navigation bar background color
    UINavigationBar.appearance().barTintColor = redColor

    // Make the back button white (instead of the global tintColor)
    UINavigationBar.appearance().tintColor = .white

    // Make the text in the navigation bar white
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
  }

  private func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
  }
}
