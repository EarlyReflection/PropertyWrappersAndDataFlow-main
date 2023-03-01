//
//  UserManager.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//


import SwiftUI

final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    @AppStorage("user") private var userData: Data?
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var isRegistred = false
    var name = ""
}
