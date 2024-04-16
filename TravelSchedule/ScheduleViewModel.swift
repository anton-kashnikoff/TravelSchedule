//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 16/04/2024.
//

import Foundation

final class ScheduleViewModel: ObservableObject {
    @Published var cities: [String]
    
    init() {
        self.cities = ["Москва", "Санкт-Петербург", "Сочи", "Горный воздух", "Краснодар", "Казань", "Омск"]
    }
}
