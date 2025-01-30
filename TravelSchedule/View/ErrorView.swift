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
        switch errorType {
        case .serverError:
            ContentUnavailableView(Constants.serverErrorText, image: "Server Error")
        case .noInternetConnection:
            ContentUnavailableView(Constants.internetErrorText, image: "No Internet")
        }
    }
}

#Preview {
    ErrorView(errorType: .constant(.noInternetConnection))
}
