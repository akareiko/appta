import SwiftUI
import UIKit
import CodeScanner
import FirebaseFirestore
import FirebaseFirestoreSwift

class GlobalVars: ObservableObject {
    @Published var str: Bool = false
    @Published var nestr: Bool = false
    
    @Published var abc: Bool = false
    
    @Published var favouritesArray: [OrderModel] = []
}

struct Plan: Identifiable, Codable {
    let id: String
    let plan_name: String
    let plan_price: String
    let plan_description: String
    let plan_image: String
    let plan_features: [String]
    let plan_features_image: [String]
}

struct Coffeeshop: Identifiable, Codable {
    let id: String
    let name: String
    let image_url: String
    let description: String
    let color: String
    let pattern: String
}

struct ChosenCoffeeshop: Identifiable, Codable {
    let id: String
    let coffeeshopId: String
    let planId: String
    let dateCreated: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case coffeeshopId = "coffeeshop_id"
        case planId = "plan_id"
        case dateCreated = "date_created"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.coffeeshopId = try container.decode(String.self, forKey: .coffeeshopId)
        self.planId = try container.decode(String.self, forKey: .planId)
        self.dateCreated = try container.decode(String.self, forKey: .dateCreated)
    }
}

struct Subscription: Identifiable, Codable {
    let id: String
    let coffeeshop: Coffeeshop
    let plan: Plan
}

final class CoffeeshopManager {
    static let shared = CoffeeshopManager()
    private init() { }
    
    private let coffeeshopCollection = Firestore.firestore().collection("coffeeshops")
    private let userCollection = Firestore.firestore().collection("users")
    
    private func coffeeshopDocument(coffeeshopId: String) -> DocumentReference {
        coffeeshopCollection.document(coffeeshopId)
    }
    
    private func planDocument(coffeeshopId: String, planId: String) -> DocumentReference {
        planCollection(coffeeshop_id: coffeeshopId).document(planId)
    }
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func getAllCoffeeshops() async throws -> [Coffeeshop] {
        let snapshot = try await coffeeshopCollection.getDocuments()
        
//        var coffeeshops: [Coffeeshop] = []
//        for document in snapshot.documents {
//            let coffeeshop = try document.data(as: Coffeeshop.self)
//            coffeeshops.append(coffeeshop)
//        }
        
        let coffeeshops = try snapshot.documents.map({ document in
            try document.data(as: Coffeeshop.self)
        })
        
        return coffeeshops
    }
    
    func getAllUserChosenCoffeeshops(userId: String) async throws -> [Coffeeshop] {
        let snapshot = try await userChosenCoffeeshopsCollection(userId: userId).getDocuments()
        var coffeeshops: [Coffeeshop] = []
        for document in snapshot.documents {
            let tempChosenCoffeeshop = try document.data(as: ChosenCoffeeshop.self)
            let tempCoffeeshop = try await coffeeshopDocument(coffeeshopId: tempChosenCoffeeshop.coffeeshopId).getDocument(as: Coffeeshop.self)
            coffeeshops.append(tempCoffeeshop)
        }
        return coffeeshops
    }
    
    func getAllUserChosenPlans(userId: String) async throws -> [Plan] {
        let snapshot = try await userChosenCoffeeshopsCollection(userId: userId).getDocuments()
        var plans: [Plan] = []
        for document in snapshot.documents {
            let tempChosenCoffeeshop = try document.data(as: ChosenCoffeeshop.self)
            let tempPlan = try await planDocument(coffeeshopId: tempChosenCoffeeshop.coffeeshopId, planId: tempChosenCoffeeshop.planId).getDocument(as: Plan.self)
            plans.append(tempPlan)
        }
        return plans
    }
    
    func getUserSubscriptions(userId: String) async throws -> [Subscription] {
        let snapshot = try await userChosenCoffeeshopsCollection(userId: userId).getDocuments()
        var subscriptionArr: [Subscription] = []
        for document in snapshot.documents {
            let tempChosenCoffeeshop = try document.data(as: ChosenCoffeeshop.self)
            let tempCoffeeshop = try await coffeeshopDocument(coffeeshopId: tempChosenCoffeeshop.coffeeshopId).getDocument(as: Coffeeshop.self)
            let tempPlan = try await planDocument(coffeeshopId: tempChosenCoffeeshop.coffeeshopId, planId: tempChosenCoffeeshop.planId).getDocument(as: Plan.self)
            let subscription: Subscription = Subscription(id: UUID().uuidString, coffeeshop: tempCoffeeshop, plan: tempPlan)
            subscriptionArr.append(subscription)
        }
        return subscriptionArr
    }
    
//    func getAllUserChosenPlans(userId: String) async throws -> [Plan] {
//        let snapshot = try await userChosenCoffeeshopsCollection(userId: String).getDocuments()
//        var plan: Plan
//        for document in snapshot.documents {
//
//        }
//    }
    
    func getCoffeeshopPlans(coffeeshop_id: String) async throws -> [Plan] {
        let snapshot = try await planCollection(coffeeshop_id: coffeeshop_id).getDocuments()
        
        var plans: [Plan] = []
        for document in snapshot.documents {
            let temp = try document.data(as: Plan.self)
            plans.append(temp)
        }
        return plans
    }
    
    private func userChosenCoffeeshopsCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("chosen_coffeeshops")
    }
    
    private func planCollection(coffeeshop_id: String) -> CollectionReference {
        coffeeshopDocument(coffeeshopId: coffeeshop_id).collection("plans")
    }
}

@MainActor
final class CoffeeshopViewModel: ObservableObject {
    @Published private(set) var coffeeshops: [Coffeeshop] = []
    @Published private(set) var plans: [Plan] = []
    @Published private(set) var subscriptions: [Subscription] = []
    
    func getUserChosenCoffeeshops() async throws {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
        self.coffeeshops = try await CoffeeshopManager.shared.getAllUserChosenCoffeeshops(userId: authDataResult.uid)
        let defaultCoffeeshop = Coffeeshop(id: "default_id", name: "Default Coffeeshop", image_url: "default_image_url", description: "Default Description", color: "default_color", pattern: "default_pattern")
        self.coffeeshops.append(defaultCoffeeshop)
    }
    
    func getUserChosenPlans() async throws {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
        self.plans = try await CoffeeshopManager.shared.getAllUserChosenPlans(userId: authDataResult.uid)
    }
    
    func getCoffeeshops() async throws {
        self.coffeeshops = try await CoffeeshopManager.shared.getAllCoffeeshops()
    }
    
    func getPlans(coffeeshop_id: String) async throws {
        self.plans = try await CoffeeshopManager.shared.getCoffeeshopPlans(coffeeshop_id: coffeeshop_id)
    }
    
    func getSubscriptions() async throws {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
        self.subscriptions = try await CoffeeshopManager.shared.getUserSubscriptions(userId: authDataResult.uid)
        self.subscriptions.append(Subscription(id: UUID().uuidString, coffeeshop: Coffeeshop(id: "default_id", name: "Default Coffeeshop", image_url: "default_image_url", description: "Default Description", color: "default_color", pattern: "default_pattern"), plan: Plan(id: "", plan_name: "", plan_price: "", plan_description: "", plan_image: "", plan_features: [], plan_features_image: [])))
    }
}

struct ContentView: View {
    @State var selectedTab: Tab = .house

    @ObservedObject var globalVars = GlobalVars()
    
    @State private var keks: Double = 1.0
    
    @Environment(\.isPresented) private var isPresented
    
    @State var isPresentingScanner = false
    
    @State var animate = false
    @State var endSplash = false
    
    @State private var showSignInView: Bool = false
    
    @StateObject private var viewModelCoffeeshop = CoffeeshopViewModel()
    @StateObject private var viewModelDrinks = DrinksModelViewModel()
    
    var body: some View {
        ZStack {
            
            VStack {
                switch selectedTab {
                case .house:
                    HomeView(globalVars: globalVars, viewModelCoffeeshop: viewModelCoffeeshop, str: $globalVars.str, nestr: $globalVars.nestr)
                case .magnifyingglass:
                    SearchView()
                case .qrcode:
                    CodeScannerView(
                        codeTypes: [.qr],
                        completion: {
                            result in
                            if case .success(_) = result {
                                self.isPresentingScanner = false
                            }
                        }
                    )
                case .plus:
                    SubscriptionUpdatedView()
                case .person:
                    NavigationStack {
                        Profile(showSignInView: $showSignInView)
                    }
                }
            }
            VStack {
                Spacer()
                if(globalVars.nestr == false) {
                    CustomTabBar(selectedTab: $selectedTab, str: $globalVars.str)
                        .opacity(keks)
//                        .scaleEffect(keks)
                        .animation(Animation.spring(duration: 1.0), value: keks)
                        .onAppear {self.keks = 1.0}
                        .onDisappear {self.keks = 0.0}
                }
            }
            
            ZStack{
                Color("bg")
                
                Image("alishlogo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 285, height: 285)
                
                // scalling View...
                    .scaleEffect(animate ? 3 : 1)
                //setting width to avoid over size ...
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            // hiding view after finished...
            .opacity(endSplash ? 0 : 1)
        }
        .task{
            try? await viewModelCoffeeshop.getCoffeeshops()
            try? await viewModelCoffeeshop.getPlans(coffeeshop_id: "mqkKxYkBMX30XJaXgkWn")
        }
        .onAppear() {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        })
    }
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.25){
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            withAnimation(Animation.easeOut(duration: 0.55)){
                animate.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.45)){
                endSplash.toggle()
            }
        }
    }
}
                      
                      

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

