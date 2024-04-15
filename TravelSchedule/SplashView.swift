//
//  SplashView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 15/04/2024.
//

import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        Image("Splash Screen")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeIn(duration: 0.7)) {}
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
    }
}

