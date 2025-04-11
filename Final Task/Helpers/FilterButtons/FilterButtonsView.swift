//
//  SwiftUIView.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 14.04.2025.
//

import SwiftUI

struct FilterButtonsView: View {
    @State var selectedFilter: FilterType = .price
    @State var sortDirection: SortDirection = .ascending

    enum FilterType: CaseIterable {
        case price, experience, rating

        var title: String {
            switch self {
            case .price: return "По цене"
            case .experience: return "По стажу"
            case .rating: return "По рейтингу"
            }
        }
    }

    enum SortDirection {
        case ascending, descending

        var rotationAngle: Double {
            switch self {
            case .ascending: return 180
            case .descending: return 0
            }
        }
    }

    var body: some View {
            HStack(spacing: 0) {
                ForEach(FilterType.allCases, id: \.self) { filter in
                    filterButton(
                        title: filter.title,
                        isSelected: selectedFilter == filter,
                        arrowRotation: selectedFilter == filter ? sortDirection.rotationAngle : 0,
                        corner: cornerFor(filter: filter)
                    )
                    .onTapGesture {
                        if selectedFilter == filter {
                            // Меняем направление сортировки
                            withAnimation {
                                sortDirection = sortDirection == .ascending ? .descending : .ascending
                            }
                        } else {
                            selectedFilter = filter
                            // Можно сбросить направление при смене типа сортировки
                            sortDirection = .descending
                        }
                    }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.1), lineWidth: 2)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
        }

    // MARK: - Кнопка
    func filterButton(
        title: String,
        isSelected: Bool,
        arrowRotation: Double = 0,
        corner: UIRectCorner = []
    ) -> some View {
        HStack(spacing: 4) {
            Text(title)
                .font(.system(size: 14, weight: .medium))

            // Только у выбранной кнопки показываем и крутим стрелку
            if isSelected {
                Image(systemName: "arrow.down")
                    .rotationEffect(.degrees(arrowRotation))
                    .animation(.easeInOut(duration: 0.3), value: arrowRotation)
            }
        }
        .foregroundColor(isSelected ? .white : .gray)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(isSelected ? Color.doctorPink : Color.white)
    }

    // MARK: - Определение скругления углов
    func cornerFor(filter: FilterType) -> UIRectCorner {
        switch filter {
        case .price: return [.topLeft, .bottomLeft]
        case .rating: return [.topRight, .bottomRight]
        default: return []
        }
    }
}

//#Preview {
//    FilterButtonsView()
//}
