//
//  StoryItemView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoryItemView: View {
    private let cornerRadius: CGFloat = 16
    
    @State private var isTapped = false
    
    let story: Story
    
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var currentStoryIndex: Int
    @Binding var path: [String]
    
    var body: some View {
        Image("Story\(story.id + 1)")
            .resizable()
            .frame(width: 92, height: 140)
            .clipShape(.rect(cornerRadius: cornerRadius))
            .opacity(isTapped ? 0.5 : 1)
            .overlay {
                if !isTapped {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(.blueUniversal, lineWidth: 4)
                }
            }
            .overlay {
                Text(story.title)
                    .font(.regular12)
                    .lineLimit(3)
                    .foregroundStyle(.whiteUniversal)
                    .padding(.init(top: 83, leading: 8, bottom: 12, trailing: 8))
            }
            .onTapGesture {
                isTapped = true
                currentStoryIndex = story.id
                path.append("StoryItemView")
            }
            .onChange(of: viewModel.viewedStories) { _, viewedStories in
                isTapped = viewedStories.contains {
                    $0.id == story.id
                }
            }
    }
}

#Preview {
    StoryItemView(
        story: Mocks.story1,
        viewModel: .init(),
        currentStoryIndex: .constant(0),
        path: .constant([])
    )
}
