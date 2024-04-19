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
        // Я не знаю, как сделать проще, чем 2 Binding
        let from = Binding<String>(get: {
            guard
                let city = viewModel.selectedCityFrom,
                let station = viewModel.selectedStationFrom
            else { return "" }
            return "\(city.name) (\(station))"
        }) { newValue in
            viewModel.selectedStationFrom = newValue
        }
        
        let to = Binding<String>(get: {
            guard
                let city = viewModel.selectedCityTo,
                let station = viewModel.selectedStationTo
            else { return "" }
            return "\(city.name) (\(station))"
        }) { newValue in
            viewModel.selectedStationTo = newValue
        }
        
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                VStack(spacing: 16) {
                    ZStack {
                        Rectangle()
                            .fill(.blueUniversal)
                            .frame(height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        HStack(spacing: 16) {
                            VStack(spacing: 28) {
                                TextField(
                                    "Откуда",
                                    text: from,
                                    prompt: Text("Откуда").foregroundStyle(.grayUniversal)
                                )
                                .foregroundStyle(.blackYP)
                                .padding(.leading)
                                .onTapGesture {
                                    path.append("SearchCityViewFrom")
                                }
                                
                                TextField(
                                    "Куда",
                                    text: to,
                                    prompt: Text("Куда").foregroundStyle(.grayUniversal)
                                )
                                .foregroundStyle(.blackYP)
                                .padding(.leading)
                                .onTapGesture {
                                    path.append("SearchCityViewTo")
                                }
                            }
                            .frame(height: 96)
                            .background(.whiteUniversal)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.leading, 16)
                            
                            Button {
                                let temp = viewModel.selectedStationFrom
                                viewModel.selectedStationFrom = viewModel.selectedStationTo
                                viewModel.selectedStationTo = temp
                            } label: {
                                Image("Сhange")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    Button("Найти") {
                        path.append("TransportView")
                    }
                    .frame(width: 150, height: 60)
                    .background(.blueUniversal)
                    .foregroundStyle(.whiteUniversal)
                    .font(.system(size: 17, weight: .bold))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
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
                    TransportView(viewModel: viewModel)
                }
            }
        }
        .background(.whiteYP)
    }
}

#Preview {
    ScheduleView(viewModel: ScheduleViewModel())
}
