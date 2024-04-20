//
//  FiltersView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 20/04/2024.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    @State private var isYes = false
    @State private var isNo = false
    
    @State private var isMorning = false
    @State private var isDay = false
    @State private var isEvening = false
    @State private var isNight = false
    
    @Binding var path: [String]
    
    var body: some View {
        VStack {
            HStack {
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.blackYP)
                Spacer()
            }
            .padding()
            
            HStack {
                Text(viewModel.departureTime[0])
                    .font(.system(size: 17))
                    .foregroundStyle(.blackYP)
                Spacer()
                Toggle(isOn: $isMorning) {}
                .toggleStyle(CustomCheckboxToggleStyle())
            }
            .frame(height: 60)
            .padding([.leading, .trailing])
            
            HStack {
                Text(viewModel.departureTime[1])
                    .font(.system(size: 17))
                    .foregroundStyle(.blackYP)
                Spacer()
                Toggle(isOn: $isDay) {}
                .toggleStyle(CustomCheckboxToggleStyle())
            }
            .frame(height: 60)
            .padding([.leading, .trailing])
            
            HStack {
                Text(viewModel.departureTime[2])
                    .font(.system(size: 17))
                    .foregroundStyle(.blackYP)
                Spacer()
                Toggle(isOn: $isEvening) {}
                .toggleStyle(CustomCheckboxToggleStyle())
            }
            .frame(height: 60)
            .padding([.leading, .trailing])
            
            HStack {
                Text(viewModel.departureTime[3])
                    .font(.system(size: 17))
                    .foregroundStyle(.blackYP)
                Spacer()
                Toggle(isOn: $isNight) {}
                .toggleStyle(CustomCheckboxToggleStyle())
            }
            .frame(height: 60)
            .padding([.leading, .trailing])
            
            HStack {
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.blackYP)
                Spacer()
            }
            .padding()
            
            HStack {
                Text("Да")
                    .font(.system(size: 17))
                    .foregroundStyle(.blackYP)
                Spacer()
                Toggle(isOn: $isYes) {}
                .toggleStyle(RadioButtonCustomToggleStyle())
                .onChange(of: isYes) { oldValue, _ in
                    isNo = oldValue
                }
            }
            .frame(height: 60)
            .padding([.leading, .trailing])
            
            HStack {
                Text("Нет")
                    .font(.system(size: 17))
                    .foregroundStyle(.blackYP)
                Spacer()
                Toggle(isOn: $isNo) {}
                .toggleStyle(RadioButtonCustomToggleStyle())
                .onChange(of: isNo) { oldValue, _ in
                    isYes = oldValue
                }
            }
            .frame(height: 60)
            .padding([.leading, .trailing])
            
            Spacer()
            
            if isYes || isNo {
                Button {
                    path.removeLast()
                } label: {
                    Text("Применить")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.whiteUniversal)
                }
                .frame(width: 343, height: 60)
                .background(.blueUniversal)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .toolbarRole(.editor)
    }
}

#Preview {
    FiltersView(viewModel: ScheduleViewModel(), path: .constant([]))
}
