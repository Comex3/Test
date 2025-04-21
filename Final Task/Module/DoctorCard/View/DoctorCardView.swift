//
//  DoctorsListView.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import SwiftUI

struct DoctorCardView: View {
    @State private var navigation = false
    @State private var sUserID: String?
    private var viewModel = ViewModel(network: NetworkManager())
    @State private var searchText: String = ""
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.checkData
        } else {
            let words = searchText.lowercased().split(separator: " ").map { String($0) }

            return viewModel.checkData.filter { user in
                let firstName = user.firstName.lowercased()
                let lastName = user.lastName.lowercased() 
                let speciality = user.specialization.first?.name.lowercased() ?? ""

                let fields: [String] = [firstName, lastName, speciality]

                return words.allSatisfy { word in
                    fields.contains(where: { $0.contains(word) })
                }
            }
        }
    }

    
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.checkData
        } else {
            let words = searchText.lowercased().split(separator: " ").map { String($0) }

            return viewModel.checkData.filter { user in
                let firstName = user.firstName.lowercased()
                let lastName = user.lastName.lowercased() 
                let speciality = user.specialization.first?.name.lowercased() ?? ""

                let fields: [String] = [firstName, lastName, speciality]

                return words.allSatisfy { word in
                    fields.contains(where: { $0.contains(word) })
                }
            }
        }
    }

    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading) {
                        TextField("Поиск", text: $searchText)
                            .frame(height: 44)
                            .padding(.horizontal, 37)
                            .background(Color.white)
                            .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
                            .clipShape(.rect(cornerRadius: 10))
                            .padding(.horizontal, 16)
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 27)
                            .padding(.vertical, -38)
                    }
                    
                    FilterButtonsView(viewModel: viewModel)
                    
                    LazyVStack() {
                        ForEach(filteredUsers) { user in
                            DoctorCell(user: user) {
                                sUserID = user.id
                                navigation = true
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                    }
                    .padding(.top)
                    .navigationTitle("Врачи")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .background(Color.mainBackground)
            .navigationDestination(isPresented: $navigation) {
                if let id = sUserID {
                    DetailView(viewModel: viewModel, userID: id)
                } else {
                    EmptyView()
                }
            }
        }
        
    }
}

#Preview {
    DoctorCardView()
}


