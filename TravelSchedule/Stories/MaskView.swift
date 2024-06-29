//
//  MaskView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/06/2024.
//

import SwiftUI

struct MaskView: View {
    let numberOfSections: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

#Preview {
    Color.red
        .ignoresSafeArea()
        .overlay(
            MaskView(numberOfSections: 5)
        )
}
