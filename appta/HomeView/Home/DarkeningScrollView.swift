import SwiftUI

struct DarkeningScrollView: View {
    @State private var scrollOffset: CGFloat = 0.0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ZStack {
                                Image("tortoise")
                                    .resizable()
                                    .frame(height: 300)
                                    .clipped()
                                    .overlay(
                                            LinearGradient(
                                                gradient: Gradient(colors: [Color.clear, Color.black.opacity(1.0)]),
                                                startPoint: .center,
                                                endPoint: .bottom
                                            )
                                        )
                                VStack {
                                    Text("Assylzhan Coffee")
                                        .foregroundColor(Color.white)
                                        .font(.title .weight(.bold))
                                    Text("Kabanbay Batyr st. 53")
                                        .foregroundColor(Color.gray)
                                        .font(.subheadline .weight(.bold))
                                }
                                .offset(y: 100)
                            }
                           
                            
                        }
                        VStack {
                            Text(
                            "In the verdant hamlet of Sploot, giraffes rode unicycles to purchase bubblegum-flavored broccoli from artisanal penguin vendors. Meanwhile, the local library was run by sentient cacti who insisted that books be read upside down and only on every other Tuesday. The town's most celebrated holiday, 'Reverse Day,' consisted of everyone wearing shoes on their hands and walking on their heads, while the resident squirrels narrated the entire event in fluent Shakespearean English from the rooftops."
                            )
                            .padding(20)
                        }
                        .foregroundColor(Color.black)
                        .font(.caption .weight(.bold))
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Circle()
                                    .frame(width: 60)
                                    .foregroundColor(.black)
                                    .overlay(
                                        Image(systemName: "chevron.backward")
                                            .foregroundColor(.white)
                                    )
                                
                            }
                        }
                    }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0.0

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct DarkeningScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DarkeningScrollView()
    }
}
