//
//  SearchStationView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

struct SearchStationView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @State private var searchString = ""
    
    @Binding var path: [String]
    
    private var searchResults: [String] {
        if let stations = viewModel.selectedCity?.stations {
            return searchString.isEmpty ? stations : stations.filter {
                $0.contains(searchString)
            }
        }
        return []
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            if !searchString.isEmpty && searchResults.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                List {
                    ForEach(searchResults, id: \.self) { station in
                        HStack {
                            Text(station)
                            Spacer()
                            Image("Chevron")
                                .padding(.trailing, 18)
                        }
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedStation = station
                            path.removeAll()
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Выбор станции")
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchStationView(viewModel: ScheduleViewModel(), path: .constant([]))
}
