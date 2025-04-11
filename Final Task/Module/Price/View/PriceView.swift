//
//  PriceView.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 16.04.2025.
//

import SwiftUI

struct PriceView: View {
    var viewModel: ViewModel
    var userID: String
    
    var body: some View {
        if let user = viewModel.checkData.first(where: { $0.id == userID }) {
            VStack(alignment: .leading, spacing: 16) {
                    PurchaceView(title: "Видеоконсультация", time: "30 мин", price: user.videoChatPrice)
                    PurchaceView(title: "Чат с врачом", time: "30 мин", price: user.textChatPrice)
                    PurchaceView(title: "Приём в клинике", time: "В клинике", price: user.hospitalPrice)
                    PurchaceView(title: "Приём на дому", time: "На дому", price: user.homePrice)
            }
            .padding()
            .navigationTitle("Стоимость услуг")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.mainBackground)
        }
    }
}

struct PurchaceView: View {
    let title: String
    let time: String
    let price: Int
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: .bold))
        HStack {
            Text(time)
            
            Spacer()
            
            Text("\(price.space()) ₽")
        }
        .padding()
        .ignoresSafeArea()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
