import SwiftUI

struct GuideView: View{
    @State private var activeIntro: PageIntro = pageIntros[0]
    
    var body: some View {
        GeometryReader{
            let size = $0.size
            IntroView(intro: $activeIntro, size: size)
            .padding(15)
        }
    }
}

struct PaymentData: Identifiable, Codable {
    var id: String = UUID().uuidString
    var chosenShop: String
    var chosenPlan: String
}

struct IntroView: View {
    @Binding var intro: PageIntro
    var size: CGSize
    @State private var showView: Bool = false
    @State private var hideWholeView: Bool = false
    @State private var chosenShop: String = ""
    @State private var chosenPlan: String = ""
    
    var body: some View {
        VStack{
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
            }
            .offset(y: showView ? 0 : -size.height / 2)
            if !intro.displaysAction {
                VStack {
                    //                intro.introBlock
                    if intro.introBlock == 1 {
                        BeforePlansView(haha: $chosenShop).environmentObject(GlobalWars())
                    }
                    else if intro.introBlock == 2 {
                        PlansView(planplans: ModelModelData().plansplans, haha: $chosenPlan)
                    }
                    else if intro.introBlock == 3{
                        AfterPlansView()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    CustomIndicatorView(totalPages: pageIntros.count, currentPage: pageIntros.firstIndex(of: intro) ?? 0)
                }
                .frame(width: UIScreen.main.bounds.width - 70, height: 530)
                .offset(x: showView ? 0 : size.height / 2)
                .opacity(showView ? 1 : 0)
                
                VStack {
                    VStack {
                        Text(chosenShop)
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(chosenPlan)
                            .foregroundColor(.black)
                            .font(.title3)
                    }
                    .frame(height: 50)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Button {
                        changeIntro()
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
                .frame(maxWidth: .infinity, alignment: .center)
                .offset(y: showView ? 0 : size.height / 2)
                .opacity(showView ? 1 : 0)
            }
            else {
                VStack {
                    PaymentView()
                }
                .frame(width: UIScreen.main.bounds.width - 70, height: 530)
                .offset(x: showView ? 0 : size.height / 2)
                .opacity(showView ? 1 : 0)
                
                VStack {
                    VStack {
                        Text(chosenShop)
                            .foregroundColor(.black)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(chosenPlan)
                            .foregroundColor(.black)
                            .font(.title3)
                    }
                    .frame(height: 50)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Button {
                        let _ = print(chosenShop)
                        let _ = print(chosenPlan)
                        savePaymentData()
                        
                    } label: {
                        Text("Oplata")
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
                .frame(maxWidth: .infinity, alignment: .center)
                .offset(y: showView ? 0 : size.height / 2)
                .opacity(showView ? 1 : 0)
            }
        }
        .offset(x: hideWholeView ? size.height / 2 : 0)
        .opacity(hideWholeView ? 0 : 1)
        .ignoresSafeArea()
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
        .onAppear{
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)){
                showView = true
            }
        }
    }
    
    func savePaymentData() {
        let dataArray: [PaymentData] = [PaymentData(chosenShop: "hahaha", chosenPlan: "kekeke"),
                                        PaymentData(chosenShop: "hahaha", chosenPlan: "kekeke")
        ]

        do {
            let jsonData = try JSONEncoder().encode(dataArray)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
                
                if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = documentsDirectory.appendingPathComponent("selectedPlanz.json")
                    
                    try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
                    
                    print("File saved at: \(fileURL)")
                }
            }
            
        } catch {
            print("Error saving payment data: \(error)")
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

#Preview{
    GuideView()
}
