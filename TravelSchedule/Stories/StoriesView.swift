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
    
    @State var currentProgress: CGFloat
    
    @ObservedObject var viewModel: ScheduleViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(stories: viewModel.stories, viewModel: viewModel)
                .onChange(of: viewModel.currentStoryIndex) {
                    print("onChange(of index")
                    didChangeCurrentIndex(oldIndex: $0, newIndex: $1)
                }

            StoriesProgressBar(
                storiesCount: viewModel.stories.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress
            )
            .onChange(of: currentProgress) { _, newValue in
                print("onChange(of progress")
                print("NEWVALUE = \(newValue)")
                didChangeCurrentProgress(newProgress: newValue)
            }
        }
    }

    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        print("didChangeCurrentIndex")
        guard oldIndex != newIndex else { return }
        print("OLD = \(oldIndex)")
        print("NEW = \(newIndex)")
        
        let progress = timerConfiguration.progress(for: newIndex)
        
        guard abs(progress - currentProgress) >= 0.01 else { return }
        print("PROGRESS = \(progress)")
        currentProgress = progress
    }

    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != viewModel.currentStoryIndex else { return }
        print("INDEX = \(index)")
        viewModel.currentStoryIndex = index
    }
}

//#Preview {
//    StoriesView(viewModel: ScheduleViewModel())
//}
