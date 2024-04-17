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
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedCity = city
                            path.append("SearchStationView")
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Выбор города")
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchCityView(
        viewModel: ScheduleViewModel(), path: .constant([])
    )
}
