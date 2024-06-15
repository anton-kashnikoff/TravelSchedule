//
//  StoriesTabView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesTabView: View {
    let stories: [Story]
    
    @Binding var localCurrentStoryIndex: Int

    var body: some View {
        TabView(selection: $localCurrentStoryIndex) {
            ForEach(stories) { story in
                StoryView(story: story)
                    .onTapGesture {
                        didTapStory()
                    }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear {
            print("TABVIEW")
            print(stories)
            print(localCurrentStoryIndex)
        }
    }

    private func didTapStory() {
        localCurrentStoryIndex = min(localCurrentStoryIndex + 1, stories.count - 1)
    }
}

#Preview {
    StoriesTabView(stories: [.story2, .story3], localCurrentStoryIndex: .constant(0))
}
