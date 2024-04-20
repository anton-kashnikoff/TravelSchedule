//
//  Route.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 19/04/2024.
//

import Foundation

struct Route: Identifiable {
    let id = UUID()
    let transportOperator: TransportOperator
    let icon: String
    let departureDate: Date
    let arrivalDate: Date
    let info: String?
}
