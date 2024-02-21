import SwiftUI
import PhotosUI

@MainActor
final class ProfileModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func togglePremiumStatus() {
        guard let user else { return }
        let currentValue = user.isPremium ?? false
        Task {
            try await UserManager.shared.updateUserPremiumStatus(userId: user.userId, isPremium: !currentValue)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addUserPreference(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.addUserPreference(userId: user.userId, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeUserPreference(text: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.removeUserPreference(userId: user.userId, preference: text)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func addFavoriteMovie() {
        guard let user else { return }
        let movie = Movie(id: "1", title: "A$AP", isPopular: true)
        Task {
            try await UserManager.shared.addFavoriteMovie(userId: user.userId, movie: movie)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func removeFavoriteMovie() {
        guard let user else { return }
        Task {
            try await UserManager.shared.removeFavoriteMovie(userId: user.userId)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    func saveProfileImage(item: PhotosPickerItem) {
        guard let user else { return }
        
        Task {
            guard let data = try await item.loadTransferable(type: Data.self) else { return }
            let (path, name) = try await StorageManager.shared.saveImage(data: data, userId: user.userId)
            let url = try await StorageManager.shared.getUrlForImage(path: path)
            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: path, url: url.absoluteString)
        }
    }
    
    func deleteImage() {
        guard let user, let path = user.profileImagePath else { return }
        
        Task {
            try await StorageManager.shared.deleteImage(path: path)
            try await UserManager.shared.updateUserProfileImagePath(userId: user.userId, path: nil, url: nil)
        }
    }
}

struct Profile: View {
    @StateObject private var viewModel = ProfileModel()
    @Binding var showSignInView: Bool
    @State private var offsetY1: CGFloat = 0
    @State private var offsetY2: CGFloat = 0
    let animationDuration1: Double = 2
    let animationDuration2: Double = 3
    
    @State private var gradientColors: [Color] = [Color("starbucks-lightgold"), Color("starbucks-silver")]
    
    var body: some View {
        VStack{
            Text(viewModel.user?.firstName ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
            
            ZStack {
                Circle()
                    .fill(Color("starbucks-green").gradient)
                    .frame(height: 150)
                    .offset(x: -100, y: 50 + offsetY1)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: animationDuration1).repeatForever()) {
                            self.offsetY1 = 5
                        }
                    }
                
                Circle()
                    .fill(Color("starbucks-green").gradient)
                    .frame(height: 120)
                    .offset(x: 120, y: -50 + offsetY2)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: animationDuration2).repeatForever()) {
                            self.offsetY2 = 5
                        }
                    }

                bonusCard
            }
            
            optionList
            
            let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/appta-52453.appspot.com/o/coffeeshops%2Farabica-logo.png?alt=media&token=8d37c25d-2c62-4af0-9003-ae5caaac7176")
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
        }
        .task {
            try? await viewModel.loadCurrentUser()
        }
//        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .foregroundColor(.black)
                        .font(.headline)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension Profile {
    private var bonusCard: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.ultraThinMaterial)
            .frame(width: UIScreen.main.bounds.width - 120, height: 180)
            .shadow(radius: 10)
            .overlay(){
                HStack {
                    Image(systemName: "camera.filters")
                        .symbolEffect(.pulse)
                        .foregroundColor(Color("starbucks-black"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("starbucks-black"))
                        .padding()
                    
                    NavigationLink(destination: HowToEarnView()) {
                        HStack {
                            Text("как накопить")
                                .foregroundColor(Color("starbucks-black"))
                                .fontWeight(.semibold)
                                .offset(y: 10)
                                .font(.caption)
                            
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color("starbucks-black"))
                                .offset(y: 10)
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                            .padding()
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
            }
                
                Text("1738 бонусов")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .foregroundColor(Color("starbucks-black"))
                    .padding()
                    .font(.title3)
            }
            .gradientStroke(colors: gradientColors, lineWidth: 1)
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
                    self.gradientColors = [Color("starbucks-silver"), Color("starbucks-lightgold")]
                }
            }
    }
    
    private var optionList: some View {
        List {
            HStack {
                NavigationLink(destination: RootView()) {
                    Image(systemName: "creditcard")
                        .frame(width: 30, height: 30)
                    Text("Способ оплаты")
                    Spacer()
                }
            }
            .listRowBackground(Color("starbucks-green").opacity(0.9))
            .listRowSeparator(.hidden)
            
            HStack {
                NavigationLink(destination: AnotherView()) {
                    Image(systemName: "map")
                        .frame(width: 30, height: 30)
                    Text("Мои адреса")
                    Spacer()
                }
            }
            .listRowBackground(Color("starbucks-green").opacity(0.9))
            .listRowSeparator(.hidden)
            
            HStack {
                NavigationLink(destination: AnotherView()) {
                    Image(systemName: "bag")
                        .frame(width: 30, height: 30)
                    Text("История заказов")
                    Spacer()
                }
            }
            .listRowBackground(Color("starbucks-green").opacity(0.9))
            .listRowSeparator(.hidden)
            
            HStack {
                NavigationLink(destination: AnotherView()) {
                    Image(systemName: "bell")
                        .frame(width: 30, height: 30)
                    Text("Уведомления")
                    Spacer()
                }
            }
            .listRowBackground(Color("starbucks-green").opacity(0.9))
            .listRowSeparator(.hidden)
            
            HStack {
                NavigationLink(destination: AnotherView()) {
                    Image(systemName: "poweroutlet.type.d")
                        .frame(width: 30, height: 30)
                    Text("Ввести промокод")
                    Spacer()
                }
            }
            .listRowBackground(Color("starbucks-green").opacity(0.9))
            .listRowSeparator(.hidden)
            
            HStack {
                NavigationLink(destination: AnotherView()) {
                    Image(systemName: "tengesign")
                        .frame(width: 30, height: 30)
                    Text("Язык интерфейса")
                    Spacer()
                }
            }
            .listRowBackground(Color("starbucks-green").opacity(0.9))
            .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
        .scrollDisabled(true)
    }
}

#Preview {
    Profile(showSignInView: .constant(false))
}




