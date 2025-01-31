//
//  DateCreator.swift
//  TravelSchedule
//
//  Created by Антон Кашников on 19/04/2024.
//

import Foundation

final class DateCreator {
    static func createDateFor(day: Int, month: Int, hour: Int, minute: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = 2024
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        guard let someDate = Calendar(identifier: .gregorian).date(from: dateComponents) else { return .now }
        return someDate
    }
    
    static func getTime(from date: Date) -> String {
        "\(Calendar.current.component(.hour, from: date)):\(Calendar.current.component(.minute, from: date))"
    }
    
    static func getAmountOfHoursFrom(startDate: Date, endDate: Date) -> String {
        "\(Int((endDate - startDate) / 3600)) часов"
    }
    
    static func getDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: date)
    }
}

extension Date {
    static func -(lhs: Date, rhs: Date) -> TimeInterval {
        lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
