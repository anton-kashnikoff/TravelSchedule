//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/03/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias StationList = Components.Schemas.ListOfStations

protocol AllStationsInfoProtocol {
    func getListOfAllStations() async throws -> StationList
}

final class AllStationsService: AllStationsInfoProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getListOfAllStations() async throws -> StationList {
        let response = try await client.getStationsList(query: .init(apikey: apikey))
        let httpBody = try response.ok.body.html
        let data = try await Data(collecting: httpBody, upTo: 100 * 1024 * 1024)
        return try JSONDecoder().decode(StationList.self, from: data)
    }
}
