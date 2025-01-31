//
//  ScheduleSearchView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 31/01/2025.
//

import SwiftUI

struct ScheduleSearchView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var path: [String]

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 28) {
                Text(viewModel.routeFrom ?? String(localized: "From"))
                    .foregroundStyle(
                        viewModel.selectedCityFrom == nil ? .grayUniversal : .blackUniversal
                    )
                    .onTapGesture {
                        path.append("SearchCityViewFrom")
                    }
                
                Text(viewModel.routeTo ?? String(localized: "To"))
                    .foregroundStyle(
                        viewModel.selectedCityTo == nil ? .grayUniversal : .blackUniversal
                    )
                    .onTapGesture {
                        path.append("SearchCityViewTo")
                    }
            }
            .lineLimit(1)
            .padding(.leading)
            .frame(height: 96)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.whiteUniversal)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.leading, 16)
            
            Button(action: viewModel.swapDirections) {
                Image(.swap)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .padding(.trailing, 16)
            }
        }
    }
}

#Preview {
    ScheduleSearchView(viewModel: ScheduleViewModel(), path: .constant([]))
}
