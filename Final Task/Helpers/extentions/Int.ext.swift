//
//  Int.ext.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 15.04.2025.
//

import Foundation

extension Int {
    func space() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: self)) ?? String(self)
    }
    
    var yearForm: String {
        let mod10 = self % 10
        let mod100 = self % 100
        
        if mod10 == 1 && mod100 != 11 {
            return "год"
        } else if (2...4).contains(mod10) && !(12...14).contains(mod100) {
            return "года"
        } else {
            return "лет"
        }
    }
}
