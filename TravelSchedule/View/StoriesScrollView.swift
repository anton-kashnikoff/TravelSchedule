//
//  StoriesScrollView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(1..<4) { _ in 
                    StoryItemView(story: .story1)
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
        }
    }
}

#Preview {
    StoriesScrollView()
}
