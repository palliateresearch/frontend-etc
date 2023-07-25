import SwiftUI
import ConfettiSwiftUI

@main
struct PowerPlayApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var monitoringManager = monitorStreak()
    @StateObject private var pv = PV()

    var body: some Scene {
        WindowGroup {
            childStartView()
                .environmentObject(monitoringManager)
                .environmentObject(pv)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Initialize the monitoring manager here, so it starts as soon as the app launches
        let monitoringManager = monitorStreak()

        return true
    }
}
