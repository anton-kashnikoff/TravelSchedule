//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    
    @Binding var currentStoryIndex: Int

    var body: some View {
        TabView(selection: $currentStoryIndex) {
            ForEach(stories) {
                StoryView(story: $0)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }

    private func didTapStory() {
        currentStoryIndex = min(currentStoryIndex + 1, stories.count - 1)
    }
}

#Preview {
    StoriesTabView(stories: [.story1, .story2, .story3], currentStoryIndex: .constant(0))
}
