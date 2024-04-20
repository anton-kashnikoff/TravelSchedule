//
//  PrivacyPolicyView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 20/04/2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack {
            Text("Оферта на оказание образовательных услуг дополнительного образования Яндекс.Практикум для физических лиц")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.blackYP)
            Text(
                """
                Данный документ является действующим, если расположен по адресу: https://yandex.ru/legal/practicum_offer
                
                Российская Федерация, город Москва
                """
            )
            .font(.system(size: 17))
            .foregroundStyle(.blackYP)
            .padding(.top, 8)
            Spacer()
        }
        .navigationTitle("Пользовательское соглашение")
    }
}

#Preview {
    PrivacyPolicyView()
}
