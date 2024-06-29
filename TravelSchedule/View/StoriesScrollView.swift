//
//  StoriesScrollView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesScrollView: View {
    let stories: [Story]
    
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var currentStoryIndex: Int
    @Binding var path: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(stories) {
                    StoryItemView(
                        story: $0,
                        viewModel: viewModel,
                        currentStoryIndex: $currentStoryIndex,
                        path: $path
                    )
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoriesScrollView(
        stories: [Mocks.story1, Mocks.story2, Mocks.story3, Mocks.story4, Mocks.story5],
        viewModel: .init(),
        currentStoryIndex: .constant(0),
        path: .constant([])
    )
}
