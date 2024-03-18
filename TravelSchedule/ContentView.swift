//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 29/02/2024.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            stationsList()
        }
    }
    
    func search() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = RoutesSearchService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let stations = try await service.search(from: "c146", to: "c213")
                print(stations)
            } catch {
                print("request failed: \(error)")
            }
        }
    }
    
    func stationsList() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = AllStationsService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let stations = try await service.getListOfAllStations()
                print("stations: \(stations)")
            } catch {
                print("request failed: \(error)")
            }
        }
    }
    
    func allStations() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = NearestStationsService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                print(stations)
            } catch {
                print("request failed: \(error)")
            }
        }
    }
    
    func carrier() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = CarrierSearchService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let thread = try await service.search(code: "MS", system: .iata)
                print(thread)
            } catch {
                print("Error fetching thread: \(error)")
            }
        }
    }
    
    func thread() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = ThreadSearchService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let thread = try await service.search(uid: "176YE_7_2")
                print(thread)
            } catch {
                print("Error fetching thread: \(error)")
            }
        }
    }
    
    func stations() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )

        let service = ScheduleSearchService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let result = try await service.search(station: "s9600216", date: "2024-03-08")
                print(result)
            } catch {
                print("Error fetching stations: \(error)")
            }
        }
    }
    
    func settlement() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = NearestSettlementService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let result = try await service.getNearestSettlement(lat:59.864177, lng: 30.319163)
                print(result)
            } catch {
                print("Error fetching stations: \(error)")
            }
        }
    }
    
    func copyright() {
        let client = Client(
            serverURL: try! Servers.server1(),
            transport: URLSessionTransport()
        )
        
        let service = CopyrightService(
            client: client,
            apikey: "7d220a15-1afd-4a2a-871d-cd218423f194"
        )
        
        Task {
            do {
                let result = try await service.get()
                print(result)
            } catch {
                print("Error fetching stations: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
