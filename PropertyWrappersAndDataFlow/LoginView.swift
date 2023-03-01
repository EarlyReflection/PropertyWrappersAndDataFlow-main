//
//  LoginView.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
   
// перенести в другой класс
    var valid: Bool {
        if userManager.user.name.count > 2 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 30)
                Text("\(userManager.user.name.count)")
                    .foregroundColor(valid ? .green : .red)
                    .frame(width: 30)
            }
            Button(action: registerUser) {
                Image(systemName: "checkmark.circle")
                Text("Ok")
            }
            .disabled(!valid)
        }
        .padding()
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistred.toggle()
            DataManager.shared.saveUser(userManager.user)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
