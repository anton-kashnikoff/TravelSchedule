//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/02/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScheduleViewModel()
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    
    func stations() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = NearestStationsService(
            client: client,
            apikey: apiKey
        )
        
        Task {
            let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            print(stations)
        }
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                ScheduleView(viewModel: viewModel)
                    .tabItem {
                        Image(.schedule)
                    }
                
                SettingsView(darkModeEnabled: $darkModeEnabled)
                    .tabItem {
                        Image(.settings)
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
