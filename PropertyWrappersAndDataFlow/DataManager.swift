//
//  DataManager.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 01/03/2023.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func saveUser(_ user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func removeUser(_ userManager: UserManager) {
        userManager.user.isRegistred = false
        userManager.user.name = ""
        userData = nil
    }
}
