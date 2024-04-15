//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Image("Schedule")
                        .renderingMode(.template)
                }
                .border(.shadow)
                .ignoresSafeArea(edges: [.top, .leading, .trailing])
            
            Color.blue.edgesIgnoringSafeArea(.top)
                .tabItem {
                    Image("Settings")
                        .renderingMode(.template)
                }
                .border(.shadow)
            
        }
    }
}

#Preview {
    ContentView()
}
