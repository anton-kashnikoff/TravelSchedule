//
//  FiltersView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 20/04/2024.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @State var isOn = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.blackYP)
                Spacer()
            }
            .padding()
            
            List {
                ForEach(viewModel.departureTime, id: \.self) { time in
                    HStack {
                        Text(time)
                            .font(.system(size: 17))
                            .foregroundStyle(.blackYP)
                        Spacer()
                        Toggle(isOn: $isOn) {
                        }
                        .toggleStyle(CustomCheckboxToggleStyle())
                    }
                }
                .frame(height: 60)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .frame(maxHeight: 240)
            .listStyle(.plain)
            .background(.whiteYP)
            .scrollDisabled(true)
            
            HStack {
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.blackYP)
                Spacer()
            }
            .padding()
            
            List {
                ForEach(viewModel.transfers, id: \.self) { transfer in
                    HStack {
                        Text(transfer)
                            .font(.system(size: 17))
                            .foregroundStyle(.blackYP)
                        Spacer()
                        Toggle(isOn: $isOn) {
                        }
                        .toggleStyle(RadioButtonCustomToggleStyle())
                    }
                }
                .frame(height: 60)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            .frame(maxHeight: 120)
            .listStyle(.plain)
            .background(.whiteYP)
            .scrollDisabled(true)
            
            Spacer()
        }
        .toolbarRole(.editor)
    }
}

#Preview {
    FiltersView(viewModel: ScheduleViewModel())
}
