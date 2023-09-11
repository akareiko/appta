import SwiftUI


@main
struct MyApp: App {
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.shadowColor = nil
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().isHidden = true
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
