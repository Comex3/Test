//
//  NetworkManager.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func getData() -> [User]
}

class NetworkManager: NetworkProtocol {
    
    
    func getData() -> [User] {
        guard let url = Bundle.main.url(forResource: "test", withExtension: "json") else {
            fatalError("no file")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode(UserResponse.self, from: data)
            return users.data.users
        } catch {
            print(error)
        }
        
        return []
    }
}
