//
//  ViewModel.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import Foundation

@Observable
class ViewModel {
    var users = [User]()
    var network: NetworkProtocol
    
    
    init(network: NetworkProtocol) {
        self.network = network
        getData()
    }
    
    var checkData: [User] {
        users.filter { user in
            user.avatar != nil &&
            user.firstName.correctLetter /*&& user.lastName.correctLetter*/
        }
    }
    
    private func getData() {
        self.users = network.getData()
        
    }
}
