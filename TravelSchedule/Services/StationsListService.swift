//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/03/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias StationList = Components.Schemas.ListOfStations

protocol AllStationsInfoProtocol {
    func get(format: Operations.getStationsList.Input.Query.formatPayload) async throws -> StationList
}

final class AllStationsService: AllStationsInfoProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func get(format: Operations.getStationsList.Input.Query.formatPayload = .json) async throws -> StationList {
        let response = try await client.getStationsList(query: .init(apikey: apikey, format: format))
        return try response.ok.body.json
    }
}
