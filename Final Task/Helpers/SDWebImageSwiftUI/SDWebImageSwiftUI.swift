//
//  SDWebImageSwiftUI.swift
//  Final Task
//
//  Created by Кирилл Мазепин on 28.04.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageSwiftUI: View {
    var image: String?
    var body: some View {
        WebImage(url: URL(string: image ?? "nil")) { image in
            image.resizable()
            } placeholder: {
                Circle().foregroundStyle(.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
            }
            .onSuccess { _,_,_  in
                print("Изображение успешно загружено")
                }
            .onFailure { error in
                print("Ошибка загрузки: \(error)")
                if let sdError = error as? SDWebImageError {
                    print("Код ошибки SDWebImage: \(sdError.errorCode)")
                }
            }
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
    }
}

#Preview {
    SDWebImageSwiftUI()
}
