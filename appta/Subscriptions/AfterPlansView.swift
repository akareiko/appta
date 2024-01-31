//
//  AfterPlansView.swift
//  appta
//
//  Created by Legato on 30.01.2024.
//

import SwiftUI

struct AfterPlansView: View {
    @State private var stoimost: String = "1199.99/month"
    @State private var gradientColors: [Color] = [Color("starbucks-lightgold"), Color("starbucks-silver")]
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Text(stoimost)
            
            HStack {
                VStack {
                    Text(Image(systemName: "mug.fill"))
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                    
                    Text(Image(systemName: "gift"))
                        .foregroundColor(.black)
                        .font(.title3)
                        .frame(width: 30, height: 30)
                    
                    Text(Image(systemName: "tengesign.circle"))
                        .foregroundColor(.black)
                        .font(.title3)
                        .frame(width: 30, height: 30)
                }
                
                VStack {
                    Text("Три бесплатных напитка")
                        .foregroundColor(.black)
                        .font(.caption)
                        .frame(height: 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Каждый 12-ый напиток в подарок")
                        .foregroundColor(.black)
                        .font(.caption)
                        .frame(height: 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Накапливайте бонусы")
                        .foregroundColor(.black)
                        .font(.caption)
                        .frame(height: 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 20)
            }
        }
        
        HStack {
            Image("visa")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 30, height: 30)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial)
                    .frame(width: 270, height: 50)
                    .gradientStroke(colors: gradientColors, lineWidth: 1)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
                            self.gradientColors = [Color("starbucks-silver"), Color("starbucks-lightgold")]
                        }
                    }
                VStack {
                    Text("Visa •••• 4593")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("•••• •••• •••• 4593. Expires: 05/25")
                        .font(.caption2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                }
                .padding(.leading, 20)
                
                Image(systemName: "chevron.forward")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 20)
            }
            .frame(width: 270)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
            .frame(height: 40)
        
        Toggle(isOn: $isOn) {
            Text("Я не согласен ни с одним словом, которое вы говорите, но готов умереть за ваше право это говорить")
                .foregroundColor(.black)
                .font(.caption)
                .padding(.leading, 20)
        }
        .toggleStyle(iOSCheckboxToggleStyle())
        
        Text("Прочитать пользовательское соглашение")
            .foregroundColor(Color("starbucks-lightgold"))
            .font(.caption2)
            .padding()
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: withAnimation {{
            configuration.isOn.toggle()
        }}) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .symbolEffect(.pulse)
                    .frame(width: 30, height: 30)
                
                configuration.label
                    .multilineTextAlignment(.leading)
            }
        }
        .contentTransition(.symbolEffect(.replace))
        .foregroundColor(Color("starbucks-lightgold"))
        .buttonStyle(NoTapAnimationStyle())
    }
}
#Preview {
    AfterPlansView()
}
