//
//  DetailView.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import SwiftUI

struct DetailView: View {
    var viewModel: ViewModel
    var userID: String
    
    var body: some View {
        if let user = viewModel.checkData.first(where: { $0.id == userID }) {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        if let avatar = user.avatar, let url = URL(string: avatar) {
                            AsyncImage(url: url) { image in
                                image.resizable()
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
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        InfoView(image: "clock", text: "Опыт работы: \(user.category) \(user.category.yearForm)")
                        InfoView(image: "cross.case", text: "\(user.scientificDegreeLabel)")
                        InfoView(image: "graduationcap", text: "\(user.higherEducation.first?.university ?? "ПТУ")")
                        InfoView(image: "location", text: "\(user.workExperience.first?.organization ?? "на дому")")
                        
                    }
                    
                    HStack {
                        Text("Стоимость услуг")
                            .font(.headline)
                        
                        Spacer()
                        
                        var prices: [Int] {
                            [user.hospitalPrice, user.textChatPrice, user.videoChatPrice, user.homePrice]
                        }
                        
                        var minPrice: Int? { prices.filter { $0 > 0 }.min()
                        }
                        
                        
                        
                        Text("от \(minPrice?.space() ?? "5") ₽")
                            .font(.system(size: 16, weight: .bold))
                        
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    
                    Spacer()
                    
                    let isDisabled = (user.specialization.first?.isModerated) == nil
                    
                    if isDisabled {
                        Button(action: {}) {
                            Text("Нет свободного расписания")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.doctorGray)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }.buttonStyle(PlainButtonStyle())
                    } else {
                        NavigationLink(destination: PriceView(viewModel: viewModel, userID: user.id)) {
                            Text("Записаться")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.doctorPink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle(user.specialization.first?.name ?? "Врач")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.mainBackground)
        }
    }
}


struct InfoView: View {
    var image: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: image)
            
            Text(text)
        }
        .foregroundColor(.gray)
    }
}
