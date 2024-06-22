//
//  StoriesMainView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/06/2024.
//

import SwiftUI

struct StoriesMainView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var path: [String]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesView(
                currentProgress: min(CGFloat(viewModel.currentStoryIndex) / CGFloat(viewModel.stories.count), 1),
                viewModel: viewModel
            )
            
            CloseButton {
                path.removeLast()
            }
            .padding(.top, 57)
            .padding(.trailing, 12)
        }
        .navigationBarBackButtonHidden()
        .background(.blackUniversal)
        .onAppear(perform: {
            print("CURRENT INDEX")
            print(viewModel.currentStoryIndex)
        })
    }
}

#Preview {
    StoriesMainView(
        viewModel: ScheduleViewModel(),
        path: .constant([])
    )
}
