//
//  AccountListViewModel.swift
//  SwiftClient
//
//  Created by Mohammad Azam on 4/14/21.
//

import Foundation

enum DataFetchResult {
    case loading
    case success([AccountViewModel])
    case failure(Error)
}

class AccountListViewModel: ObservableObject {
    @Published var result: DataFetchResult = .loading
    
    func getAllAccounts() {
        
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jsonwebtoken") else {
            return
        }
        
        Webservice().getAllAccounts(token: token) { (result) in
            switch result {
            case .success(let accounts):
                DispatchQueue.main.async {
                    self.result = .success(accounts.map(AccountViewModel.init))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.result = .failure(error)
                }
            }
        }
    }
}



struct AccountViewModel {
    
    let account: Account
    
    let id = UUID()
    
    var name: String {
        return account.name
    }
    
    var balance: Double {
        return account.balance
    }
}


