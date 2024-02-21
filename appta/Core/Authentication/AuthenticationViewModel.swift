//
//  AuthenticationViewModel.swift
//  appta
//
//  Created by Legato on 12.02.2024.
//

import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
    func signInAnonymous() async throws {
        let authDataResult = try await AuthenticationManager.shared.signInAnonymous()
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)
    }
}
