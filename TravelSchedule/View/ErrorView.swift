//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 17/04/2024.
//

import SwiftUI

struct ErrorView: View {
    @Binding var errorType: ErrorType
    
    var body: some View {
        VStack {
            switch errorType {
            case .serverError:
                Image(.serverError)
                Text("Ошибка сервера")
                    .font(.system(size: 24, weight: .bold))
            case .noInternetConnection:
                Image(.noInternet)
                Text("Нет интернета")
                    .font(.system(size: 24, weight: .bold))
            }
            
        }
    }
}

#Preview {
    ErrorView(errorType: .constant(.noInternetConnection))
}
