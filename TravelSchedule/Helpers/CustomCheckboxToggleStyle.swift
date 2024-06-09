//
//  CustomCheckboxToggleStyle.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 20/04/2024.
//

import SwiftUI

struct CustomCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(configuration.isOn ? "Checkbox On" : "Checkbox Off")
        }
    }
}
