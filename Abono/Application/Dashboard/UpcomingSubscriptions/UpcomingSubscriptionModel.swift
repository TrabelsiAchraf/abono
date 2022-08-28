//
//  UpcomingSubscriptionModel.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import Foundation
import SwiftUI

struct UpcomingSubscriptionModel: Decodable, Equatable {
    let name: String
    let icon: String
    let amount: String
    let category: String
    let paymentDate: Date
}

// MARK: - TDO

extension UpcomingSubscriptionModel {
    func map() -> UpcomingSubscriptionDataView {
        UpcomingSubscriptionDataView(
            id: UUID(),
            name: name,
            icon: icon,
            amount: amount,
            category: getCategory(from: category),
            leftDays: getLeftDays(from: paymentDate)
        )
    }
    
    private func getCategory(from categoryStr: String) -> SubscriptionCategory {
        switch categoryStr {
        case "Entertainment":
            return .entertainment
        case "Photo":
            return .photo
        case "Video":
            return .video
        case "E-Commerce":
            return .eCommerce
        case "Education":
            return .education
        case "Food & Drinks":
            return .food
        case "Music":
            return .music
        case "Transportation":
            return .transportation
        case "Games":
            return .games
        default:
            return .other
        }
    }
    
    private func getLeftDays(from date: Date) -> UpcomingSubscriptionDataView.LeftDays {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: date)
        let date2 = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        let days = components.day ?? 0
        
        let progressValue: Float = (Float(days)/31.0)
        let leftDaysValue: String = "\(days)"
        return UpcomingSubscriptionDataView.LeftDays(
            progressValue: progressValue,
            progressColor: getLeftDaysColor(from: progressValue),
            text: leftDaysValue
        )
    }
    
    private func getLeftDaysColor(from progressValue: Float) -> Color {
        if progressValue > 0.7 {
            return .currentPaidHeader
        }
        else if progressValue >= 0.5 {
            return .yellow
        }
        else if progressValue < 0.5 {
            return .red
        }
        else {
            return .gray
        }
    }
}

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
