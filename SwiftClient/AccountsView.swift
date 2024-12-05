//
//  ContentView.swift
//  SwiftClient
//
//  Created by Shujaat-Hussain on 12/5/24.
//

import SwiftUI

struct AccountsView: View {
    @ObservedObject var loginVM: LoginViewModel
    @ObservedObject var accountListVM: AccountListViewModel
    
    var body: some View {
        VStack {
            switch accountListVM.result {
            case let .success(accounts):
                List(accounts, id: \.id) { account in
                    HStack {
                        Text("\(account.name)")
                        Spacer()
                        Text(String(format: "$%.2f", account.balance))
                    }
                }.listStyle(PlainListStyle())
                
                case let .failure(message):
                VStack {
                    Text(message.localizedDescription)
                }
                
            case .loading:
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(2)
                    
                    Text("Loading...")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                .transition(.opacity) // Smooth transition effect
            }
        }
        .navigationTitle("Accounts")
        .onAppear {
            accountListVM.getAllAccounts()
        }
    }
}

#Preview {
    AccountsView(loginVM: LoginViewModel(),
                accountListVM: AccountListViewModel())
}
