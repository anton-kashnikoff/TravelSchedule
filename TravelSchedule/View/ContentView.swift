//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScheduleViewModel()
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    
    var body: some View {
        NavigationStack {
            TabView {
                ScheduleView(viewModel: viewModel)
                    .tabItem {
                        Image("Schedule")
                    }
                
                SettingsView(darkModeEnabled: $darkModeEnabled)
                    .tabItem {
                        Image("Settings")
                    }
            }
            .tint(.accent)
            .onAppear {
                ThemeManager.shared.handleTheme(darkMode: darkModeEnabled)
            }
        }
    }
}

#Preview {
    ContentView()
}
