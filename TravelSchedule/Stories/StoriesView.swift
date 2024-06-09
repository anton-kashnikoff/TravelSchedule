//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesView: View {
    let stories: [Story]
    
    private var timerConfiguration: TimerConfiguration {
        .init(storiesCount: stories.count)
    }
    
    @State private var currentStoryIndex = 0
    @State private var currentProgress: CGFloat = 0

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(stories: stories, currentStoryIndex: $currentStoryIndex)
                .onChange(of: currentStoryIndex) {
                    didChangeCurrentIndex(oldIndex: $0, newIndex: $1)
                }

            StoriesProgressBar(
                storiesCount: stories.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress
            )
            .onChange(of: currentProgress) { _, newValue in
                didChangeCurrentProgress(newProgress: newValue)
            }
        }
    }

    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        
        let progress = timerConfiguration.progress(for: newIndex)
        
        guard abs(progress - currentProgress) >= 0.01 else { return }
        
//        withAnimation {
            currentProgress = progress
//        }
    }

    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        
        guard index != currentStoryIndex else { return }
        
//        withAnimation {
            currentStoryIndex = index
//        }
    }
}

#Preview {
    StoriesView(stories: [.story1, .story2, .story3])
}
