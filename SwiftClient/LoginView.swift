//
//  LoginView.swift
//  SwiftClient
//
//  Created by Shujaat-Hussain on 12/5/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM: LoginViewModel
    @ObservedObject var accountListVM: AccountListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Text("Enter Your Login Credentials")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: loginVM.isAuthenticated ? "lock.fill" : "lock.open")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    TextField("Username", text: $loginVM.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $loginVM.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Button("Login") {
                            loginVM.login()
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.teal)
                        .cornerRadius(8)
                        
                        Spacer()
                        
                        Button("Signout") {
                            loginVM.signout()
                        }
                        .frame(width: 100, height: 50)
                        .background(Color.red)
                        .cornerRadius(8)
                    }
                    .foregroundColor(.white)
                }
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(16)
                .shadow(color: .indigo.opacity(0.3), radius: 8, x: 0, y: 4)
                
                Spacer()
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .center)
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    let mockLoginVM = LoginViewModel()
    let mockAccountListVM = AccountListViewModel()
    LoginView(loginVM: mockLoginVM, accountListVM: mockAccountListVM)
}
