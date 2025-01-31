//
//  BlueButton.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 30/01/2025.
//

import SwiftUI

struct BlueButton: View {
    private let shape: some Shape = {
        RoundedRectangle(cornerRadius: 16)
    }()
    
    let text: LocalizedStringResource
    let size: CGSize
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(width: size.width, height: size.height)
                .background(.blueUniversal)
                .foregroundStyle(.whiteUniversal)
                .font(.bold17)
                .contentShape(shape)
        }
        .clipShape(shape)
    }
}

#Preview {
    BlueButton(text: "Find", size: CGSize(width: 150, height: 60)) {}
}
