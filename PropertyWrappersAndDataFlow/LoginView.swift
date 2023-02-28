//
//  LoginView.swift
//  PropertyWrappersAndDataFlow
//
//  Created by Vladimir Dvornikov on 28/02/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var userName = ""
    @EnvironmentObject private var user: UserManager
   
// перенести в другой класс
    var valid: Bool {
        if userName.count > 2 {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userName)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 30)
                Text("\(userName.count)")
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
        if !userName.isEmpty {
            user.name = userName
            user.isRegistred.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
