import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
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
                        Image(systemName: "gear")
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
                                    .foregroundColor(Color("starbucks-white"))
                                    .overlay(){
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("starbucks-lightgold"), Color("starbucks-black")]), startPoint: .leading, endPoint: .trailing), lineWidth: 4)
                                            .frame(width: UIScreen.main.bounds.width - 40, height: 150)
                //                        Text("hehehaha")
                                        HStack {
                                            Image(systemName: "camera.filters")
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
                                                        .foregroundColor(Color("starbucks-rewardgold"))
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
                    List {
                        NavigationLink(destination: PaymentMethodsView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .frame(width: 30, height: 30)
                                Text("Способы оплаты")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }

                        NavigationLink(destination: SomeOtherView()) {
                            HStack {
                                Image(systemName: "map")
                                    .frame(width: 30, height: 30)
                                Text("Мои адреса ")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }

                        NavigationLink(destination: AnotherView()) {
                            HStack {
                                Image(systemName: "bag")
                                    .frame(width: 30, height: 30)
                                Text("История заказов")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }
                        
                        NavigationLink(destination: AnotherView()) {
                            HStack {
                                Image(systemName: "bell")
                                    .frame(width: 30, height: 30)
                                Text("Уведомления")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }
                        
                        NavigationLink(destination: AnotherView()) {
                            HStack {
                                Image(systemName: "poweroutlet.type.d")
                                    .frame(width: 30, height: 30)
                                Text("Ввести промкод")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }
                        
                        NavigationLink(destination: AnotherView()) {
                            HStack(){
                                Image(systemName: "tengesign")
                                    .frame(width: 30, height: 30)
                                Text("Язык интерфейса")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }
                    }
                    .frame(minHeight: 100 * 3)
                    .scrollContentBackground(.hidden)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 290)
                            .offset(y: 18)
                    )
                    .scrollDisabled(true)
                    
                    List {
                        NavigationLink(destination: PaymentMethodsView()) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .frame(width: 30, height: 30)
                                Text("Написать в поддержку")
                                Spacer()
                            }
                            .listRowBackground(Color("starbucks-white"))
                            .listRowSeparator(.hidden)
                        }
                    }
                    .frame(minHeight: 100 * 3)
                    .scrollContentBackground(.hidden)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
                            .offset(y: -90)
                    )
                    .scrollDisabled(true)
                }
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
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

