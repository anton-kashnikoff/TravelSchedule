//
//  TimerConfiguration.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import Foundation

struct TimerConfiguration {
    let storiesCount: Int
    let timerTickInternal: TimeInterval
    let progressPerTick: CGFloat

    init(
        storiesCount: Int,
        secondsPerStory: TimeInterval = 5,
        timerTickInternal: TimeInterval = 0.25
    ) {
        self.storiesCount = storiesCount
        self.timerTickInternal = timerTickInternal
        progressPerTick = 1 / CGFloat(storiesCount) / secondsPerStory * timerTickInternal
    }
}

extension TimerConfiguration {
    func progress(for storyIndex: Int) -> CGFloat {
        min(CGFloat(storyIndex) / CGFloat(storiesCount), 1)
    }

    func index(for progress: CGFloat) -> Int {
        min(Int(progress * CGFloat(storiesCount)), storiesCount - 1)
    }

    func nextProgress(progress: CGFloat) -> CGFloat {
        min(progress + progressPerTick, 1)
    }
}
