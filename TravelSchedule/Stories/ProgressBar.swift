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
                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(width: geometry.size.width, height: .progressBarHeight)
                    .foregroundColor(.whiteUniversal)

                RoundedRectangle(cornerRadius: .progressBarCornerRadius)
                    .frame(
                        width: min(
                            progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: .progressBarHeight
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

private struct MaskView: View {
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

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: .progressBarCornerRadius)
//            .fixedSize(horizontal: false, vertical: true)
            .frame(height: .progressBarHeight)
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
