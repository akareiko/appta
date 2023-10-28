import SwiftUI


@main
struct MyApp: App {
    @StateObject private var navigationState = NavigationState()
    
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
            if !navigationState.navigateToContentView {
                GuideView(navigationState: navigationState) // Pass the shared state
            } else {
                ContentView()
            }
        }
    }
}
