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
    
    var type: DirectionType
    
    private var searchResults: [String] {
        let city = switch type {
        case .from:
            viewModel.selectedCityFrom
        case .to:
            viewModel.selectedCityTo
        }
        
        if let stations = city?.stations {
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
                        .padding(.leading)
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            switch type {
                            case .from:
                                viewModel.selectedStationFrom = station
                                path.removeAll()
                            case .to:
                                viewModel.selectedStationTo = station
                                path.removeAll()
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
        .navigationTitle("Выбор станции")
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchStationView(viewModel: ScheduleViewModel(), path: .constant([]), type: .from)
}
