//
//  MaskFragmentView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/06/2024.
//

import SwiftUI

struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.progressBarCornerRadius)
            .frame(height: Constants.progressBarHeight)
            .foregroundStyle(.whiteUniversal)
    }
}

#Preview {
    Color
        .red
        .ignoresSafeArea()
        .overlay {
            MaskFragmentView()
        }
}
