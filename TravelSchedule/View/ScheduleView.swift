//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 15/04/2024.
//

import SwiftUI

struct ScheduleView: View {
    @State private var path = [String]()
    
    @ObservedObject var viewModel: ScheduleViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                StoriesScrollView(
                    stories: viewModel.stories,
                    viewModel: viewModel,
                    currentStoryIndex: $viewModel.currentStoryIndex,
                    path: $path
                )
                
                VStack(spacing: 16) {
                    ZStack {
                        Rectangle()
                            .fill(.blueUniversal)
                            .frame(height: 128)
                            .clipShape(.rect(cornerRadius: 20))
                        
                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 28) {
                                Text(viewModel.routeFrom ?? Constants.fromText)
                                    .foregroundStyle(
                                        viewModel.selectedCityFrom == nil ? .grayUniversal : .blackUniversal
                                    )
                                    .onTapGesture {
                                        path.append("SearchCityViewFrom")
                                    }
                                
                                Text(viewModel.routeTo ?? Constants.toText)
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
                                Image("Сhange")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    BlueButton(
                        text: Constants.findButtonText,
                        size: CGSize(width: 150, height: 60)
                    ) { path.append("TransportView") }
                    .opacity(
                        (viewModel.selectedStationFrom == nil ||
                         viewModel.selectedStationTo == nil) ? 0 : 1
                    )
                }
                
                Spacer()
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundStyle(.black.opacity(0.3))
            }
            .navigationDestination(for: String.self) { id in
                if id == "SearchCityViewFrom" {
                    SearchCityView(viewModel: viewModel, path: $path, type: .from)
                } else if id == "SearchCityViewTo" {
                    SearchCityView(viewModel: viewModel, path: $path, type: .to)
                } else if id == "SearchStationViewFrom" {
                    SearchStationView(viewModel: viewModel, path: $path, type: .from)
                } else if id == "SearchStationViewTo" {
                    SearchStationView(viewModel: viewModel, path: $path, type: .to)
                } else if id == "TransportView" {
                    TransportView(viewModel: viewModel, path: $path)
                } else if id == "FiltersView" {
                    FiltersView(viewModel: viewModel, path: $path)
                } else if id == "StoryItemView" {
                    StoriesMainView(viewModel: viewModel, path: $path)
                } else if id == "TransportOperatorInfoViewRZHD" {
                    TransportOperatorInfoView(
                        viewModel: viewModel,
                        transportOperator: .init(
                            image: "Logo RZHD",
                            name: "РЖД",
                            email: "i.lozgkina@yandex.ru",
                            phoneNumber: "+7 (904) 329-27-71"
                        )
                    )
                }
            }
        }
        .background(.whiteYP)
        .tint(.accent)
    }
}

#Preview {
    ScheduleView(viewModel: ScheduleViewModel())
}
