import UIKit

@UIApplicationMain
final internal class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let masterViewController = UINavigationController(rootViewController: LaunchViewController())
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = UIDevice.current.userInterfaceIdiom == .pad
        ? [
            masterViewController,
            UIViewController()
        ]
        : [masterViewController]
        splitViewController.preferredDisplayMode = .allVisible
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
        
        if UserDefaults.isFirstLaunch() {
            // Enable Text Messages
            UserDefaults.standard.set(true, forKey: "Text Messages")
        }
        
        return true
    }
}
