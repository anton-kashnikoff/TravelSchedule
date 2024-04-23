//
//  TransportOperatorInfoView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 20/04/2024.
//

import SwiftUI

struct TransportOperatorInfoView: View {
    @ObservedObject var viewModel: ScheduleViewModel
    
    var transportOperator: TransportOperator
    
    var body: some View {
        VStack(spacing: 16) {
            Image(transportOperator.image)
                .padding(.top)
            HStack {
                Text("ОАО «РЖД»")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.blackYP)
                Spacer()
            }
            .padding([.leading, .top])
            
            VStack(spacing: 0) {
                VStack {
                    HStack {
                        Text("E-mail")
                            .font(.system(size: 17))
                            .foregroundStyle(.blackYP)
                        Spacer()
                    }
                    HStack {
                        Text(transportOperator.email)
                            .font(.system(size: 12))
                            .foregroundStyle(.blueUniversal)
                        Spacer()
                    }
                }
                .frame(height: 60)
                .padding(.leading)
                
                VStack {
                    HStack {
                        Text("Телефон")
                            .font(.system(size: 17))
                            .foregroundStyle(.blackYP)
                        Spacer()
                    }
                    HStack {
                        Text(transportOperator.email)
                            .font(.system(size: 12))
                            .foregroundStyle(.blueUniversal)
                        Spacer()
                    }
                }
                .frame(height: 60)
                .padding(.leading)
            }
            Spacer()
        }
        .navigationTitle("Информация о перевозчике")
        .toolbarRole(.editor)
        .background(.whiteYP)
    }
}

#Preview {
    TransportOperatorInfoView(viewModel: ScheduleViewModel(), transportOperator: TransportOperator(
        image: "Logo RZHD",
        name: "РЖД",
        email: "i.lozgkina@yandex.ru",
        phoneNumber: "+7 (904) 329-27-71"
    ))
}
