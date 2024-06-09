//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void

    var body: some View {
        Button("", image: .close) {
            action()
        }
    }
}

#Preview {
    CloseButton(action: {})
}
