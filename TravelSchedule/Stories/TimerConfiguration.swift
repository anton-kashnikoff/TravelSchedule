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
        let min = min(CGFloat(storyIndex) / CGFloat(storiesCount), 1)
        print("progressmin = \(min)")
        return min
    }

    func index(for progress: CGFloat) -> Int {
        let min1 = Int(progress * CGFloat(storiesCount))
        print("MIN1 = \(min1)")
        let min2 = storiesCount - 1
        print("MIN2 = \(min2)")
        let min = min(min1, min2)
        print("MIN = \(min)")
        return min
    }

    func nextProgress(progress: CGFloat) -> CGFloat {
        min(progress + progressPerTick, 1)
    }
}
