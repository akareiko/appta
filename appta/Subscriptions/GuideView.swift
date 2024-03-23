import SwiftUI
import Combine

@MainActor
final class SubscriptionViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func saveUserSubscription(chosenShopId: String, chosenPlan: String) async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        try await UserManager.shared.updateUserShopAndPlan(userId: authDataResult.uid, chosenShopId: chosenShopId, chosenPlan: chosenPlan)
    }
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
}

struct GuideView: View{
    @State private var activeIntro: PageIntro = pageIntros[0]
    
    var body: some View {
        GeometryReader{
            let size = $0.size
            IntroView(intro: $activeIntro, size: size)
                .padding(.vertical, 15)
        }
    }
}

struct WaveAnimationView: View {
    @State private var waveOffsets: [CGFloat] = [0, 0, 0, 0]
    let animationDuration: Double = 1.5
    let amplitudes: [CGFloat] = [25, 15, 5, 2]

    var body: some View {
        ZStack {
            ForEach(0..<4) { index in
                Image("wavevec\(4-index)")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width + 5, height: UIScreen.main.bounds.height / 4)
                    .offset(y: 90 + self.waveOffsets[index])
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: self.animationDuration).repeatForever()) {
                            self.waveOffsets[index] = self.amplitudes[index]
                        }
                    }
            }
        }
    }
}


struct IntroView: View {
    @Binding var intro: PageIntro
    var size: CGSize
    @State private var showView: Bool = false
    @State private var hideWholeView: Bool = false
    @State private var chosenShop: Coffeeshop = Coffeeshop(id: "default_id", name: "Default Coffeeshop", image_url: "default_image_url", description: "Default Description", color: "default_color", pattern: "default_pattern")
    @State private var chosenPlan: Plan = Plan(id: "", plan_name: "", plan_price: "", plan_description: "", plan_image: "", plan_features: [], plan_features_image: [])
    @State private var didSwipe: Bool = false
    
    @StateObject private var viewModel = SubscriptionViewModel()
    @StateObject private var viewModelCoffeeshop = CoffeeshopViewModel()
    
    var body: some View {
        VStack{
            title
            .offset(y: showView ? 0 : size.height / 2)
            
            middle
            .frame(width: UIScreen.main.bounds.width)
            .offset(y: showView ? 0 : size.height / 2)
            .opacity(showView ? 1 : 0)
                
            bottom
                .offset(y: showView ? 0 : size.height / 2)
                .opacity(showView ? 1 : 0)
        }
        .offset(y: hideWholeView ? size.height / 2 : 0)
        .opacity(hideWholeView ? 0 : 1)
        .overlay(alignment: .topLeading) {
            if intro != pageIntros.first {
                Button {
                    changeIntro(true)
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .contentShape(Rectangle())
                }
                .padding(10)
                .offset(y: showView ? 0 : -200)
                .offset(y: hideWholeView ? -200 : 0)
            }
        }
        .task {
            try? await viewModel.loadCurrentUser()
            try? await viewModelCoffeeshop.getCoffeeshops()
        }
        .onAppear{
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)){
                showView = true
            }
        }
    }

    
    func changeIntro(_ isPrevious: Bool = false) {
        withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)){
            hideWholeView = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let index = pageIntros.firstIndex(of: intro), (isPrevious ? index != 0 : index != pageIntros.count - 1) {
                intro = isPrevious ? pageIntros[index - 1] : pageIntros[index + 1]
            } else {
                intro = isPrevious ? pageIntros[0] : pageIntros[pageIntros.count - 1]
            }
            
            hideWholeView = false
            showView = false
            
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)){
                showView = true
            }
        }
    }
}

extension IntroView {
    var title: some View {
        VStack {
            Text(intro.title)
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
            Text(intro.subTitle)
                .font(.title2)
                .foregroundColor(.black)
            +
            Text(Image(systemName: intro.icon))
            
            CustomIndicatorView(totalPages: pageIntros.count, currentPage: pageIntros.firstIndex(of: intro) ?? 0)
        }
    }
    
    var middle: some View {
        VStack {
            switch intro.introBlock {
            case 1:
                Image("wave")
                    .blur(radius: 70)
                    .frame(height: 10)
                    .offset(y: 350)
                BeforePlansView(haha: $chosenShop, coffeeshops: viewModelCoffeeshop.coffeeshops)
                WaveAnimationView()
                    .offset(y: 80)
            case 2:
                PlansView(coffeeshop_id: chosenShop.id, haha: $chosenPlan, didSwipe: $didSwipe)
                    .onAppear {
                        didSwipe = false
                        chosenPlan = Plan(id: "", plan_name: "", plan_price: "", plan_description: "", plan_image: "", plan_features: [], plan_features_image: [])
                    }
                    .onChange(of: didSwipe) {
                        if didSwipe {
                            changeIntro()
                        }
                    }
            case 3:
                AfterPlansView()
            default:
                ProgressView()
            }
        }
    }
    
    var bottom: some View {
        VStack {
            VStack {
                Text(chosenShop.name)
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(chosenPlan.plan_name)
                    .foregroundColor(.black)
                    .font(.title3)
            }
            
            if intro.introBlock == 1 {
                Button {
                    Task {
                        changeIntro()
                        try? await viewModelCoffeeshop.getPlans(coffeeshop_id: chosenShop.id)
                    }
                } label: {
                    Text("Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: size.width * 0.4)
                        .padding(.vertical, 15)
                        .background {
                            Capsule()
                                .fill(.black)
                        }
                }
                
            }
            
            if intro.introBlock == 3 {
                Button {
                    let _ = print(chosenShop.id)
                    Task {
                        try await viewModel.saveUserSubscription(chosenShopId: chosenShop.id, chosenPlan: chosenPlan.id)
                        
                    }
                } label: {
                    Text("GOTOVO")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: size.width * 0.4)
                        .padding(.vertical, 15)
                        .background {
                            Capsule()
                                .fill(.black)
                        }
                }
                
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview{
    GuideView()
}
