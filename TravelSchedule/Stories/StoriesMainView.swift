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
                viewModel: viewModel
            )

            Button {
                path.removeLast()
            } label: {
                Image(.close)
            }
            .padding(.top, 57)
            .padding(.trailing, 12)
        }
        .navigationBarBackButtonHidden()
        .background(.blackUniversal)
    }
}

#Preview {
    StoriesMainView(
        viewModel: ScheduleViewModel(),
        path: .constant([])
    )
}
