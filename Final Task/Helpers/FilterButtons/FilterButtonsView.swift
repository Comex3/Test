//
//  SwiftUIView.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 14.04.2025.
//

import SwiftUI

struct FilterButtonsView: View {
    @Bindable var viewModel: ViewModel
    @State private var selectedFilter: FilterType = .price
    @State private var sortDirection: SortDirection = .ascending

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

        mutating func toggle() {
            self = self == .ascending ? .descending : .ascending
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
                        withAnimation {
                            sortDirection.toggle()
                        }
                    } else {
                        selectedFilter = filter
                        sortDirection = .descending
                    }
                    sortUsers()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(0.1), lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
        .onAppear {
            sortUsers()
        }
    }
    

    private func sortUsers() {
        switch selectedFilter {
        case .price:
            viewModel.users.sort {
                let left = $0.minPrice ?? Int.max
                let right = $1.minPrice ?? Int.max
                return sortDirection == .ascending ? left < right : left > right
            }
        case .experience:
            viewModel.users.sort {
                sortDirection == .ascending
                    ? $0.category < $1.category
                    : $0.category > $1.category
            }
        case .rating:
            viewModel.users.sort {
                sortDirection == .ascending
                    ? $0.rank < $1.rank
                    : $0.rank > $1.rank
            }
        }
    }

    private func filterButton(
        title: String,
        isSelected: Bool,
        arrowRotation: Double = 0,
        corner: UIRectCorner = []
    ) -> some View {
        HStack(spacing: 4) {
            Text(title)
                .font(.system(size: 14, weight: .medium))

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

    private func cornerFor(filter: FilterType) -> UIRectCorner {
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
