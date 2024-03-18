//
//  ThreadService.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 09/03/2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Thread = Components.Schemas.SingleThread

protocol ThreadSearchProtocol {
    func search(uid: String) async throws -> Thread
}

final class ThreadSearchService: ThreadSearchProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func search(uid: String) async throws -> Thread {
        let response = try await client.getThread(query: .init(apikey: apikey, uid: uid))
        return try response.ok.body.json
    }
}
