//
//  ContentView.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 11.04.2025.
//

import SwiftUI

struct TabViewContent: View {
    @State var selected: Int = 0
    init() {
        UITabBar.appearance().unselectedItemTintColor = .tabGray
    }
    var body: some View {
        TabView(selection: $selected) {
            
            DoctorCardView()
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
            
            
            PriemView()
                .tag(1)
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Прием")
                }
            
            MessageView()
                .tag(2)
                .tabItem {
                    Image(systemName: "message")
                    Text("Чат")
                }
            
            ProfileView()
                .tag(3)
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
        }
        .tint(.doctorPink)
    }
}

#Preview {
    TabViewContent()
}
 
