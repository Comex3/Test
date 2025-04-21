//
//  DoctorsListCell.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import SwiftUI

struct DoctorCell: View {
    var user: User
    @State var isLike: Bool = false
    var selected: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .top) {
                if let avatar = user.avatar, let url = URL(string: avatar) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                        image.scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 60)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(user.lastName)")
                        .font(.system(size: 16, weight: .bold))
                    
                    HStack(spacing: 4) {
                        Text("\(user.firstName)")
                            .font(.system(size: 16, weight: .bold))
                        Text(user.patronymic ?? "")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding(.bottom, 5)
                    
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(index < user.rank ? .pink : .gray)
                                .font(.system(size: 13))
                                .frame(width: 16, height: 12)
                        }
                    }
                    .padding(.bottom, 5)
                    
                    HStack {
                        
                        if ((user.specialization.first?.name) != nil) {
                            Text(user.specialization.first?.name ?? "")
                                .font(.caption)
                                .foregroundColor(.tabGray)
                                .padding(.trailing, -10)
                            Text("・")
                                .foregroundColor(.tabGray)
                            Text("cтаж \(user.category) \(user.category.yearForm)")
                                .font(.caption)
                                .foregroundColor(.tabGray)
                                .padding(.leading, -10)
                        } else {
                            Text("cтаж \(user.category) \(user.category.yearForm)")
                                .font(.caption)
                                .foregroundColor(.tabGray)
                        }
                        
                        
                    }
                    
                    var prices: [Int] {
                        [user.hospitalPrice, user.textChatPrice, user.videoChatPrice, user.homePrice]
                    }
                    
                    var minPrice: Int? { prices.filter { $0 > 0 }.min()
                    }
                    
                    
                    
                    Text("от \(minPrice?.space() ?? "5") ₽")
                        .font(.system(size: 16, weight: .bold))
                    
                }
                
                Spacer()
                
                Button(action: {
                    isLike.toggle()
                }) {
                    Image(systemName: isLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(isLike ? .pink : .gray)
                        .frame(width: 25, height: 23)
                }
            }
            
            
            Button(action: {
                selected()
            }) {
                Text(((user.specialization.first?.isModerated) != nil) ? "Записаться" : "Нет свободного расписания")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(((user.specialization.first?.isModerated) != nil) ? Color.doctorPink : Color.doctorGray)
                    .foregroundColor(((user.specialization.first?.isModerated) != nil) ? .white : .black)
                    .cornerRadius(10)
            }
        }
        .padding(.all)
        .background(Color(.white))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }

}



#Preview {
    DoctorCardView()
}


