//
//  SettingsView.swift
//  appta
//
//  Created by Legato on 16.01.2024.
//

import SwiftUI

@MainActor
final class SettingsModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func saveUserInfo(firstName: String, secondName: String) async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        try await UserManager.shared.updateUserInfo(userId: authDataResult.uid, firstName: firstName, secondName: secondName)
    }
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsModel()
    @Binding var showSignInView: Bool
    
    @State private var firstName: String = ""
    @State private var secondName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var birthDate: String = ""
    @FocusState private var focusedField: Bool
    
    @FocusState private var isFocused1: Bool
    @FocusState private var isFocused2: Bool
    @FocusState private var isFocused3: Bool
    @FocusState private var isFocused4: Bool
    @FocusState private var isFocused5: Bool
    @AppStorage("hahaha") private var hahaha: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
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
                    Task {
                        do {
                            try viewModel.signOut()
                            showSignInView = true
                        } catch {
                            print(error)
                        }
                    }
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
            
            TextField("", text: $secondName, prompt: Text("Familia").foregroundColor(.black))
                .focused($isFocused2)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: isFocused2 ? 1 : 0)
                )
                .onTapGesture {
                    isFocused2 = true
                    secondName = ""
                }
                .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
                .foregroundColor(Color.black)
                .padding()
                .offset(y: -50)
            
            TextField("", text: $email, prompt: Text("Email").foregroundColor(.black))
                .focused($isFocused3)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: isFocused3 ? 1 : 0)
                )
                .onTapGesture {
                    isFocused3 = true
                    email = ""
                }
                .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
                .foregroundColor(Color.black)
                .padding()
                .offset(y: -80)
            
            TextField("", text: $phoneNumber, prompt: Text("Номер телефона").foregroundColor(.black))
                .focused($isFocused4)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: isFocused4 ? 1 : 0)
                )
                .onTapGesture {
                    isFocused4 = true
                    phoneNumber = ""
                }
                .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
                .foregroundColor(Color.black)
                .padding()
                .offset(y: -110)
            
            TextField("", text: $birthDate, prompt: Text("Дата рождения").foregroundColor(.black))
                .focused($isFocused5)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: isFocused5 ? 1 : 0)
                )
                .onTapGesture {
                    isFocused5 = true
                    birthDate = ""
                }
                .background(RoundedRectangle(cornerRadius: 15).fill(.ultraThinMaterial))
                .foregroundColor(Color.black)
                .padding()
                .offset(y: -140)
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
                Task {
                    try await viewModel.saveUserInfo(firstName: firstName, secondName: secondName)
                }
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
        .task {
            try? await viewModel.loadCurrentUser()
        }
    }
}


#Preview {
    SettingsView(showSignInView: .constant(false))
}
