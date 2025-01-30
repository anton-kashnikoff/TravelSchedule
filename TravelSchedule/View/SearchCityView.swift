//
//  SearchCityView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

struct SearchCityView: View {
    @State private var searchString = String()
    
    private var searchResults: [City] {
        searchString.isEmpty ? viewModel.cities : viewModel.cities.filter {
            $0.name.contains(searchString)
        }
    }
    
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var path: [String]
    
    var type: DirectionType
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            if !searchString.isEmpty && searchResults.isEmpty {
                ContentUnavailableView {
                    Text(Constants.cityIsNotFoundText)
                        .font(.system(size: 24, weight: .bold))
                }
            } else {
                List {
                    ForEach(searchResults, id: \.name) { city in
                        HStack {
                            Text(city.name)
                            Spacer()
                            Image("Chevron")
                                .padding(.trailing, 18)
                        }
                        .padding(.leading)
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            switch type {
                            case .from:
                                viewModel.selectedCityFrom = city
                                path.append("SearchStationViewFrom")
                            case .to:
                                viewModel.selectedCityTo = city
                                path.append("SearchStationViewTo")
                            }
                        }
                    }
                    .background(.whiteYP)
                    .listRowInsets(
                        EdgeInsets(
                            top: .zero,
                            leading: .zero,
                            bottom: .zero,
                            trailing: .zero
                        )
                    )
                }
                .listStyle(.plain)
            }
        }
        .background(.whiteYP)
        .navigationTitle(Constants.chooseCityText)
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchCityView(
        viewModel: ScheduleViewModel(),
        path: .constant([]),
        type: .from
    )
}
