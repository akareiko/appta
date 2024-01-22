
import SwiftUI

struct GradientStrokeModifier: AnimatableModifier {
    var colors: [Color]
    var lineWidth: CGFloat

    var animatableData: [Color] {
        get { colors }
        set { colors = newValue }
    }

    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: lineWidth)
        )
    }
}

extension View {
    func gradientStroke(colors: [Color], lineWidth: CGFloat) -> some View {
        self.modifier(GradientStrokeModifier(colors: colors, lineWidth: lineWidth))
    }
}

struct ProfileView: View {
    @State private var gradientColors: [Color] = [Color("starbucks-lightgold"), Color("starbucks-black")]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                HStack {
                    Circle()
                        .foregroundColor(.clear)
                        .frame(width: 70, height: 70)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 25)

                    Text("Assylzhan T.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .offset(x: -25)

                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                            .font(.title2)
                    }
                    .frame(width: 70, height: 70)
                    .padding(.trailing, 25)
                }

                VStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 150)
//                    .foregroundColor(Color("starbucks-black"))
//                                    .foregroundColor(Color("starbucks-white"))
                        .shadow(radius: 3)
                        .foregroundColor(Color.white)
                        .overlay(){
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color.clear)
                                .gradientStroke(colors: gradientColors, lineWidth: 1)
                                .onAppear {
                                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
                                        self.gradientColors = [Color("starbucks-black"), Color("starbucks-lightgold")]
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width - 40, height: 150)
                                .onReceive([self.gradientColors].publisher.first()) { _ in
                                                    // Trigger redraw when gradientColors change
                                                }
//                        Text("hehehaha")
                        HStack {
                            Image(systemName: "camera.filters")
                                .symbolEffect(.pulse)
                                .foregroundColor(Color("starbucks-black"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(maxHeight: .infinity, alignment: .top)
                                .font(.title)
                                .fontWeight(.bold)
//                                .foregroundColor(.white)
                                .foregroundColor(Color("starbucks-black"))
                                .padding()
                            
                            NavigationLink(destination: HowToEarnView()) {
                                HStack {
                                    Text("как накопить")
        //                                .foregroundColor(.white)
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
//                            .foregroundColor(.white)
                            .foregroundColor(Color("starbucks-black"))
                            .padding()
                            .font(.title3)
                    }
                    
                }
                .padding(.top, 20)

                VStack {
                    ZStack {
                        VStack {
                            Color(.clear)
                        }
                        .frame(width: 370, height: 390)
                        .background(Color.gray.brightness(0.41))
                        .cornerRadius(15)
                        .offset(y: -93)
                        VStack {
                            List {
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "creditcard")
                                            .frame(width: 30, height: 30)
                                        Text("Способ оплаты")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                                
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "map")
                                            .frame(width: 30, height: 30)
                                        Text("Мои адреса")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                                
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "bag")
                                            .frame(width: 30, height: 30)
                                        Text("История заказов")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                                
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "bell")
                                            .frame(width: 30, height: 30)
                                        Text("Уведомления")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                                
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "poweroutlet.type.d")
                                            .frame(width: 30, height: 30)
                                        Text("Ввести промокод")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                                
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "tengesign")
                                            .frame(width: 30, height: 30)
                                        Text("Язык интерфейса")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                            }
                            .frame(minHeight: 100 * 3)
                            .scrollContentBackground(.hidden)
                            //                    .background(Color("starbucks-ceramic"))
                            //                    .overlay(
                            //                        RoundedRectangle(cornerRadius: 15)
                            //                            .stroke(Color.black, lineWidth: 1)
                            //                            .frame(width: UIScreen.main.bounds.width - 40, height: 290)
                            //                            .offset(y: 18)
                            //                    )
                            .scrollDisabled(true)
                            
                            List {
                                HStack {
                                    NavigationLink(destination: AnotherView()) {
                                        Image(systemName: "tengesign")
                                            .frame(width: 30, height: 30)
                                        Text("Написать в поддержку")
                                        Spacer()
                                    }
                                }
                                //                            .listRowBackground(Color("starbucks-white"))
                                .listRowSeparator(.hidden)
                            }
                            .frame(minHeight: 100 * 3)
                            .scrollContentBackground(.hidden)
                            .scrollDisabled(true)
                        }
                    }
                }
            }
        }
    }
}

struct DetailsView: View {
    var body: some View {
        Text("Details View")
    }
}

struct BonusDetailsView: View {
    var body: some View {
        Text("Bonus Details View")
    }
}

struct PaymentMethodsView: View {
    var body: some View {
        Text("Payment Methods View")
    }
}

struct SomeOtherView: View {
    var body: some View {
        Text("Some Other View")
    }
}

struct AnotherView: View {
    var body: some View {
        Text("Another View")
    }
}

struct HowToEarnView: View {
    var body: some View {
        Text("Kak NAKOPIT??? View")
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

