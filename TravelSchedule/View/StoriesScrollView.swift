//
//  StoriesScrollView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesScrollView: View {
    let stories: [Story]
    
    @Binding var currentStoryIndex: Int
    @Binding var path: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(stories) {
                    StoryItemView(
                        story: $0,
                        currentStoryIndex: $currentStoryIndex,
                        path: $path
                    )
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
        }
    }
}

#Preview {
    StoriesScrollView(
        stories: [.story1, .story2, .story3], 
        currentStoryIndex: .constant(0), 
        path: .constant([])
    )
}
