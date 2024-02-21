//
//  AuthSettingsView.swift
//  appta
//
//  Created by Legato on 12.02.2024.
//

import SwiftUI


struct AuthSettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log Out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            .foregroundColor(.black)
            
            Button(role: .destructive) {
                Task {
                    do {
                        try await viewModel.deleteAccount()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Delete Account")
            }
            if viewModel.authProviders.contains(.email) {
                emailSection
            }
            if viewModel.authUser?.isAnonymous == true {
                anonymousSection
            }
        }
        .onAppear {
            viewModel.loadAuthProviders()
            viewModel.loadAuthUser()
        }
        .navigationTitle("Settings")
    }
}

extension AuthSettingsView {
    private var emailSection: some View {
        Section {
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET")
                    } catch {
                        print(error)
                    }
                }
            }
            .foregroundColor(.black)
            
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("PASSWORD UPDATED")
                    } catch {
                        print(error)
                    }
                }
            }
            .foregroundColor(.black)
            
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("EMAIL UPDATED")
                    } catch {
                        print(error)
                    }
                }
            }
            .foregroundColor(.black)
        } header: {
            Text("Email functions")
        }
    }
    
    private var anonymousSection: some View {
        Section {
            Button("Link Google Account") {
                Task {
                    do {
                        print("LINKED GOOGLE ACCOUNT")
                    } 
//                    catch {
//                        print(error)
//                    }
                }
            }
            .foregroundColor(.black)
            
            Button("Link Apple Account") {
                Task {
                    do {
                        print("LINKED APPLE ACCOUNT")
                    } 
//                    catch {
//                        print(error)
//                    }
                }
            }
            .foregroundColor(.black)
            
            Button("Link Email") {
                Task {
                    do {
                        try await viewModel.linkEmailAccount()
                        print("LINKED EMAIL")
                    } catch {
                        print(error)
                    }
                }
            }
            .foregroundColor(.black)
        } header: {
            Text("Create account")
        }
    }
}

#Preview {
    NavigationStack {
        AuthSettingsView(showSignInView: .constant(false))
    }
}
