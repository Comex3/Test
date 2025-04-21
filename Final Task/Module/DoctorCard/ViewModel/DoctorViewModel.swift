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
//    var searchText: String = ""
    
    
    init(network: NetworkProtocol) {
        self.network = network
        getData()
    }
    
    
    
    var checkData: [User] {
        users.filter { user in
            user.avatar != nil &&
            user.firstName.correctLetter
        }
    }

    
//    var filteredUsers: [User] {
//            if searchText.isEmpty {
//                return checkData
//            } else {
//                let words = searchText.lowercased().split(separator: " ").map { String($0) }
//                
//                return checkData.filter { user in
//                    let firstName = user.firstName.lowercased()
//                    let lastName = user.lastName.lowercased()
//                    let speciality = user.specialization.first?.name.lowercased() ?? ""
//                    
//                    let fields: [String] = [firstName, lastName, speciality]
//                    
//                    return words.allSatisfy { word in
//                        fields.contains { $0.contains(word) }
//                    }
//                }
//            }
//        }
    
    private func getData() {
        self.users = network.getData()
    }
}
