//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import Foundation

final class ScheduleViewModel: ObservableObject {
    @Published var cities: [City]
    
    @Published var selectedCityFrom: City?
    @Published var selectedStationFrom: String?
    @Published var selectedCityTo: City?
    @Published var selectedStationTo: String?
    
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
            City(name: "Санкт-Петербург", stations: []),
            City(name: "Сочи", stations: []),
            City(name: "Горный воздух", stations: []),
            City(name: "Краснодар", stations: []),
            City(name: "Казань", stations: []),
            City(name: "Омск", stations: [])
        ]
    }
}
