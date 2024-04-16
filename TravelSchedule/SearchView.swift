//
//  SearchView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = ScheduleViewModel()
    
    @State private var searchString = ""
    
    private var searchResults: [String] {
        searchString.isEmpty ? viewModel.cities : viewModel.cities.filter {
            $0.contains(searchString)
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
                    ForEach(searchResults, id: \.self) { city in
                        HStack {
                            Text(city)
                            Spacer()
                            Image("Chevron")
                                .padding(.trailing, 18)
                        }
                        .frame(height: 60)
                        .listRowSeparator(.hidden)
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
    SearchView()
}
