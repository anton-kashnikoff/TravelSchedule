//
//  SearchStationView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

struct SearchStationView: View {
    @State private var searchString = String()
    
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
    
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var path: [String]
    
    var type: DirectionType
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchString)
            if !searchString.isEmpty && searchResults.isEmpty {
                ContentUnavailableView {
                    Text("Station not found")
                        .font(.system(size: 24, weight: .bold))
                }
            } else {
                List {
                    ForEach(searchResults, id: \.self) { station in
                        HStack {
                            Text(station)
                            Spacer()
                            Image(.chevron)
                                .padding(.trailing, 18)
                        }
                        .padding(.leading)
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.addStation(direction: type, station: station)
                            path.removeAll()
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
        .navigationTitle("Station selection")
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    SearchStationView(viewModel: ScheduleViewModel(), path: .constant([]), type: .from)
}
