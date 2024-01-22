//
//  SettingsView.swift
//  appta
//
//  Created by Legato on 16.01.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("firstName") private var firstName: String = ""
    @AppStorage("secondName") private var secondName: String = ""
    @AppStorage("email") private var email: String = ""
    @AppStorage("phoneNumber") private var phoneNumber: String = ""
    @AppStorage("birthDate") private var birthDate: String = ""
    @FocusState private var focusedField: Bool
    
    @FocusState private var isFocused1: Bool
    @FocusState private var isFocused2: Bool
    @FocusState private var isFocused3: Bool
    @FocusState private var isFocused4: Bool
    @AppStorage("hahaha") private var hahaha: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Circle()
                    .frame(width: 35)
                    .foregroundColor(.black)
                    .offset(CGSize(width: -10.0, height: 0.0))
                    .overlay(
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                            .offset(CGSize(width: -10.0, height: 0.0))
                    )
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Log Out")
                    .padding(.horizontal, 20)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .font(.title2)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                    .offset(CGSize(width: -10.0, height: 0.0))
            }
            .padding(.horizontal, 10)
        }
        
        Text("Редактировать личные данные")
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
        TextField("", text: $firstName, prompt: Text("Имя").foregroundColor(.black))
            .focused($isFocused1)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: isFocused1 ? 1 : 0)
            )
            .onTapGesture {
                isFocused1 = true
                firstName = ""
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
            .foregroundColor(Color.black)
            .padding()
            .offset(y: -20)
        
        TextField("", text: $email, prompt: Text("Email").foregroundColor(.black))
            .focused($isFocused2)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: isFocused2 ? 1 : 0)
            )
            .onTapGesture {
                isFocused2 = true
                email = ""
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
            .foregroundColor(Color.black)
            .padding()
            .offset(y: -50)
        
        TextField("", text: $phoneNumber, prompt: Text("Номер телефона").foregroundColor(.black))
            .focused($isFocused3)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: isFocused3 ? 1 : 0)
            )
            .onTapGesture {
                isFocused3 = true
                phoneNumber = ""
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
            .foregroundColor(Color.black)
            .padding()
            .offset(y: -80)
        
        TextField("", text: $birthDate, prompt: Text("Дата рождения").foregroundColor(.black))
            .focused($isFocused4)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: isFocused4 ? 1 : 0)
            )
            .onTapGesture {
                isFocused4 = true
                birthDate = ""
            }
            .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
            .foregroundColor(Color.black)
            .padding()
            .offset(y: -110)
        HStack {
            Text("Предлагаем вам уникальные акции в нашем приложении по случаю дня рождения ")
                .font(.caption)
                .fontWeight(.bold)
            +
            Text(Image(systemName: "questionmark.circle"))
                .font(.caption)
                .fontWeight(.bold)
        }
        .offset(y: -110)
        .padding(.horizontal, 16)
        
        Spacer()
        
        Button(action: {
            
        })
        {
            HStack {
                VStack {
                    Text("Удалить аккаунт")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Это действие нельзя отменить")
                        .foregroundColor(.black)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                        
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .foregroundColor(.black)
            }
        }
        .padding()
        
        Button(action: {
            
        })
        {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 350, height: 60)
                .foregroundColor(Color("starbucks-black"))
                .overlay(
                    Text("Сохранить")
                        .fontWeight(.bold)
                )
        }
        .padding()
    }
}


#Preview {
    SettingsView()
}




//Form {
//    Section(header: Text("First Name")) {
//        TextField("First Name", text: $deviceName)
//            .listRowSeparator(.hidden)
//            .listRowBackground(Color("starbucks-neutral"))
//    }
//}
//.offset(y: 100)
//.foregroundColor(.white)
//.scrollContentBackground(.hidden)
//.scrollDisabled(true)
