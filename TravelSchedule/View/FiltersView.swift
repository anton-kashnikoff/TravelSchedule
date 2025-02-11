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
            Text("Departure time")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.blackYP)
                .frame(maxWidth: .infinity, alignment: .leading)
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

            Text("Show options with transfers")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.blackYP)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            HStack {
                Text("Yes")
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
                Text("No")
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
                BlueButton(
                    text: "Apply",
                    size: CGSize(width: 343, height: 60)
                ) { path.removeLast() }
            }
        }
        .toolbarRole(.editor)
        .background(.whiteYP)
    }
}

#Preview {
    FiltersView(viewModel: ScheduleViewModel(), path: .constant([]))
}
