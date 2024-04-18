//
//  SearchBar.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    @State private var isSearching = false
    
    private let placeholder = "Введите запрос"
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                HStack {
                    TextField(placeholder, text: $searchText)
                        .font(.system(size: 17))
                        .foregroundStyle(.blackYP)
                        .padding(.leading, 8)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                .onTapGesture {
                    isSearching = true
                }
                .overlay(alignment: .center) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundStyle(
                                isSearching && !searchText.isEmpty ? .blackYP : .grayUniversal
                            )
                        
                        Spacer()
                        
                        if isSearching {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.grayUniversal)
                                    .opacity(0.6)
                                    .padding(.vertical)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .foregroundStyle(.lightGrayUniversal)
                }
            }
            .frame(height: 37)
            .background(.searchBarBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(height: 37)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
