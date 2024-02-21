import SwiftUI

struct TabbarView: View {
    @Binding var showSignInView: Bool
    
    var body: some View {
        TabView {
            NavigationStack {
                ProductsView()
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Products")
            }
            NavigationStack {
                Favorite()
            }
            .tabItem {
                Image(systemName: "star")
                Text("Favorites")
            }
            NavigationStack {
                Profile(showSignInView: $showSignInView)
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

#Preview {
    TabbarView(showSignInView: .constant(false))
}
