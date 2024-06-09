//
//  StoriesMainView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesMainView: View {
    let stories: [Story]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(stories: stories)
            
            CloseButton {
                print("Close Story")
            }
            .padding(.top, 57)
            .padding(.trailing, 12)
        }
    }
}

#Preview {
    StoriesMainView(stories: [.story1, .story2, .story3])
}
