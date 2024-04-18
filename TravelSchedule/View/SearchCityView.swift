//
//  SearchCityView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

struct SearchCityView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @State private var searchString = ""
    
    @Binding var path: [String]
    
    var type: DirectionType
    
    private var searchResults: [City] {
        searchString.isEmpty ? viewModel.cities : viewModel.cities.filter {
            $0.name.contains(searchString)
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            if !searchString.isEmpty && searchResults.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
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
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .listStyle(.plain)
            }
        }
        .background(.whiteYP)
        .navigationTitle("Выбор города")
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchCityView(
        viewModel: ScheduleViewModel(), path: .constant([]), type: .from
    )
}
