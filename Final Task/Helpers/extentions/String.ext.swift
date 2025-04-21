//
//  String.ext.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 15.04.2025.
//

import Foundation

extension String {
    var correctLetter: Bool {
        guard let first = self.first else { return false }
        let rest = self.dropFirst()
        return first.isUppercase && rest.allSatisfy { $0.isLowercase }
        
        func yearForm(_ number: Int) -> String {
            let mod10 = number % 10
            let mod100 = number % 100
            
            if mod10 == 1 && mod100 != 11 {
                return "год"
            } else if (2...4).contains(mod10) && !(12...14).contains(mod100) {
                return "года"
            } else {
                return "лет"
            }
        }
    }
}
