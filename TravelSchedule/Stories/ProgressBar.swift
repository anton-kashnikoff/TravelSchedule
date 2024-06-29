//
//  ProgressBar.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct ProgressBar: View {
    let numberOfSections: Int
    let progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: Constants.progressBarCornerRadius)
                    .frame(width: geometry.size.width, height: Constants.progressBarHeight)
                    .foregroundColor(.whiteUniversal)

                RoundedRectangle(cornerRadius: Constants.progressBarCornerRadius)
                    .frame(
                        width: min(
                            progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: Constants.progressBarHeight
                    )
                    .foregroundColor(.blueUniversal)
            }
            .mask {
                MaskView(numberOfSections: numberOfSections)
            }
        }
    }
}

#Preview {
    Color.red
        .ignoresSafeArea()
        .overlay(
            ProgressBar(numberOfSections: 5, progress: 0.5)
                .padding()
        )
}
