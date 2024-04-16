//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScheduleViewModel()
    
    var body: some View {
        NavigationStack {
            TabView {
                ScheduleView(viewModel: viewModel)
                    .tabItem {
                        Image("Schedule")
                            .renderingMode(.template)
                    }
                
                Color.blue.edgesIgnoringSafeArea(.top)
                    .tabItem {
                        Image("Settings")
                            .renderingMode(.template)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
