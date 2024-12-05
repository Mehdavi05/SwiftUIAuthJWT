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
        GeometryReader { geometry in
            VStack {
                Form {
                    HStack {
                        Spacer()
                        Image(systemName: loginVM.isAuthenticated ? "lock.fill" : "lock.open")
                            .font(.title)
                            .foregroundColor(.teal)
                    }
                    
                    TextField("Username", text: $loginVM.username)
                    SecureField("Password", text: $loginVM.password)
                    
                    HStack {
                        Spacer()
                        Button("Login") {
                            loginVM.login()
                        }
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("Signout") {
                            loginVM.signout()
                        }
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.34) // Adjust size of the form
                .background(Color.gray.opacity(0.2))
                .cornerRadius(16)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center Form
            }
        }
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
        .embedInNavigationView()
    }
}

#Preview {
    LoginView()
}
