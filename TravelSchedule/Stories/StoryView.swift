//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoryView: View {
    let story: Story

    var body: some View {
        story.backgroundImage
            .resizable()
            .clipShape(.rect(cornerRadius: .storyCornerRadius))
            .background(.blackUniversal)
            .overlay(
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(story.title)
                            .font(.bold34)
                            .lineLimit(2)
                            .foregroundStyle(.whiteUniversal)
                        
                        Text(story.description)
                            .font(.regular20)
                            .lineLimit(3)
                            .foregroundStyle(.whiteUniversal)
                    }
                    .padding(.init(top: 0, leading: 16, bottom: 40, trailing: 16))
                }
            )
    }
}

#Preview {
    StoryView(story: .story1)
}
