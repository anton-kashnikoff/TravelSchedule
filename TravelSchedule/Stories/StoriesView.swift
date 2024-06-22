//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesView: View {
    private var timerConfiguration: TimerConfiguration {
        .init(storiesCount: viewModel.stories.count)
    }
    
    @State private var currentProgress: CGFloat = 0
    
    @ObservedObject var viewModel: ScheduleViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(stories: viewModel.stories, viewModel: viewModel)
                .onChange(of: viewModel.currentStoryIndex) {
                    didChangeCurrentIndex(oldIndex: $0, newIndex: $1)
                }

            StoriesProgressBar(
                storiesCount: viewModel.stories.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress
            )
            .onChange(of: currentProgress) {
                didChangeCurrentProgress(newProgress: $1)
            }
        }
        .onAppear {
            currentProgress = min(
                CGFloat(viewModel.currentStoryIndex) / CGFloat(viewModel.stories.count),
                1
            )
        }
    }

    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        
        let progress = timerConfiguration.progress(for: newIndex)
        
        guard abs(progress - currentProgress) >= 0.01 else { return }
        
        currentProgress = progress
    }

    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        
        guard index != viewModel.currentStoryIndex else { return }

        viewModel.currentStoryIndex = index
    }
}

#Preview {
    StoriesView(viewModel: ScheduleViewModel())
}
