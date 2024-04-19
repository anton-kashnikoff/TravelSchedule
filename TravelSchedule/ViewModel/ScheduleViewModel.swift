//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import SwiftUI

final class ScheduleViewModel: ObservableObject {
    @Published var cities: [City]
    
    @Published var selectedCityFrom: City?
    @Published var selectedStationFrom: String?
    @Published var selectedCityTo: City?
    @Published var selectedStationTo: String?
    
    var routeString: String {
        guard let selectedCityFrom, let selectedCityTo, let selectedStationFrom, let selectedStationTo else { return "" }
        return "\(selectedCityFrom.name) (\(selectedStationFrom)) -> \(selectedCityTo.name) (\(selectedStationTo))"
    }
    
    init() {
        cities = [
            City(
                name: "Москва",
                stations: [
                    "Киевский вокзал",
                    "Курский вокзал",
                    "Ярославский вокзал",
                    "Белорусский вокзал",
                    "Савеловский вокзал",
                    "Ленинградский вокзал"
                ]
            ),
            City(
                name: "Санкт-Петербург",
                stations: [
                    "Московский вокзал",
                    "Ладожский вокзал",
                    "Балтийский вокзал"
                ]
            ),
            City(name: "Сочи", stations: []),
            City(name: "Горный воздух", stations: []),
            City(name: "Краснодар", stations: []),
            City(name: "Казань", stations: []),
            City(name: "Омск", stations: [])
        ]
    }
    
    func getListOfRoutes() -> [Route] {
        [
            Route(
                transportOperator: "РЖД",
                icon: "RZHD",
                departureDate: DateCreator.createDateFor(day: 14, month: 1, hour: 22, minute: 30),
                arrivalDate: DateCreator.createDateFor(day: 16, month: 1, hour: 8, minute: 15),
                info: "С пересадкой в Костроме"
            ),
            Route(
                transportOperator: "ФГК",
                icon: "FGK",
                departureDate: DateCreator.createDateFor(day: 15, month: 1, hour: 1, minute: 15),
                arrivalDate: DateCreator.createDateFor(day: 15, month: 1, hour: 9, minute: 0),
                info: nil
            ),
            Route(
                transportOperator: "Урал логистика",
                icon: "Ural",
                departureDate: DateCreator.createDateFor(day: 16, month: 1, hour: 12, minute: 30),
                arrivalDate: DateCreator.createDateFor(day: 16, month: 1, hour: 21, minute: 0),
                info: nil
            )
        ]
    }
}
