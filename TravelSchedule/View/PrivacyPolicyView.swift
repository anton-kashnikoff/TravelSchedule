//
//  PrivacyPolicyView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 20/04/2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        let width: CGFloat? = {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            return scene?.screen.bounds.width
        }()
        
        VStack(spacing: 8) {
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
            .padding([.leading, .trailing], 8)
            Spacer()
        }
        .frame(width: width)
        .navigationTitle(Constants.privacyPolicyText)
        .background(.whiteYP)
    }
}

#Preview {
    PrivacyPolicyView()
}
