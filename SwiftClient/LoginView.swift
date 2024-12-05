//
//  LoginView.swift
//  SwiftClient
//
//  Created by Shujaat-Hussain on 12/5/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM = LoginViewModel()
    @ObservedObject var accountListVM = AccountListViewModel()
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    Spacer()
                    Image(systemName: loginVM.isAuthenticated ? "lock.fill": "lock.open")
                }
                TextField("Username", text: $loginVM.username)
                SecureField("Password", text: $loginVM.password)
                HStack {
                    Spacer()
                    Button("Login") {
                        loginVM.login()
                    }
                    Button("Signout") {
                        loginVM.signout()
                    }
                    Spacer()
                }
            }.buttonStyle(PlainButtonStyle())
        } .onAppear(perform: {
            
        })
        .navigationTitle("Login")
        .embedInNavigationView()
    }
}

#Preview {
    LoginView()
}
