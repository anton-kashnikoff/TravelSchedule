//
//  TransportView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 19/04/2024.
//

import SwiftUI

struct TransportView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @Binding var path: [String]
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    Text(viewModel.routeString)
                        .frame(alignment: .leading)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.blackUniversal)
                        .padding(.leading, 16)
                    Spacer()
                }
                List {
                    ForEach(viewModel.getListOfRoutes()) { route in
                        VStack(spacing: 18) {
                            HStack(spacing: 8) {
                                Image(route.icon)
                                VStack(spacing: 2) {
                                    HStack {
                                        Text(route.transportOperator)
                                            .font(.system(size: 17))
                                            .foregroundStyle(.blackUniversal)
                                        Spacer()
                                        Text(DateCreator.getDateString(from: route.departureDate))
                                            .font(.system(size: 12))
                                            .foregroundStyle(.blackUniversal)
                                    }
                                    
                                    if let info = route.info {
                                        HStack {
                                            Text(info)
                                                .font(.system(size: 12))
                                                .foregroundStyle(.redUniversal)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 14)
                            .padding(.trailing, 7)
                            
                            HStack(spacing: 5) {
                                Text(DateCreator.getTime(from: route.departureDate))
                                    .font(.system(size: 17))
                                    .foregroundStyle(.blackUniversal)
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(.grayUniversal)
                                Text(DateCreator.getAmountOfHoursFrom(startDate: route.departureDate, endDate: route.arrivalDate))
                                    .font(.system(size: 12))
                                    .foregroundStyle(.blackUniversal)
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundStyle(.grayUniversal)
                                Text(DateCreator.getTime(from: route.arrivalDate))
                                    .font(.system(size: 17))
                                    .foregroundStyle(.blackUniversal)
                            }
                            .padding([.leading, .trailing], 14)
                        }
                        .frame(height: 104)
                        .listRowSeparator(.hidden)
                    }
                    .background(.lightGrayUniversal)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                }
                .listStyle(.plain)
                .background(.whiteYP)
                .scrollContentBackground(.hidden)
            }
            .background(.whiteYP)
            .toolbarRole(.editor)
            
            VStack {
                Spacer()
                Button {
                    path.append("FiltersView")
                } label: {
                    Text("Уточнить время")
                        .foregroundStyle(.whiteUniversal)
                        .font(.system(size: 17, weight: .bold))
                }
                .frame(width: 343, height: 60)
                .background(.blueUniversal)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    TransportView(viewModel: ScheduleViewModel(), path: .constant([]))
}
