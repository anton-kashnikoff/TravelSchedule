//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    
//    @Binding var localCurrentStoryIndex: Int
    
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
    StoriesTabView(stories: [.story2, .story3, .story4, .story5], viewModel: ScheduleViewModel())
}
