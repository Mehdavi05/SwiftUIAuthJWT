//
//  MainView.swift
//  SwiftClient
//
//  Created by Shujaat-Hussain on 12/5/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var accountListVM = AccountListViewModel()
    
    var body: some View {
        NavigationView {
            if loginVM.isAuthenticated {
                ContentView(loginVM: loginVM, accountListVM: accountListVM)
            } else {
                LoginView(loginVM: loginVM, accountListVM: accountListVM)
            }
        }
    }
}

#Preview {
    MainView()
}
