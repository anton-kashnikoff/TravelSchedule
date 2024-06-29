//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    
    @ObservedObject var viewModel: ScheduleViewModel

    var body: some View {
        TabView(selection: $viewModel.currentStoryIndex) {
            ForEach(stories) { story in
                StoryView(story: story)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    private func didTapStory() {
        viewModel.currentStoryIndex = min(viewModel.currentStoryIndex + 1, stories.count - 1)
    }
}

#Preview {
    StoriesTabView(
        stories: [Mocks.story2, Mocks.story3, Mocks.story4, Mocks.story5], 
        viewModel: ScheduleViewModel()
    )
}
