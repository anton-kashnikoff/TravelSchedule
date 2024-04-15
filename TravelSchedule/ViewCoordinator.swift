//
//  ViewCoordinator.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 15/04/2024.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
